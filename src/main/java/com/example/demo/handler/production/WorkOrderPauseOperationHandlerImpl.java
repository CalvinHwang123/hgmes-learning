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
public class WorkOrderPauseOperationHandlerImpl implements OperationHandler<WorkOrder, Void> {

    @Resource
    private EruptDao eruptDao;

    @Modifying
    @Transactional(rollbackFor = Exception.class)
    @Override
    public String exec(List<WorkOrder> data, Void aVoid, String[] param) {
        if ("pause".equals(param[0])) {
            // 过滤出不是已下达或执行中的集合
            List<WorkOrder> notInitStatusList = data.stream().filter(workOrder ->
                    ObjectUtil.isEmpty(workOrder.getStatus())
                            || (!STATUS_DOWNED.equals(workOrder.getStatus()) && !STATUS_EXECUTING.equals(workOrder.getStatus())))
                    .collect(Collectors.toList());
            if (!CollectionUtils.isEmpty(notInitStatusList)) {
                throw new RuntimeException("操作失败：请选择状态为已下达或执行中的工单");
            }
            data.forEach(workOrder -> {
                workOrder.setStatus(STATUS_PAUSE);
                eruptDao.merge(workOrder);
            });
        } else if ("cancelPause".equals(param[0])) {
            // 过滤出不是已暂停的集合
            List<WorkOrder> notInitStatusList = data.stream().filter(workOrder ->
                    ObjectUtil.isEmpty(workOrder.getStatus())
                            || !STATUS_PAUSE.equals(workOrder.getStatus()))
                    .collect(Collectors.toList());
            if (!CollectionUtils.isEmpty(notInitStatusList)) {
                throw new RuntimeException("操作失败：请选择状态为已暂停的工单");
            }
            data.forEach(workOrder -> {
                // TODO 这里按理说，取消暂停应该更新为上一状态（可能是执行中，也可能是已下达）
                // 这里简单点，直接更新为执行中
                workOrder.setStatus(STATUS_EXECUTING);
                eruptDao.merge(workOrder);
            });
        }
        return null;
    }

}
