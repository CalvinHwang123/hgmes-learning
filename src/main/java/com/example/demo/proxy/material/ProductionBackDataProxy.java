package com.example.demo.proxy.material;

import com.example.demo.model.material.ProductionBack;
import com.example.demo.util.ModelUtil;
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
public class ProductionBackDataProxy implements DataProxy<ProductionBack> {

    @Override
    public void beforeAdd(ProductionBack productionBack) {
        ModelUtil.validateUnique(productionBack, Arrays.asList("code"), Collections.singletonList("productionBackMaterialMoveOrders"));
    }

    @Override
    public void beforeUpdate(ProductionBack productionBack) {
        ModelUtil.validateUnique(productionBack, Arrays.asList("code"), Collections.singletonList("productionBackMaterialMoveOrders"));
    }

    @Override
    public void addBehavior(ProductionBack productionBack) {
        EruptUserService eruptUserService = EruptSpringUtil.getBean(EruptUserService.class);
        EruptUser eruptUser = eruptUserService.getCurrentEruptUser();
        productionBack.setBackPerson(eruptUser.getName());
        productionBack.setBackDate(DateUtil.getSimpleFormatDate(new Date()));
        productionBack.setStatus("初始");
    }

}
