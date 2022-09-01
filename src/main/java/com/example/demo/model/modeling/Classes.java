package com.example.demo.model.modeling;

/*
 * Copyright © 2020-2035 erupt.xyz All rights reserved.
 * Author: YuePeng (erupts@126.com)
 */

import com.example.demo.proxy.modeling.ClassesDataProxy;
import xyz.erupt.annotation.Erupt;
import xyz.erupt.annotation.EruptField;
import xyz.erupt.annotation.sub_erupt.Power;
import xyz.erupt.annotation.sub_field.Edit;
import xyz.erupt.annotation.sub_field.EditType;
import xyz.erupt.annotation.sub_field.View;
import xyz.erupt.annotation.sub_field.sub_edit.*;
import xyz.erupt.jpa.model.BaseModel;

import javax.persistence.*;

@Erupt(
        name = "班次",
        dataProxy = { ClassesDataProxy.class },
        power = @Power(
                importable = true,
                export = true
        )
)
@Table(name = "t_classes")
@Entity
public class Classes extends BaseModel {

        @EruptField(
                views = @View(
                        title = "班次编码"
                ),
                edit = @Edit(
                        title = "班次编码",
                        type = EditType.INPUT, notNull = true,
                        inputType = @InputType,
                        search = @Search(vague = true)
                )
        )
        private String code;

        @EruptField(
                views = @View(
                        title = "班次名称"
                ),
                edit = @Edit(
                        title = "班次名称",
                        type = EditType.INPUT, notNull = true,
                        inputType = @InputType,
                        search = @Search(vague = true)
                )
        )
        private String name;

        @EruptField(
                views = @View(
                        title = "开始时间"
                ),
                edit = @Edit(
                        title = "开始时间",
                        type = EditType.DATE, notNull = true,
                        dateType = @DateType(type = DateType.Type.TIME)
                )
        )
        private String startTime;

        @EruptField(
                views = @View(
                        title = "结束时间"
                ),
                edit = @Edit(
                        title = "结束时间",
                        type = EditType.DATE, notNull = true,
                        dateType = @DateType(type = DateType.Type.TIME)
                )
        )
        private String endTime;

//        @EruptField(
//                views = @View(
//                        title = "是否跨日"
//                ),
//                edit = @Edit(
//                        title = "是否跨日",
//                        type = EditType.BOOLEAN, notNull = true,
//                        boolType = @BoolType,
//                        search = @Search
//                )
//        )
//        private Boolean crossDay = false;
//
//        @ManyToMany // 多对多
//        @JoinTable(name = "t_classes_classes_rest", // 定义多对多中间表
//                joinColumns = @JoinColumn(name = "classes_id", referencedColumnName = "id"),
//                inverseJoinColumns = @JoinColumn(name = "classes_rest_id", referencedColumnName = "id"))
//        @EruptField(
//                edit = @Edit(
//                        title = "班次休息时间",
//                        type = EditType.TAB_TABLE_REFER,
//                        referenceTableType = @ReferenceTableType(label = "type")
//                )
//        )
//        private List<ClassesRest> classesRests;

}
