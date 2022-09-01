package com.example.demo.proxy.material;

import com.example.demo.model.material.ProductionPicking;
import com.example.demo.util.ModelUtil;
import org.springframework.stereotype.Service;
import xyz.erupt.annotation.fun.DataProxy;
import xyz.erupt.core.util.DateUtil;
import xyz.erupt.core.util.EruptSpringUtil;
import xyz.erupt.upms.model.EruptUser;
import xyz.erupt.upms.service.EruptUserService;

import java.util.Arrays;
import java.util.Collections;
import java.util.Date;

/**
 * @author 一只闲鹿
 */
@Service
public class ProductionPickingDataProxy implements DataProxy<ProductionPicking> {

    @Override
    public void beforeAdd(ProductionPicking productionPicking) {
        ModelUtil.validateUnique(productionPicking, Arrays.asList("code"), Collections.singletonList("productionPickingMaterialMoveOrders"));
    }

    @Override
    public void beforeUpdate(ProductionPicking productionPicking) {
        ModelUtil.validateUnique(productionPicking, Arrays.asList("code"), Collections.singletonList("productionPickingMaterialMoveOrders"));
    }

    @Override
    public void addBehavior(ProductionPicking productionPicking) {
        EruptUserService eruptUserService = EruptSpringUtil.getBean(EruptUserService.class);
        EruptUser eruptUser = eruptUserService.getCurrentEruptUser();
        productionPicking.setPickingPerson(eruptUser.getName());
        productionPicking.setPickingDate(DateUtil.getSimpleFormatDate(new Date()));
        productionPicking.setStatus("初始");
    }
}
