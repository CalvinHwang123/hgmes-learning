package com.example.demo.model.material;

import com.example.demo.constant.Constant;
import com.example.demo.model.modeling.ProductionLine;
import com.example.demo.proxy.WarehouseProductionLineDataProxy;
import lombok.Data;
import xyz.erupt.annotation.Erupt;
import xyz.erupt.annotation.EruptField;
import xyz.erupt.annotation.sub_field.Edit;
import xyz.erupt.annotation.sub_field.EditType;
import xyz.erupt.annotation.sub_field.Readonly;
import xyz.erupt.annotation.sub_field.View;
import xyz.erupt.annotation.sub_field.sub_edit.ReferenceTableType;
import xyz.erupt.jpa.model.BaseModel;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * 线边仓关联产线明细
 * @author 一只闲鹿
 */
@Erupt(name = "线边仓关联产线明细", dataProxy = { WarehouseProductionLineDataProxy.class })
@Table(name = "t_warehouse_production_line")
@Entity
@Data
public class WarehouseProductionLine extends BaseModel {

    @EruptField(
            views = @View(title = "产线编码"),
            edit = @Edit(title = "产线编码", readonly = @Readonly, placeHolder = Constant.UPDATE_AUTO_AFTER_SAVE)
    )
    private String productionLineCode;

    @ManyToOne
    @JoinColumn
    @EruptField(
            views = @View(title = "产线名称", column = "name"),
            edit = @Edit(
                    title = "产线名称",
                    notNull = true,
                    type = EditType.REFERENCE_TABLE,
                    referenceTableType = @ReferenceTableType
            )
    )
    private ProductionLine productionLine;

}
