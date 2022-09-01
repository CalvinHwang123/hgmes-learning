package com.example.demo.proxy.material;

import com.example.demo.model.material.MaterialScrap;
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
public class MaterialScrapDataProxy implements DataProxy<MaterialScrap> {

    @Override
    public void beforeAdd(MaterialScrap materialScrap) {
        ModelUtil.validateUnique(materialScrap, Arrays.asList("code"), Collections.singletonList("materialScrapMaterialMoveOrders"));
    }

    @Override
    public void beforeUpdate(MaterialScrap materialScrap) {
        ModelUtil.validateUnique(materialScrap, Arrays.asList("code"), Collections.singletonList("materialScrapMaterialMoveOrders"));
    }

    @Override
    public void addBehavior(MaterialScrap materialScrap) {
        EruptUserService eruptUserService = EruptSpringUtil.getBean(EruptUserService.class);
        EruptUser eruptUser = eruptUserService.getCurrentEruptUser();
        materialScrap.setScrapPerson(eruptUser.getName());
        materialScrap.setScrapDate(DateUtil.getSimpleFormatDate(new Date()));
        materialScrap.setStatus("初始");
    }

}
