package com.example.demo.proxy;

import com.example.demo.model.modeling.WorkingPositionProcedure;
import com.example.demo.model.modeling.WorkingProcedure;
import org.springframework.stereotype.Service;
import xyz.erupt.annotation.fun.DataProxy;
import xyz.erupt.core.util.EruptSpringUtil;
import xyz.erupt.jpa.dao.EruptDao;

/**
 * @author 一只闲鹿
 */
@Service
public class WorkingPositionProcedureDataProxy implements DataProxy<WorkingPositionProcedure> {

    @Override
    public void beforeAdd(WorkingPositionProcedure workingPositionProcedure) {
        setProcedureCodeField(workingPositionProcedure);
    }

    @Override
    public void beforeUpdate(WorkingPositionProcedure workingPositionProcedure) {
        setProcedureCodeField(workingPositionProcedure);
    }

    private void setProcedureCodeField(WorkingPositionProcedure workingPositionProcedure) {
        EruptDao eruptDao = EruptSpringUtil.getBean(EruptDao.class);
        WorkingProcedure workingProcedure = eruptDao.queryEntity(WorkingProcedure.class, "id = " + workingPositionProcedure.getWorkingProcedure().getId());
        workingPositionProcedure.setProcedureCode(workingProcedure.getCode());
    }

}
