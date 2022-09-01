package com.example.demo.proxy.modeling;

import com.example.demo.model.modeling.MeasureUnit;
import com.example.demo.util.ModelUtil;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;
import org.springframework.util.ObjectUtils;
import xyz.erupt.annotation.fun.DataProxy;
import xyz.erupt.core.util.EruptSpringUtil;
import xyz.erupt.jpa.dao.EruptDao;

import java.util.Arrays;
import java.util.List;

/**
 * @author 一只闲鹿
 */
@Service
public class MeasureUnitDataProxy implements DataProxy<MeasureUnit> {

    @Override
    public void beforeAdd(MeasureUnit measureUnit) {
        ModelUtil.validateUnique(measureUnit, Arrays.asList("chineseName", "englishName"));
    }

    @Override
    public void beforeUpdate(MeasureUnit measureUnit) {
        ModelUtil.validateUnique(measureUnit, Arrays.asList("chineseName", "englishName"));
    }

    @Deprecated
    private void validateUnique(MeasureUnit measureUnit) {
        String expr = " 1 = 1 and (chineseName = '" + measureUnit.getChineseName()
                + "' or englishName = '" + measureUnit.getEnglishName() + "') ";
        if (!ObjectUtils.isEmpty(measureUnit.getId())) {
            expr += " and id != " + measureUnit.getId() + " ";
        }
        EruptDao eruptDao = EruptSpringUtil.getBean(EruptDao.class);
        List<MeasureUnit> measureUnits = eruptDao.queryEntityList(MeasureUnit.class, expr);
        if (!CollectionUtils.isEmpty(measureUnits)) {
            throw new RuntimeException("操作失败：参数【中文名称】或【英文名称】已存在");
        }
    }
}
