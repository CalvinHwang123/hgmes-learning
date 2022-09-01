package com.example.demo.proxy;

import com.example.demo.model.modeling.WorkingSectionProcedure;
import com.example.demo.model.modeling.WorkingProcedure;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import xyz.erupt.annotation.fun.DataProxy;
import xyz.erupt.core.util.EruptSpringUtil;
import xyz.erupt.jpa.dao.EruptDao;

/**
 * @author 一只闲鹿
 */
public class WorkingSectionProcedureDataProxy implements DataProxy<WorkingSectionProcedure> {

    @Override
    public void beforeAdd(WorkingSectionProcedure workingSectionProcedure) {
        setProcedureCodeField(workingSectionProcedure);
    }

    @Override
    public void beforeUpdate(WorkingSectionProcedure workingSectionProcedure) {
        setProcedureCodeField(workingSectionProcedure);
    }

    private void setProcedureCodeField(WorkingSectionProcedure workingSectionProcedure) {
        EruptDao eruptDao = EruptSpringUtil.getBean(EruptDao.class);
        WorkingProcedure workingProcedure = eruptDao.queryEntity(WorkingProcedure.class, "id = " + workingSectionProcedure.getWorkingProcedure().getId());
        workingSectionProcedure.setProcedureCode(workingProcedure.getCode());
    }

}
