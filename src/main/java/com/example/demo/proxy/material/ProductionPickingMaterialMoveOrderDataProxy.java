package com.example.demo.proxy.material;

import com.example.demo.model.material.Material;
import com.example.demo.model.material.ProductionPickingMaterialMoveOrder;
import xyz.erupt.annotation.fun.DataProxy;
import xyz.erupt.core.util.EruptSpringUtil;
import xyz.erupt.jpa.dao.EruptDao;

/**
 * @author 一只闲鹿
 */
public class ProductionPickingMaterialMoveOrderDataProxy implements DataProxy<ProductionPickingMaterialMoveOrder> {

    @Override
    public void beforeAdd(ProductionPickingMaterialMoveOrder productionPickingMaterialMoveOrder) {
        setMaterialCode(productionPickingMaterialMoveOrder);
    }

    @Override
    public void beforeUpdate(ProductionPickingMaterialMoveOrder productionPickingMaterialMoveOrder) {
        setMaterialCode(productionPickingMaterialMoveOrder);
    }

    private void setMaterialCode(ProductionPickingMaterialMoveOrder productionPickingMaterialMoveOrder) {
        Material material = productionPickingMaterialMoveOrder.getMaterial();
        EruptDao eruptDao = EruptSpringUtil.getBean(EruptDao.class);
        material = eruptDao.queryEntity(Material.class, "id = " + material.getId());
        productionPickingMaterialMoveOrder.setMaterialCode(material.getCode());
    }

}
