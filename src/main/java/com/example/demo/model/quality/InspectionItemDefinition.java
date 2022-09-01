package com.example.demo.model.quality;/*
 * Copyright © 2020-2035 erupt.xyz All rights reserved.
 * Author: YuePeng (erupts@126.com)
 */

import javax.persistence.*;

import com.example.demo.model.modeling.MeasureUnit;
import xyz.erupt.annotation.*;
import xyz.erupt.annotation.sub_erupt.*;
import xyz.erupt.annotation.sub_field.*;
import xyz.erupt.annotation.sub_field.sub_edit.*;
import xyz.erupt.upms.model.base.HyperModel;
import xyz.erupt.jpa.model.BaseModel;
import java.util.Set;
import java.util.Date;

@Erupt(name = "检验项定义")
@Table(name = "t_inspection_item_definition")
@Entity
public class InspectionItemDefinition extends BaseModel {

        @EruptField(
                views = @View(
                        title = "编码"
                ),
                edit = @Edit(
                        title = "编码",
                        type = EditType.INPUT, search = @Search, notNull = true,
                        inputType = @InputType
                )
        )
        private String code;

        @EruptField(
                views = @View(
                        title = "名称"
                ),
                edit = @Edit(
                        title = "名称",
                        type = EditType.INPUT, search = @Search, notNull = true,
                        inputType = @InputType
                )
        )
        private String name;

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
                        title = "定量定性"
                ),
                edit = @Edit(
                        title = "定量定性",
                        type = EditType.BOOLEAN, search = @Search, notNull = true,
                        boolType = @BoolType(trueText = "定量", falseText = "定性")
                )
        )
        private Boolean quantitativeQualitative;

        @EruptField(
                views = @View(
                        title = "最大值"
                ),
                edit = @Edit(
                        title = "最大值",
                        type = EditType.NUMBER,
                        numberType = @NumberType
                )
        )
        private Integer maxValue;

        @EruptField(
                views = @View(
                        title = "最小值"
                ),
                edit = @Edit(
                        title = "最小值",
                        type = EditType.NUMBER,
                        numberType = @NumberType
                )
        )
        private Integer minValue;

        @EruptField(
                views = @View(
                        title = "目标值"
                ),
                edit = @Edit(
                        title = "目标值",
                        type = EditType.NUMBER,
                        numberType = @NumberType
                )
        )
        private Integer goalValue;

        @EruptField(
                views = @View(
                        title = "计量单位",
                        column = "englishName"
                ),
                edit = @Edit(
                        title = "计量单位",
                        type = EditType.REFERENCE_TABLE,
                        referenceTableType = @ReferenceTableType(id = "id", label = "englishName")
                )
        )
        @ManyToOne
        private MeasureUnit measureUnit;

}
