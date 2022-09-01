package com.example.demo.proxy;

import com.example.demo.model.material.WarehouseProductionLine;
import com.example.demo.model.modeling.ProductionLine;
import org.springframework.stereotype.Service;
import xyz.erupt.annotation.fun.DataProxy;
import xyz.erupt.core.util.EruptSpringUtil;
import xyz.erupt.jpa.dao.EruptDao;

/**
 * @author 一只闲鹿
 */
@Service
public class WarehouseProductionLineDataProxy implements DataProxy<WarehouseProductionLine> {

    @Override
    public void beforeAdd(WarehouseProductionLine warehouseProductionLine) {
        setProcedureCodeField(warehouseProductionLine);
    }

    @Override
    public void beforeUpdate(WarehouseProductionLine warehouseProductionLine) {
        setProcedureCodeField(warehouseProductionLine);
    }

    private void setProcedureCodeField(WarehouseProductionLine warehouseProductionLine) {
        EruptDao eruptDao = EruptSpringUtil.getBean(EruptDao.class);
        ProductionLine productionLine = eruptDao.queryEntity(ProductionLine.class, "id = " + warehouseProductionLine.getProductionLine().getId());
        warehouseProductionLine.setProductionLineCode(productionLine.getCode());
    }

}
