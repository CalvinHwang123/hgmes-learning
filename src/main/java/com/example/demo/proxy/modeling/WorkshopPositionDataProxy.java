package com.example.demo.proxy.modeling;

import com.example.demo.model.modeling.WorkingPositionProcedure;
import com.example.demo.model.modeling.WorkshopPosition;
import com.example.demo.util.ModelUtil;
import org.springframework.util.CollectionUtils;
import xyz.erupt.annotation.fun.DataProxy;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

/**
 * @author 一只闲鹿
 */
public class WorkshopPositionDataProxy implements DataProxy<WorkshopPosition> {

    @Override
    public void beforeAdd(WorkshopPosition workshopPosition) {
        ModelUtil.validateUnique(workshopPosition, Arrays.asList("code", "name"), Collections.singletonList("workingPositionProcedures"));
    }

    @Override
    public void beforeUpdate(WorkshopPosition workshopPosition) {
        ModelUtil.validateUnique(workshopPosition, Arrays.asList("code", "name"), Collections.singletonList("workingPositionProcedures"));
    }

    @Deprecated
    private void validateDetailUnique(WorkshopPosition workshopPosition) {
        List<WorkingPositionProcedure> workingPositionProcedures = workshopPosition.getWorkingPositionProcedures();
        if (!CollectionUtils.isEmpty(workingPositionProcedures)) {
            Set<String> procedureCodeSet = workingPositionProcedures.stream().map(WorkingPositionProcedure::getProcedureCode).collect(Collectors.toSet());
            if (procedureCodeSet.size() < workingPositionProcedures.size()) {
                throw new RuntimeException("操作失败：工位关联工序，工序不能重复");
            }
        }
    }
}
