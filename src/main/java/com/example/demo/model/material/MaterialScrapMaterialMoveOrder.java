package com.example.demo.model.material;/*
 * Copyright © 2020-2035 erupt.xyz All rights reserved.
 * Author: YuePeng (erupts@126.com)
 */

import com.example.demo.constant.Constant;
import com.example.demo.proxy.material.MaterialScrapMaterialMoveOrderDataProxy;
import com.example.demo.proxy.material.ProductionBackMaterialMoveOrderDataProxy;
import lombok.Data;
import xyz.erupt.annotation.Erupt;
import xyz.erupt.annotation.EruptField;
import xyz.erupt.annotation.sub_field.Edit;
import xyz.erupt.annotation.sub_field.EditType;
import xyz.erupt.annotation.sub_field.Readonly;
import xyz.erupt.annotation.sub_field.View;
import xyz.erupt.annotation.sub_field.sub_edit.InputType;
import xyz.erupt.annotation.sub_field.sub_edit.ReferenceTableType;
import xyz.erupt.jpa.model.BaseModel;

import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Erupt(
        name = "物料报废物料移动单明细",
        dataProxy = { MaterialScrapMaterialMoveOrderDataProxy.class }
)
@Table(name = "t_material_scrap_material_move_order")
@Entity
@Data
public class MaterialScrapMaterialMoveOrder extends BaseModel {

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
                        title = "报废数量"
                ),
                edit = @Edit(
                        title = "报废数量",
                        type = EditType.INPUT,
                        inputType = @InputType,
                        notNull = true
                )
        )
        private String scrapNumber;

        @EruptField(
                views = @View(
                        title = "确认数量"
                ),
                edit = @Edit(
                        title = "确认数量",
                        type = EditType.INPUT,
                        inputType = @InputType
                )
        )
        private String confirmNumber;

}
