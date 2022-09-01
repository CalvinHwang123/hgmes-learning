package com.example.demo.proxy.material;

import com.example.demo.model.material.Material;
import com.example.demo.util.ModelUtil;
import xyz.erupt.annotation.fun.DataProxy;

import java.util.Arrays;

/**
 * @author 一只闲鹿
 */
public class MaterialDataProxy implements DataProxy<Material> {

    @Override
    public void beforeAdd(Material material) {
        ModelUtil.validateUnique(material, Arrays.asList("code", "name"));
    }

    @Override
    public void beforeUpdate(Material material) {
        ModelUtil.validateUnique(material, Arrays.asList("code", "name"));
    }
}
