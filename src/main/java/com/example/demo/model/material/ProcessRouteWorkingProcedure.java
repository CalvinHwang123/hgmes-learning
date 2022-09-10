package com.example.demo.model.material;/*
 * Copyright © 2020-2035 erupt.xyz All rights reserved.
 * Author: YuePeng (erupts@126.com)
 */

import com.example.demo.constant.Constant;
import com.example.demo.model.modeling.WorkingProcedure;
import com.example.demo.proxy.material.ProcessRouteWorkingProcedureDataProxy;
import lombok.Data;
import xyz.erupt.annotation.Erupt;
import xyz.erupt.annotation.EruptField;
import xyz.erupt.annotation.sub_erupt.Drill;
import xyz.erupt.annotation.sub_erupt.Link;
import xyz.erupt.annotation.sub_field.Edit;
import xyz.erupt.annotation.sub_field.EditType;
import xyz.erupt.annotation.sub_field.Readonly;
import xyz.erupt.annotation.sub_field.View;
import xyz.erupt.annotation.sub_field.sub_edit.InputType;
import xyz.erupt.annotation.sub_field.sub_edit.NumberType;
import xyz.erupt.annotation.sub_field.sub_edit.ReferenceTableType;
import xyz.erupt.annotation.sub_field.sub_edit.Search;
import xyz.erupt.jpa.model.BaseModel;

import javax.persistence.*;
import java.util.Set;

@Erupt(
        name = "关联工序明细",
        dataProxy = { ProcessRouteWorkingProcedureDataProxy.class }
        /*, 多级嵌套后，下钻不支持了
        drills = {
                @Drill(code = "drill",
                        title = "工艺物料需求",
                        //最终生成的表达式为：ProcessRouteWorkingProcedure.id = ProcessRouteWorkingProcedureMaterialDemand.processRouteWorkingProcedure.id
                        link = @Link(linkErupt = ProcessRouteWorkingProcedureMaterialDemand.class,  //关联表
                                joinColumn = "ProcessRouteWorkingProcedure.id"))  //关联表达式
        }*/
)
@Table(name = "t_process_route_working_procedure")
@Entity
@Data
public class ProcessRouteWorkingProcedure extends BaseModel {

        @EruptField(
                views = @View(
                        title = "工序编码"
                ),
                edit = @Edit(
                        title = "工序编码",
                        type = EditType.INPUT,
                        inputType = @InputType,
                        readonly = @Readonly,
                        placeHolder = Constant.UPDATE_AUTO_AFTER_SAVE
                )
        )
        private String workingProcedureCode;

        @EruptField(
                views = @View(
                        title = "工序名称",
                        column = "name"
                ),
                edit = @Edit(
                        title = "工序名称",
                        search = @Search,
                        type = EditType.REFERENCE_TABLE, notNull = true,
                        referenceTableType = @ReferenceTableType(id = "id", label = "name")
                )
        )
        @ManyToOne
        private WorkingProcedure workingProcedure;

        @EruptField(
                views = @View(
                        title = "顺序"
                ),
                edit = @Edit(
                        title = "顺序",
                        type = EditType.INPUT, search = @Search,
                        inputType = @InputType
                )
        )
        private String sortNo;

        @EruptField(
                views = @View(
                        title = "准备工时"
                ),
                edit = @Edit(
                        title = "准备工时",
                        type = EditType.NUMBER,
                        numberType = @NumberType
                )
        )
        private Integer prepareHour;

        @EruptField(
                views = @View(
                        title = "标准工时"
                ),
                edit = @Edit(
                        title = "标准工时",
                        type = EditType.NUMBER,
                        numberType = @NumberType
                )
        )
        private Integer standardHour;

        // 已经使用下钻功能了，所以下面的注释掉
//        // 以下字段给自定义页面使用，所以新建数据库表结构，但不在界面体现
//        // 但还是显示了
//        @EruptField(
//                views = @View(
//                        title = "工艺物料需求",
//                        show = false
//                ),
//                edit = @Edit(
//                        title = "工艺物料需求",
//                        type = EditType.TAB_TABLE_ADD,
//                        show = false
//                )
//        )
//        @OneToMany(cascade = CascadeType.ALL, orphanRemoval = true)
//        @OrderBy
//        @JoinColumn(name = "process_route_working_procedure_id")
//        private Set<ProcessRouteWorkingProcedureMaterialDemand> processRouteWorkingProcedureMaterialDemands;
//        // 以上字段给自定义页面使用，所以新建数据库表结构，但不在界面体现

}
