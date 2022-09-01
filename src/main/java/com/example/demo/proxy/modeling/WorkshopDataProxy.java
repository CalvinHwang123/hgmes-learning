package com.example.demo.proxy.modeling;

import com.example.demo.model.modeling.Workshop;
import com.example.demo.util.ModelUtil;
import xyz.erupt.annotation.fun.DataProxy;

import java.util.Collections;

/**
 * @author 一只闲鹿
 */
public class WorkshopDataProxy implements DataProxy<Workshop> {

    @Override
    public void beforeAdd(Workshop workshop) {
        ModelUtil.validateUnique(workshop, Collections.singletonList("code"));
    }

    @Override
    public void beforeUpdate(Workshop workshop) {
        ModelUtil.validateUnique(workshop, Collections.singletonList("code"));
    }
}
