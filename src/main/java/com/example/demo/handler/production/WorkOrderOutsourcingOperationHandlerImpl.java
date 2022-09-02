package com.example.demo.handler.production;

import com.example.demo.model.production.WorkOrder;
import com.example.demo.model.production.WorkOrderOutsourcing;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import xyz.erupt.annotation.fun.OperationHandler;
import xyz.erupt.jpa.dao.EruptDao;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author 一只闲鹿
 */
@Service
public class WorkOrderOutsourcingOperationHandlerImpl implements OperationHandler<WorkOrder, WorkOrderOutsourcing> {

    @Resource
    private EruptDao eruptDao;

    @Modifying
    @Transactional(rollbackFor = Exception.class)
    @Override
    public String exec(List<WorkOrder> data, WorkOrderOutsourcing workOrderOutsourcing, String[] param) {
        data.forEach(workOrder -> {
            workOrder.setNoOutsourcing(false);
            eruptDao.merge(workOrder);
        });
        return null;
    }

}
