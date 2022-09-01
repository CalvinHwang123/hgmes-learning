package com.example.demo.proxy.modeling;

import com.example.demo.model.modeling.Shift;
import com.example.demo.util.ModelUtil;
import xyz.erupt.annotation.fun.DataProxy;

import java.util.Collections;

/**
 * @author 一只闲鹿
 */
public class ShiftDataProxy implements DataProxy<Shift> {

    @Override
    public void beforeAdd(Shift shift) {
        ModelUtil.validateUnique(shift, Collections.singletonList("code"), Collections.singletonList("classes"));
    }

    @Override
    public void beforeUpdate(Shift shift) {
        ModelUtil.validateUnique(shift, Collections.singletonList("code"), Collections.singletonList("classes"));
    }
}
