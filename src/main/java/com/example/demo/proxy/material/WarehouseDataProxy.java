package com.example.demo.proxy.material;

import com.example.demo.model.material.Warehouse;
import com.example.demo.util.ModelUtil;
import xyz.erupt.annotation.fun.DataProxy;

import java.util.Arrays;
import java.util.Collections;

/**
 * @author 一只闲鹿
 */
public class WarehouseDataProxy implements DataProxy<Warehouse> {

    @Override
    public void beforeAdd(Warehouse warehouse) {
        ModelUtil.validateUnique(warehouse, Arrays.asList("code", "name"), Collections.singletonList("warehouseProductionLines"));
    }

    @Override
    public void beforeUpdate(Warehouse warehouse) {
        ModelUtil.validateUnique(warehouse, Arrays.asList("code", "name"), Collections.singletonList("warehouseProductionLines"));
    }
}
