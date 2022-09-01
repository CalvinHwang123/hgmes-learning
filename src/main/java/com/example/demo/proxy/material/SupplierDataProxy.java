package com.example.demo.proxy.material;

import com.example.demo.model.material.Supplier;
import com.example.demo.util.ModelUtil;
import xyz.erupt.annotation.fun.DataProxy;

import java.util.Arrays;

/**
 * @author 一只闲鹿
 */
public class SupplierDataProxy implements DataProxy<Supplier> {

    @Override
    public void beforeAdd(Supplier supplier) {
        ModelUtil.validateUnique(supplier, Arrays.asList("code", "name"));
    }

    @Override
    public void beforeUpdate(Supplier supplier) {
        ModelUtil.validateUnique(supplier, Arrays.asList("code", "name"));
    }
}
