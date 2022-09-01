package com.example.demo.proxy.modeling;

import com.example.demo.model.modeling.Employee;
import com.example.demo.model.modeling.WorkTeamEmployee;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;
import xyz.erupt.annotation.fun.DataProxy;
import xyz.erupt.jpa.dao.EruptDao;

/**
 * @author 一只闲鹿
 */
@AllArgsConstructor
@Service
public class WorkTeamEmployeeDataProxy implements DataProxy<WorkTeamEmployee> {

    private EruptDao eruptDao;

    @Override
    public void beforeAdd(WorkTeamEmployee workTeamEmployee) {
        setEmployeeNo(workTeamEmployee);
    }

    @Override
    public void beforeUpdate(WorkTeamEmployee workTeamEmployee) {
        setEmployeeNo(workTeamEmployee);
    }

    private void setEmployeeNo(WorkTeamEmployee workTeamEmployee) {
        Employee employee = eruptDao.queryEntity(Employee.class, "id = " + workTeamEmployee.getEmployee().getId());
        workTeamEmployee.setEmployeeNo(employee.getEmployeeNo());
    }
}
