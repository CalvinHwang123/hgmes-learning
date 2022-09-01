package com.example.demo.proxy.material;

import com.example.demo.model.material.ProcessRoute;
import com.example.demo.model.material.ProductionPicking;
import com.example.demo.model.modeling.WorkingProcedure;
import com.example.demo.util.ModelUtil;
import xyz.erupt.annotation.Erupt;
import xyz.erupt.annotation.fun.DataProxy;
import xyz.erupt.core.util.DateUtil;
import xyz.erupt.core.util.EruptSpringUtil;
import xyz.erupt.jpa.dao.EruptDao;
import xyz.erupt.upms.model.EruptUser;
import xyz.erupt.upms.service.EruptUserService;

import java.util.*;

/**
 * @author 一只闲鹿
 */
public class ProcessRouteDataProxy implements DataProxy<ProcessRoute> {

    @Override
    public void afterFetch(Collection<Map<String, Object>> list) {
//        list.forEach(map -> map.put("linkDetail", "/#/tpl/process-detail.html?process_route_id=" + map.get("id")));
    }

    @Override
    public void beforeAdd(ProcessRoute processRoute) {
        ModelUtil.validateUnique(processRoute, Arrays.asList("code", "name"), Collections.singletonList("processRouteWorkingProcedures"));
    }

    @Override
    public void beforeUpdate(ProcessRoute processRoute) {
        ModelUtil.validateUnique(processRoute, Arrays.asList("code", "name"), Collections.singletonList("processRouteWorkingProcedures"));
    }

    @Override
    public void addBehavior(ProcessRoute processRoute) {
        processRoute.setStatus("初始");
    }

}
