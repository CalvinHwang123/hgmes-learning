package com.example.demo.proxy.modeling;

import com.example.demo.model.modeling.ProductionLine;
import com.example.demo.model.modeling.WorkingProcedure;
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
public class ProductionLineDataProxy implements DataProxy<ProductionLine> {

    @Override
    public void beforeAdd(ProductionLine productionLine) {
        ModelUtil.validateUnique(productionLine, Arrays.asList("code", "name"), Collections.singletonList("workingProcedures"));
    }

    @Override
    public void beforeUpdate(ProductionLine productionLine) {
        ModelUtil.validateUnique(productionLine, Arrays.asList("code", "name"), Collections.singletonList("workingProcedures"));
    }

    @Deprecated
    private void validateDetailUnique(ProductionLine productionLine) {
        List<WorkingProcedure> workingProcedures = productionLine.getWorkingProcedures();
        if (!CollectionUtils.isEmpty(workingProcedures)) {
            Set<Long> idSet = workingProcedures.stream().map(WorkingProcedure::getId).collect(Collectors.toSet());
            if (idSet.size() < workingProcedures.size()) {
                throw new RuntimeException("操作失败：产线关联工序，工序不能重复");
            }
        }
    }
}
