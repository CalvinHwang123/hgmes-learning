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

@Erupt(name = "检验清单")
@Table(name = "t_inspection_bill")
@Entity
public class InspectionBill extends BaseModel {

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
                        title = "类型"
                ),
                edit = @Edit(
                        title = "类型",
                        type = EditType.CHOICE, search = @Search,
                        choiceType = @ChoiceType(vl = {@VL(value = "xxx", label = "xxx"), @VL(value = "yyy", label = "yyy")})
                )
        )
        private String type;

        @EruptField(
                views = @View(
                        title = "描述"
                ),
                edit = @Edit(
                        title = "描述",
                        type = EditType.TEXTAREA
                )
        )
        private @Lob String description;

        @EruptField(
                views = @View(
                        title = "检验清单检验项"
                ),
                edit = @Edit(
                        title = "检验清单检验项",
                        type = EditType.TAB_TABLE_ADD
                )
        )
        @OneToMany(cascade = CascadeType.ALL, orphanRemoval = true)
        @OrderBy
        @JoinColumn(name = "inspection_bill_id")
        private Set<InspectionBillInspectionItem> inspectionBillInspectionItems;

        @EruptField(
                views = @View(
                        title = "检验清单物料"
                ),
                edit = @Edit(
                        title = "检验清单物料",
                        type = EditType.TAB_TABLE_ADD
                )
        )
        @OneToMany(cascade = CascadeType.ALL, orphanRemoval = true)
        @OrderBy
        @JoinColumn(name = "inspection_bill_id")
        private Set<InspectionBillMaterial> inspectionBillMaterials;

}
