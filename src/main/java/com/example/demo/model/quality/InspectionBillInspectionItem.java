package com.example.demo.model.quality;/*
 * Copyright © 2020-2035 erupt.xyz All rights reserved.
 * Author: YuePeng (erupts@126.com)
 */

import javax.persistence.*;
import xyz.erupt.annotation.*;
import xyz.erupt.annotation.sub_erupt.*;
import xyz.erupt.annotation.sub_field.*;
import xyz.erupt.annotation.sub_field.sub_edit.*;
import xyz.erupt.upms.model.base.HyperModel;
import xyz.erupt.jpa.model.BaseModel;
import java.util.Set;
import java.util.Date;

@Erupt(name = "检验清单检验项明细")
@Table(name = "t_inspection_bill_inspection_item")
@Entity
public class InspectionBillInspectionItem extends BaseModel {

        @EruptField(
                views = @View(
                        title = "检验项编码"
                ),
                edit = @Edit(
                        title = "检验项编码",
                        type = EditType.INPUT, notNull = true,
                        inputType = @InputType
                )
        )
        private String inspectionItemCode;

        @EruptField(
                views = @View(
                        title = "检验项名称",
                        column = "name"
                ),
                edit = @Edit(
                        title = "检验项名称",
                        type = EditType.REFERENCE_TABLE,
                        referenceTableType = @ReferenceTableType(id = "id", label = "name")
                )
        )
        @ManyToOne
        private InspectionItemDefinition inspectionItem;

        @EruptField(
                views = @View(
                        title = "检验标准"
                ),
                edit = @Edit(
                        title = "检验标准",
                        type = EditType.INPUT,
                        inputType = @InputType
                )
        )
        private String inspectionStandard;

        @EruptField(
                views = @View(
                        title = "上限"
                ),
                edit = @Edit(
                        title = "上限",
                        type = EditType.INPUT,
                        inputType = @InputType
                )
        )
        private String maxValue;

        @EruptField(
                views = @View(
                        title = "目标值"
                ),
                edit = @Edit(
                        title = "目标值",
                        type = EditType.INPUT,
                        inputType = @InputType
                )
        )
        private String goalValue;

        @EruptField(
                views = @View(
                        title = "下限"
                ),
                edit = @Edit(
                        title = "下限",
                        type = EditType.INPUT,
                        inputType = @InputType
                )
        )
        private String minValue;

        @EruptField(
                views = @View(
                        title = "计量单位"
                ),
                edit = @Edit(
                        title = "计量单位",
                        type = EditType.INPUT,
                        inputType = @InputType
                )
        )
        private String measureUnit;

}
