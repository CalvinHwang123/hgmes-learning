package com.example.demo.model.material;/*
 * Copyright © 2020-2035 erupt.xyz All rights reserved.
 * Author: YuePeng (erupts@126.com)
 */

import xyz.erupt.annotation.Erupt;
import xyz.erupt.annotation.EruptField;
import xyz.erupt.annotation.sub_field.Edit;
import xyz.erupt.annotation.sub_field.EditType;
import xyz.erupt.annotation.sub_field.View;
import xyz.erupt.annotation.sub_field.sub_edit.InputType;
import xyz.erupt.annotation.sub_field.sub_edit.ReferenceTableType;
import xyz.erupt.jpa.model.BaseModel;

import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Erupt(name = "常规领料物料移动单明细")
@Table(name = "t_common_picking_material_move_order")
@Entity
public class CommonPickingMaterialMoveOrder extends BaseModel {

        @EruptField(
                views = @View(
                        title = "物料编码"
                ),
                edit = @Edit(
                        title = "物料编码",
                        type = EditType.INPUT,
                        inputType = @InputType
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
                        referenceTableType = @ReferenceTableType(id = "id", label = "name")
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
                        inputType = @InputType
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
