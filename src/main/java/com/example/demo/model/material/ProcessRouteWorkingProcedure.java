package com.example.demo.model.material;/*
 * Copyright © 2020-2035 erupt.xyz All rights reserved.
 * Author: YuePeng (erupts@126.com)
 */

import javax.persistence.*;

import com.example.demo.constant.Constant;
import com.example.demo.model.modeling.WorkingProcedure;
import com.example.demo.proxy.material.ProcessRouteWorkingProcedureDataProxy;
import lombok.Data;
import xyz.erupt.annotation.*;
import xyz.erupt.annotation.sub_field.*;
import xyz.erupt.annotation.sub_field.sub_edit.*;
import xyz.erupt.jpa.model.BaseModel;

import java.util.Set;

@Erupt(
        name = "关联工序明细",
        dataProxy = { ProcessRouteWorkingProcedureDataProxy.class }
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

        // 以下字段给自定义页面使用，所以新建数据库表结构，但不在界面体现
        // 但还是显示了
        @EruptField(
                views = @View(
                        title = "工艺物料需求",
                        show = false
                ),
                edit = @Edit(
                        title = "工艺物料需求",
                        type = EditType.TAB_TABLE_ADD,
                        show = false
                )
        )
        @OneToMany(cascade = CascadeType.ALL, orphanRemoval = true)
        @OrderBy
        @JoinColumn(name = "process_route_working_procedure_id")
        private Set<ProcessRouteWorkingProcedureMaterialDemand> processRouteWorkingProcedureMaterialDemands;
        // 以上字段给自定义页面使用，所以新建数据库表结构，但不在界面体现

}
