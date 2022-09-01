package com.example.demo.proxy.modeling;

import com.example.demo.model.modeling.WorkTeam;
import com.example.demo.util.ModelUtil;
import xyz.erupt.annotation.fun.DataProxy;

import java.util.Arrays;
import java.util.Collections;

/**
 * @author 一只闲鹿
 */
public class WorkTeamDataProxy implements DataProxy<WorkTeam> {

    @Override
    public void beforeAdd(WorkTeam workTeam) {
        ModelUtil.validateUnique(workTeam, Arrays.asList("code", "name"), Collections.singletonList("workTeamEmployeeList"));
    }

    @Override
    public void beforeUpdate(WorkTeam workTeam) {
        ModelUtil.validateUnique(workTeam, Arrays.asList("code", "name"), Collections.singletonList("workTeamEmployeeList"));
    }

}
