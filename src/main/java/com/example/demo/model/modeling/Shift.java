package com.example.demo.model.modeling;

/*
 * Copyright © 2020-2035 erupt.xyz All rights reserved.
 * Author: YuePeng (erupts@126.com)
 */

import com.example.demo.proxy.modeling.ShiftDataProxy;
import xyz.erupt.annotation.Erupt;
import xyz.erupt.annotation.EruptField;
import xyz.erupt.annotation.sub_erupt.Power;
import xyz.erupt.annotation.sub_field.Edit;
import xyz.erupt.annotation.sub_field.EditType;
import xyz.erupt.annotation.sub_field.View;
import xyz.erupt.annotation.sub_field.sub_edit.BoolType;
import xyz.erupt.annotation.sub_field.sub_edit.InputType;
import xyz.erupt.annotation.sub_field.sub_edit.ReferenceTableType;
import xyz.erupt.annotation.sub_field.sub_edit.Search;
import xyz.erupt.jpa.model.BaseModel;

import javax.persistence.*;
import java.util.List;

@Erupt(
        name = "班制",
        dataProxy = { ShiftDataProxy.class },
        power = @Power(
                importable = true,
                export = true
        )
)
@Table(name = "t_shift")
@Entity
public class Shift extends BaseModel {

        @EruptField(
                views = @View(
                        title = "班制编码"
                ),
                edit = @Edit(
                        title = "班制编码",
                        type = EditType.INPUT, notNull = true,
                        inputType = @InputType,
                        search = @Search(vague = true)
                )
        )
        private String code;

        @EruptField(
                views = @View(
                        title = "班制名称"
                ),
                edit = @Edit(
                        title = "班制名称",
                        type = EditType.INPUT, notNull = true,
                        inputType = @InputType,
                        search = @Search(vague = true)
                )
        )
        private String name;

        @EruptField(
                views = @View(
                        title = "是否跨日"
                ),
                edit = @Edit(
                        title = "是否跨日",
                        type = EditType.BOOLEAN, notNull = true,
                        boolType = @BoolType,
                        search = @Search
                )
        )
        private Boolean crossDay = false;

        @ManyToMany // 多对多
        @JoinTable(name = "t_shift_classes", // 定义多对多中间表
                joinColumns = @JoinColumn(name = "shift_id", referencedColumnName = "id"),
                inverseJoinColumns = @JoinColumn(name = "classes_id", referencedColumnName = "id"))
        @EruptField(
                views = @View(title = "班次信息"),
                edit = @Edit(
                        title = "班次信息",
                        type = EditType.TAB_TABLE_REFER,
                        referenceTableType = @ReferenceTableType
                )
        )
        List<Classes> classes;

}
