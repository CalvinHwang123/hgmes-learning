package com.example.demo.model.material;/*
 * Copyright © 2020-2035 erupt.xyz All rights reserved.
 * Author: YuePeng (erupts@126.com)
 */

import javax.persistence.*;

import com.example.demo.constant.Constant;
import com.example.demo.proxy.material.ProductionPickingMaterialMoveOrderDataProxy;
import lombok.Data;
import xyz.erupt.annotation.*;
import xyz.erupt.annotation.sub_erupt.*;
import xyz.erupt.annotation.sub_field.*;
import xyz.erupt.annotation.sub_field.sub_edit.*;
import xyz.erupt.upms.model.base.HyperModel;
import xyz.erupt.jpa.model.BaseModel;
import java.util.Set;
import java.util.Date;

@Erupt(
        name = "生产领料物料移动单明细",
        dataProxy = { ProductionPickingMaterialMoveOrderDataProxy.class }
)
@Table(name = "t_production_picking_material_move_order")
@Entity
@Data
public class ProductionPickingMaterialMoveOrder extends BaseModel {

        @EruptField(
                views = @View(
                        title = "物料编码"
                ),
                edit = @Edit(
                        title = "物料编码",
                        type = EditType.INPUT,
                        inputType = @InputType,
                        readonly = @Readonly,
                        placeHolder = Constant.UPDATE_AUTO_AFTER_SAVE
                )
        )
        private String materialCode;

        @EruptField(
                views = @View(
                        title = "物料名称",
                        column = "name"
                ),
                edit = @Edit(
                        title = "物料名称",
                        type = EditType.REFERENCE_TABLE,
                        referenceTableType = @ReferenceTableType(id = "id", label = "name"),
                        notNull = true
                )
        )
        @ManyToOne
        private Material material;

        @EruptField(
                views = @View(
                        title = "管控类型"
                ),
                edit = @Edit(
                        title = "管控类型",
                        type = EditType.INPUT,
                        inputType = @InputType
                )
        )
        private String controlType;

        @EruptField(
                views = @View(
                        title = "单位"
                ),
                edit = @Edit(
                        title = "单位",
                        type = EditType.INPUT,
                        inputType = @InputType
                )
        )
        private String unit;

        @EruptField(
                views = @View(
                        title = "需求数量"
                ),
                edit = @Edit(
                        title = "需求数量",
                        type = EditType.INPUT,
                        inputType = @InputType,
                        notNull = true
                )
        )
        private String demandNumber;

        @EruptField(
                views = @View(
                        title = "实际数量"
                ),
                edit = @Edit(
                        title = "实际数量",
                        type = EditType.INPUT,
                        inputType = @InputType
                )
        )
        private String actualNumber;

}
