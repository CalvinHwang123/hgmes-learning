package com.example.demo.proxy.material;

import com.example.demo.model.material.Material;
import com.example.demo.model.material.MaterialScrapMaterialMoveOrder;
import xyz.erupt.annotation.fun.DataProxy;
import xyz.erupt.core.util.EruptSpringUtil;
import xyz.erupt.jpa.dao.EruptDao;

/**
 * @author 一只闲鹿
 */
public class MaterialScrapMaterialMoveOrderDataProxy implements DataProxy<MaterialScrapMaterialMoveOrder> {

    @Override
    public void beforeAdd(MaterialScrapMaterialMoveOrder materialScrapMaterialMoveOrder) {
        setMaterialCode(materialScrapMaterialMoveOrder);
    }

    @Override
    public void beforeUpdate(MaterialScrapMaterialMoveOrder materialScrapMaterialMoveOrder) {
        setMaterialCode(materialScrapMaterialMoveOrder);
    }

    private void setMaterialCode(MaterialScrapMaterialMoveOrder materialScrapMaterialMoveOrder) {
        Material material = materialScrapMaterialMoveOrder.getMaterial();
        EruptDao eruptDao = EruptSpringUtil.getBean(EruptDao.class);
        material = eruptDao.queryEntity(Material.class, "id = " + material.getId());
        materialScrapMaterialMoveOrder.setMaterialCode(material.getCode());
    }

}
