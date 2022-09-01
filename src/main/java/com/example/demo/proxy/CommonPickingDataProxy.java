package com.example.demo.proxy;

import com.example.demo.model.material.CommonPicking;
import com.example.demo.model.material.ProductionPicking;
import org.springframework.stereotype.Service;
import xyz.erupt.annotation.fun.DataProxy;
import xyz.erupt.core.util.DateUtil;
import xyz.erupt.core.util.EruptSpringUtil;
import xyz.erupt.upms.model.EruptUser;
import xyz.erupt.upms.service.EruptUserService;

import java.util.Date;

/**
 * @author 一只闲鹿
 */
@Service
public class CommonPickingDataProxy implements DataProxy<CommonPicking> {

    @Override
    public void addBehavior(CommonPicking commonPicking) {
        EruptUserService eruptUserService = EruptSpringUtil.getBean(EruptUserService.class);
        EruptUser eruptUser = eruptUserService.getCurrentEruptUser();
        commonPicking.setPickingPerson(eruptUser.getName());
        commonPicking.setPickingDate(DateUtil.getSimpleFormatDate(new Date()));
    }
}
