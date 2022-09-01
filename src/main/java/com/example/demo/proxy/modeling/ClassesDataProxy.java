package com.example.demo.proxy.modeling;

import com.example.demo.model.modeling.Classes;
import com.example.demo.util.ModelUtil;
import xyz.erupt.annotation.fun.DataProxy;

import java.util.Collections;

/**
 * @author 一只闲鹿
 */
public class ClassesDataProxy implements DataProxy<Classes> {

    @Override
    public void beforeAdd(Classes classes) {
        ModelUtil.validateUnique(classes, Collections.singletonList("code"));
    }

    @Override
    public void beforeUpdate(Classes classes) {
        ModelUtil.validateUnique(classes, Collections.singletonList("code"));
    }
}
