package com.example.demo.proxy.material;

import com.example.demo.model.material.MaterialBOM;
import com.example.demo.util.ModelUtil;
import xyz.erupt.annotation.fun.DataProxy;
import xyz.erupt.core.util.EruptSpringUtil;
import xyz.erupt.jpa.dao.EruptDao;

import java.util.Arrays;
import java.util.Collections;

/**
 * @author 一只闲鹿
 */
public class MaterialBOMDataProxy implements DataProxy<MaterialBOM> {

    @Override
    public void beforeAdd(MaterialBOM materialBOM) {
        ModelUtil.validateUnique(materialBOM, Arrays.asList("code", "name"), Collections.singletonList("materialBOMMaterials"));
        setMaterialCodeField(materialBOM);
    }

    @Override
    public void beforeUpdate(MaterialBOM materialBOM) {
        ModelUtil.validateUnique(materialBOM, Arrays.asList("code", "name"), Collections.singletonList("materialBOMMaterials"));
        setMaterialCodeField(materialBOM);
    }

    private void setMaterialCodeField(MaterialBOM materialBOM) {
        EruptDao eruptDao = EruptSpringUtil.getBean(EruptDao.class);
        String sql = "select code from t_material where id = " + materialBOM.getMaterial().getId();
        String materialCode = eruptDao.getJdbcTemplate().queryForMap(sql).get("code").toString();
        materialBOM.setMaterialCode(materialCode);
    }
}
