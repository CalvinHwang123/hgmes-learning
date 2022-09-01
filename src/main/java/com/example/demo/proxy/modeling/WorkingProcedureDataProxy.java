package com.example.demo.proxy.modeling;

import com.example.demo.model.modeling.WorkingProcedure;
import com.example.demo.util.ModelUtil;
import xyz.erupt.annotation.fun.DataProxy;

import java.util.Arrays;

/**
 * @author 一只闲鹿
 */
public class WorkingProcedureDataProxy implements DataProxy<WorkingProcedure> {

    @Override
    public void beforeAdd(WorkingProcedure workingProcedure) {
        ModelUtil.validateUnique(workingProcedure, Arrays.asList("code", "name"));
    }

    @Override
    public void beforeUpdate(WorkingProcedure workingProcedure) {
        ModelUtil.validateUnique(workingProcedure, Arrays.asList("code", "name"));
    }
}
