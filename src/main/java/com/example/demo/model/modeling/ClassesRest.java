package com.example.demo.model.modeling;

/*
 * Copyright © 2020-2035 erupt.xyz All rights reserved.
 * Author: YuePeng (erupts@126.com)
 */

import org.hibernate.annotations.SQLDelete;
import xyz.erupt.annotation.Erupt;
import xyz.erupt.annotation.EruptField;
import xyz.erupt.annotation.sub_erupt.Filter;
import xyz.erupt.annotation.sub_field.Edit;
import xyz.erupt.annotation.sub_field.EditType;
import xyz.erupt.annotation.sub_field.View;
import xyz.erupt.annotation.sub_field.sub_edit.ChoiceType;
import xyz.erupt.annotation.sub_field.sub_edit.DateType;
import xyz.erupt.annotation.sub_field.sub_edit.Search;
import xyz.erupt.jpa.model.BaseModel;
import xyz.erupt.upms.handler.DictChoiceFetchHandler;

import javax.persistence.Entity;
import javax.persistence.Table;

@Erupt(name = "班次休息时间",
        filter = @Filter("deleted = false")
)
@SQLDelete(sql="update t_classes_rest set deleted = true where id = ?")
@Table(name = "t_classes_rest")
@Entity
public class ClassesRest extends BaseModel {

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

        @EruptField(
                views = @View(
                        title = "类型"
                ),
                edit = @Edit(
                        search = @Search,
                        title = "类型",
//                        type = EditType.INPUT
                        type = EditType.CHOICE,
                        choiceType = @ChoiceType(
                                fetchHandler = DictChoiceFetchHandler.class,
                                fetchHandlerParams = "classesRestType" // 字典编码，通过字典编码获取字典项列表
                        )
                        )
        )
        private String type;

        private Boolean deleted = false;

}
