package com.example.demo.model.material;/*
 * Copyright © 2020-2035 erupt.xyz All rights reserved.
 * Author: YuePeng (erupts@126.com)
 */

import com.example.demo.proxy.CommonPickingDataProxy;
import lombok.Data;
import xyz.erupt.annotation.Erupt;
import xyz.erupt.annotation.EruptField;
import xyz.erupt.annotation.sub_field.Edit;
import xyz.erupt.annotation.sub_field.EditType;
import xyz.erupt.annotation.sub_field.View;
import xyz.erupt.annotation.sub_field.sub_edit.InputType;
import xyz.erupt.annotation.sub_field.sub_edit.ReferenceTableType;
import xyz.erupt.annotation.sub_field.sub_edit.Search;
import xyz.erupt.jpa.model.BaseModel;

import javax.persistence.*;
import java.util.Set;

@Erupt(
        name = "常规领料",
        dataProxy = { CommonPickingDataProxy.class }
)
@Table(name = "t_common_picking")
@Entity
@Data
public class CommonPicking extends BaseModel {

        @EruptField(
                views = @View(
                        title = "单号"
                ),
                edit = @Edit(
                        title = "单号",
                        type = EditType.INPUT, search = @Search, notNull = true,
                        inputType = @InputType
                )
        )
        private String code;

        @EruptField(
                views = @View(
                        title = "接收线边仓",
                        column = "name"
                ),
                edit = @Edit(
                        title = "接收线边仓",
                        type = EditType.REFERENCE_TABLE, search = @Search, notNull = true,
                        referenceTableType = @ReferenceTableType(id = "id", label = "name")
                )
        )
        @ManyToOne
        private Warehouse warehouse;

        @EruptField(
                views = @View(
                        title = "领料人"
                ),
                edit = @Edit(
                        title = "领料人",
                        type = EditType.INPUT,
                        inputType = @InputType
                )
        )
        private String pickingPerson;

        @EruptField(
                views = @View(
                        title = "领料时间"
                ),
                edit = @Edit(
                        title = "领料时间",
                        type = EditType.INPUT,
                        inputType = @InputType
                )
        )
        private String pickingDate;

        @EruptField(
                views = @View(
                        title = "备注"
                ),
                edit = @Edit(
                        title = "备注",
                        type = EditType.TEXTAREA
                )
        )
        private @Lob String remark;

        @EruptField(
                views = @View(title = "状态"),
                edit = @Edit(title = "状态", show = false)
        )
        private String status;

        @EruptField(
                views = @View(
                        title = "物料移动单明细"
                ),
                edit = @Edit(
                        title = "物料移动单明细",
                        type = EditType.TAB_TABLE_ADD
                )
        )
        @OneToMany(cascade = CascadeType.ALL, orphanRemoval = true)
        @OrderBy
        @JoinColumn(name = "common_picking_id")
        private Set<CommonPickingMaterialMoveOrder> commonPickingMaterialMoveOrders;

}
