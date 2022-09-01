package com.example.demo.proxy.production;

import com.example.demo.model.production.ProductionPlan;
import com.example.demo.util.ModelUtil;
import xyz.erupt.annotation.fun.DataProxy;

import java.util.Collections;

/**
 * @author 一只闲鹿
 */
public class ProductionPlanDataProxy implements DataProxy<ProductionPlan> {

    @Override
    public void beforeAdd(ProductionPlan productionPlan) {
        ModelUtil.validateUnique(productionPlan, Collections.singletonList("code"));
    }

    @Override
    public void beforeUpdate(ProductionPlan productionPlan) {
        ModelUtil.validateUnique(productionPlan, Collections.singletonList("code"));
    }

}
