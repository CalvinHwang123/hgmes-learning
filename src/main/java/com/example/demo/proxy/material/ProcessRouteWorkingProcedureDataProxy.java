package com.example.demo.proxy.material;

import com.example.demo.model.material.ProcessRouteWorkingProcedure;
import com.example.demo.model.modeling.WorkingProcedure;
import xyz.erupt.annotation.fun.DataProxy;
import xyz.erupt.core.util.EruptSpringUtil;
import xyz.erupt.jpa.dao.EruptDao;

/**
 * @author 一只闲鹿
 */
public class ProcessRouteWorkingProcedureDataProxy implements DataProxy<ProcessRouteWorkingProcedure> {

    @Override
    public void beforeAdd(ProcessRouteWorkingProcedure processRouteWorkingProcedure) {
        setWorkingProcedureCodeField(processRouteWorkingProcedure);
    }

    @Override
    public void beforeUpdate(ProcessRouteWorkingProcedure processRouteWorkingProcedure) {
        setWorkingProcedureCodeField(processRouteWorkingProcedure);
    }

    private void setWorkingProcedureCodeField(ProcessRouteWorkingProcedure processRouteWorkingProcedure) {
        EruptDao eruptDao = EruptSpringUtil.getBean(EruptDao.class);
        WorkingProcedure workingProcedure = eruptDao.queryEntity(WorkingProcedure.class, "id =" + processRouteWorkingProcedure.getWorkingProcedure().getId());
        processRouteWorkingProcedure.setWorkingProcedureCode(workingProcedure.getCode());
    }

}
