package com.example.demo.proxy.material;

import com.example.demo.model.material.Material;
import com.example.demo.model.material.ProductionBackMaterialMoveOrder;
import com.example.demo.model.material.ProductionPickingMaterialMoveOrder;
import xyz.erupt.annotation.fun.DataProxy;
import xyz.erupt.core.util.EruptSpringUtil;
import xyz.erupt.jpa.dao.EruptDao;

/**
 * @author 一只闲鹿
 */
public class ProductionBackMaterialMoveOrderDataProxy implements DataProxy<ProductionBackMaterialMoveOrder> {

    @Override
    public void beforeAdd(ProductionBackMaterialMoveOrder productionBackMaterialMoveOrder) {
        setMaterialCode(productionBackMaterialMoveOrder);
    }

    @Override
    public void beforeUpdate(ProductionBackMaterialMoveOrder productionBackMaterialMoveOrder) {
        setMaterialCode(productionBackMaterialMoveOrder);
    }

    private void setMaterialCode(ProductionBackMaterialMoveOrder productionBackMaterialMoveOrder) {
        Material material = productionBackMaterialMoveOrder.getMaterial();
        EruptDao eruptDao = EruptSpringUtil.getBean(EruptDao.class);
        material = eruptDao.queryEntity(Material.class, "id = " + material.getId());
        productionBackMaterialMoveOrder.setMaterialCode(material.getCode());
    }

}
