package com.example.demo.handler.production;

import cn.hutool.core.util.ObjectUtil;
import com.example.demo.model.production.WorkOrder;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;
import xyz.erupt.annotation.fun.OperationHandler;
import xyz.erupt.jpa.dao.EruptDao;

import javax.annotation.Resource;
import java.util.List;
import java.util.stream.Collectors;

import static com.example.demo.constant.Constant.*;

/**
 * @author 一只闲鹿
 */
@Service
public class WorkOrderDownOperationHandlerImpl implements OperationHandler<WorkOrder, Void> {

    @Resource
    private EruptDao eruptDao;

    @Modifying
    @Transactional(rollbackFor = Exception.class)
    @Override
    public String exec(List<WorkOrder> data, Void aVoid, String[] param) {
        if ("down".equals(param[0])) {
            // 过滤出不是初始的集合
            List<WorkOrder> notInitStatusList = data.stream().filter(workOrder ->
                    ObjectUtil.isEmpty(workOrder.getStatus())
                            || !STATUS_INIT.equals(workOrder.getStatus()))
                    .collect(Collectors.toList());
            if (!CollectionUtils.isEmpty(notInitStatusList)) {
                throw new RuntimeException("操作失败：请选择状态为初始的工单");
            }
            data.forEach(workOrder -> {
                workOrder.setStatus(STATUS_DOWNED);
                eruptDao.merge(workOrder);
            });
        } else if ("cancelDown".equals(param[0])) {
            // 过滤出不是已下达的集合
            List<WorkOrder> notInitStatusList = data.stream().filter(workOrder ->
                    ObjectUtil.isEmpty(workOrder.getStatus())
                            || !STATUS_DOWNED.equals(workOrder.getStatus()))
                    .collect(Collectors.toList());
            if (!CollectionUtils.isEmpty(notInitStatusList)) {
                throw new RuntimeException("操作失败：请选择状态为已下达的工单");
            }
            data.forEach(workOrder -> {
                workOrder.setStatus(STATUS_INIT);
                eruptDao.merge(workOrder);
            });
        }
        return null;
    }

}
