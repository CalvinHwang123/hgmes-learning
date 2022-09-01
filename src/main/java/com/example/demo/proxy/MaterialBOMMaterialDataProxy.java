package com.example.demo.proxy;

import com.example.demo.model.material.Material;
import com.example.demo.model.material.MaterialBOMMaterial;
import xyz.erupt.annotation.fun.DataProxy;
import xyz.erupt.core.util.EruptSpringUtil;
import xyz.erupt.jpa.dao.EruptDao;

/**
 * @author 一只闲鹿
 */
public class MaterialBOMMaterialDataProxy implements DataProxy<MaterialBOMMaterial> {

    @Override
    public void beforeAdd(MaterialBOMMaterial materialBOMMaterial) {
        setMaterialCodeField(materialBOMMaterial);
    }

    @Override
    public void beforeUpdate(MaterialBOMMaterial materialBOMMaterial) {
        setMaterialCodeField(materialBOMMaterial);
    }

    private void setMaterialCodeField(MaterialBOMMaterial materialBOMMaterial) {
        EruptDao eruptDao = EruptSpringUtil.getBean(EruptDao.class);
        Material material = eruptDao.queryEntity(Material.class, "id = " + materialBOMMaterial.getMaterial().getId());
        materialBOMMaterial.setMaterialCode(material.getCode());
    }
}
