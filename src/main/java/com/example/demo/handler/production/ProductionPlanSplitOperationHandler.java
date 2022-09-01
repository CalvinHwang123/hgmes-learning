package com.example.demo.handler.production;

import cn.hutool.core.util.ObjectUtil;
import com.example.demo.model.material.MaterialBOM;
import com.example.demo.model.material.ProcessRoute;
import com.example.demo.model.production.ProductionPlan;
import com.example.demo.model.production.ProductionPlanSplit;
import com.example.demo.model.production.WorkOrder;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;
import xyz.erupt.annotation.fun.OperationHandler;
import xyz.erupt.core.util.EruptSpringUtil;
import xyz.erupt.jpa.dao.EruptDao;

import java.math.BigDecimal;
import java.util.List;

/**
 * @author 一只闲鹿
 */
@Service
public class ProductionPlanSplitOperationHandler implements OperationHandler<ProductionPlan, ProductionPlanSplit> {

    @Modifying
    @Transactional(rollbackFor = Exception.class)
    @Override
    public String exec(List<ProductionPlan> data, ProductionPlanSplit productionPlanSplit, String[] param) {
        ProductionPlan productionPlan = data.get(0);
        // 校验一：本次拆解数量 <= 生产计划表计划数量-所有已拆解工单计划数量求和
        // 计划数量
        String planNumber = productionPlan.getPlanNumber();
        BigDecimal planNumberBd = new BigDecimal(planNumber);
        EruptDao eruptDao = EruptSpringUtil.getBean(EruptDao.class);
        List<WorkOrder> workOrders = eruptDao.queryEntityList(WorkOrder.class, "productionPlan.id=" + productionPlan.getId());
        // 已拆解工单计划数量求和
        BigDecimal splitNumberSumBd = BigDecimal.ZERO;
        if (!CollectionUtils.isEmpty(workOrders)) {
            for (WorkOrder workOrder : workOrders) {
                splitNumberSumBd = splitNumberSumBd.add(new BigDecimal(workOrder.getPlanNumber()));
            }
        }
        // 剩余可拆解数量
        BigDecimal restCanSplitNumberBd = planNumberBd.subtract(splitNumberSumBd);
        // 本次拆解数量
        BigDecimal thisSplitNumber = new BigDecimal(productionPlanSplit.getSplitNumber());
        if (thisSplitNumber.compareTo(restCanSplitNumberBd) > 0) {
            throw new RuntimeException("操作失败：可拆解数量为：" + restCanSplitNumberBd.toString() + "，本次拆解数量不能大于可拆解数量");
        }
        // 校验二：工艺路线必须为生产计划产品对应的工艺路线
        // 拆解选择的工艺路线
        ProcessRoute processRoute = productionPlanSplit.getProcessRoute();
        processRoute = eruptDao.queryEntity(ProcessRoute.class, "id=" + processRoute.getId());
        MaterialBOM productName = processRoute.getProductName();
        if (ObjectUtil.isEmpty(productName)) {
            throw new RuntimeException("操作失败：工艺路线必须为生产计划产品对应的工艺路线");
        }
        Long productNameId = productName.getId();
        // 生产计划对应的产品
        MaterialBOM productName1 = productionPlan.getProductName();
        Long productName1Id = productName1.getId();
        if (!productNameId.equals(productName1Id)) {
            throw new RuntimeException("操作失败：工艺路线必须为生产计划产品对应的工艺路线");
        }
        // 校验通过，保存生产工单
        WorkOrder workOrder = new WorkOrder();
        workOrder.setProductionPlan(productionPlan);
        // 暂时没有编码规则
        workOrder.setCode("WO" + System.currentTimeMillis());
        workOrder.setProductName(productName1);
        workOrder.setProcessRoute(processRoute);
        workOrder.setPlanNumber(productionPlanSplit.getSplitNumber());
        workOrder.setPlanStartDate(productionPlanSplit.getPlanStartDate());
        workOrder.setPlanEndDate(productionPlanSplit.getPlanEndDate());
        workOrder.setPriority(productionPlanSplit.getPriority());
        eruptDao.persistAndFlush(workOrder);
        // 拆解数量，回写到生产计划生产数量
        List<WorkOrder> workOrders1 = eruptDao.queryEntityList(WorkOrder.class, "productionPlan.id=" + productionPlan.getId());
        BigDecimal workOrderPlanNumberSumBd = BigDecimal.ZERO;
        for (WorkOrder order : workOrders1) {
            workOrderPlanNumberSumBd = workOrderPlanNumberSumBd.add(new BigDecimal(order.getPlanNumber()));
        }
        productionPlan.setProduceNumber(workOrderPlanNumberSumBd.toString());
        eruptDao.merge(productionPlan);
        return null;
    }

}
