package com.example.demo.proxy.modeling;

import com.example.demo.model.modeling.Employee;
import com.example.demo.util.ModelUtil;
import xyz.erupt.annotation.fun.DataProxy;

import java.util.Collections;
import java.util.Map;

/**
 * @author 一只闲鹿
 */
public class EmployeeDataProxy implements DataProxy<Employee> {

    @Override
    public void beforeAdd(Employee employee) {
        ModelUtil.validateUnique(employee, Collections.singletonList("employeeNo"));
    }

    @Override
    public void beforeUpdate(Employee employee) {
        ModelUtil.validateUnique(employee, Collections.singletonList("employeeNo"));
    }

    @Override
    public void searchCondition(Map<String, Object> condition) {
        condition.put("employeeNo", "10001392");
    }
}
