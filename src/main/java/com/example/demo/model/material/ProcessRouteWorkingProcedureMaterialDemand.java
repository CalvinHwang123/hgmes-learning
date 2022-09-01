package com.example.demo.model.material;/*
 * Copyright © 2020-2035 erupt.xyz All rights reserved.
 * Author: YuePeng (erupts@126.com)
 */

import javax.persistence.*;
import xyz.erupt.annotation.*;
import xyz.erupt.annotation.sub_erupt.*;
import xyz.erupt.annotation.sub_field.*;
import xyz.erupt.annotation.sub_field.sub_edit.*;
import xyz.erupt.upms.handler.DictChoiceFetchHandler;
import xyz.erupt.upms.model.base.HyperModel;
import xyz.erupt.jpa.model.BaseModel;
import java.util.Set;
import java.util.Date;

@Erupt(name = "工艺物料需求明细")
@Table(name = "t_process_route_working_procedure_material_demand")
@Entity
public class ProcessRouteWorkingProcedureMaterialDemand extends BaseModel {

        @EruptField(
                views = @View(
                        title = "物料编码"
                ),
                edit = @Edit(
                        title = "物料编码",
                        type = EditType.INPUT,
                        inputType = @InputType,
                        notNull = true,
                        search = @Search(vague = true)
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
                        type = EditType.REFERENCE_TABLE,
                        referenceTableType = @ReferenceTableType(id = "id", label = "name"),
                        notNull = true,
                        search = @Search(vague = true)
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
                        type = EditType.CHOICE,
                        choiceType = @ChoiceType(
                                fetchHandler = DictChoiceFetchHandler.class,
                                fetchHandlerParams = "controlType"
                        )/*,
                        search = @Search*/
                )
        )
        private String controlType;

        @EruptField(
                views = @View(
                        title = "需求数量"
                ),
                edit = @Edit(
                        title = "需求数量",
                        type = EditType.NUMBER,
                        numberType = @NumberType
                )
        )
        private Integer demandNumber;

        @EruptField(
                views = @View(
                        title = "采集选项"
                ),
                edit = @Edit(
                        title = "采集选项",
                        type = EditType.CHOICE,
                        choiceType = @ChoiceType(
                                fetchHandler = DictChoiceFetchHandler.class,
                                fetchHandlerParams = "collectOption"
                        )
                )
        )
        private String collectOption;

}
