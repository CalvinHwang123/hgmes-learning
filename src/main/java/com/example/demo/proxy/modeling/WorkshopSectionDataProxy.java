package com.example.demo.proxy.modeling;

import com.example.demo.model.modeling.WorkingSectionProcedure;
import com.example.demo.model.modeling.WorkshopSection;
import com.example.demo.util.ModelUtil;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
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
@Transactional(rollbackFor = Exception.class)
@Service
public class WorkshopSectionDataProxy implements DataProxy<WorkshopSection> {

    @Modifying
    @Override
    public void beforeAdd(WorkshopSection workshopSection) {
        ModelUtil.validateUnique(workshopSection, Arrays.asList("code", "name"), Collections.singletonList("workingSectionProcedures"));
    }

    @Modifying
    @Override
    public void beforeUpdate(WorkshopSection workshopSection) {
        ModelUtil.validateUnique(workshopSection, Arrays.asList("code", "name"), Collections.singletonList("workingSectionProcedures"));
    }

    @Deprecated
    private void validateDetailUnique(WorkshopSection workshopSection) {
        List<WorkingSectionProcedure> workingSectionProcedures = workshopSection.getWorkingSectionProcedures();
        if (!CollectionUtils.isEmpty(workingSectionProcedures)) {
            Set<String> procedureCodeSet = workingSectionProcedures.stream().map(WorkingSectionProcedure::getProcedureCode).collect(Collectors.toSet());
            if (procedureCodeSet.size() < workingSectionProcedures.size()) {
                throw new RuntimeException("操作失败：工段关联工序，工序不能重复");
            }
        }
    }
}
