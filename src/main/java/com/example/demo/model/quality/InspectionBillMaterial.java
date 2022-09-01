package com.example.demo.model.quality;/*
 * Copyright © 2020-2035 erupt.xyz All rights reserved.
 * Author: YuePeng (erupts@126.com)
 */

import javax.persistence.*;

import com.example.demo.model.material.Material;
import xyz.erupt.annotation.*;
import xyz.erupt.annotation.sub_erupt.*;
import xyz.erupt.annotation.sub_field.*;
import xyz.erupt.annotation.sub_field.sub_edit.*;
import xyz.erupt.upms.model.base.HyperModel;
import xyz.erupt.jpa.model.BaseModel;
import java.util.Set;
import java.util.Date;

@Erupt(name = "检验清单物料明细")
@Table(name = "t_inspection_bill_material")
@Entity
public class InspectionBillMaterial extends BaseModel {

        @EruptField(
                views = @View(
                        title = "物料编码"
                ),
                edit = @Edit(
                        title = "物料编码",
                        type = EditType.INPUT, search = @Search, notNull = true,
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
                        type = EditType.REFERENCE_TABLE, search = @Search, notNull = true,
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

}
