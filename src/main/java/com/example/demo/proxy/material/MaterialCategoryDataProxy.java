package com.example.demo.proxy.material;

import com.example.demo.model.material.MaterialCategory;
import com.example.demo.util.ModelUtil;
import xyz.erupt.annotation.fun.DataProxy;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;

/**
 * @author 一只闲鹿
 */
public class MaterialCategoryDataProxy implements DataProxy<MaterialCategory> {

    @Override
    public void beforeAdd(MaterialCategory materialCategory) {
        ModelUtil.validateUnique(materialCategory, Collections.singletonList("code"));
    }

    @Override
    public void beforeUpdate(MaterialCategory materialCategory) {
        ModelUtil.validateUnique(materialCategory, Collections.singletonList("code"));
    }

    @Override
    public void beforeDelete(MaterialCategory materialCategory) {
        String name = materialCategory.getName();
        List<String> defaultDatas = Arrays.asList("原材料", "半成品", "成品");
        if (defaultDatas.contains(name)) {
            throw new RuntimeException("操作失败：原材料、半成品、成品为默认数据，不允许删除");
        }
    }
}
