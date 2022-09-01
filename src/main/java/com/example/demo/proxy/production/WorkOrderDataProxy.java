package com.example.demo.proxy.production;

import cn.hutool.core.util.ObjectUtil;
import com.example.demo.model.production.ProductionPlan;
import com.example.demo.model.production.WorkOrder;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;
import xyz.erupt.annotation.fun.DataProxy;
import xyz.erupt.core.util.EruptSpringUtil;
import xyz.erupt.jpa.dao.EruptDao;

import java.math.BigDecimal;
import java.util.List;

/**
 * @author 一只闲鹿
 */
@Service
@Transactional(rollbackFor = Exception.class)
public class WorkOrderDataProxy implements DataProxy<WorkOrder> {

    @Modifying
    @Override
    public void beforeAdd(WorkOrder workOrder) {
        updateProductionPlanFinishNumber(workOrder);
    }

    @Modifying
    @Override
    public void beforeUpdate(WorkOrder workOrder) {
        updateProductionPlanFinishNumber(workOrder);
    }

    /**
     * 回写完工数量到生产计划完工数量
     * @param workOrder
     */
    private void updateProductionPlanFinishNumber(WorkOrder workOrder) {
        ProductionPlan productionPlan = workOrder.getProductionPlan();
        if (ObjectUtil.isEmpty(productionPlan)) {
            return;
        }
        if (ObjectUtil.isEmpty(workOrder.getFinishNumber())) {
            return;
        }
        BigDecimal finishNumberSumBd = new BigDecimal(workOrder.getFinishNumber());
        EruptDao eruptDao = EruptSpringUtil.getBean(EruptDao.class);
        List<WorkOrder> workOrders = eruptDao.queryEntityList(WorkOrder.class, "productionPlan.id=" + productionPlan.getId());
        if (!CollectionUtils.isEmpty(workOrders)) {
            for (WorkOrder order : workOrders) {
                finishNumberSumBd = finishNumberSumBd.add(new BigDecimal(order.getFinishNumber()));
            }
        }
        productionPlan.setFinishNumber(finishNumberSumBd.toString());
        eruptDao.merge(productionPlan);
    }
}
