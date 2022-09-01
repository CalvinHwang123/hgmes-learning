package com.example.demo.model.production;/*
 * Copyright © 2020-2035 erupt.xyz All rights reserved.
 * Author: YuePeng (erupts@126.com)
 */

import javax.persistence.*;

import com.example.demo.handler.production.ProductionPlanSplitOperationHandler;
import com.example.demo.model.material.MaterialBOM;
import com.example.demo.proxy.production.ProductionPlanDataProxy;
import lombok.Data;
import xyz.erupt.annotation.*;
import xyz.erupt.annotation.sub_erupt.*;
import xyz.erupt.annotation.sub_field.*;
import xyz.erupt.annotation.sub_field.sub_edit.*;
import xyz.erupt.upms.model.base.HyperModel;
import xyz.erupt.jpa.model.BaseModel;
import java.util.Set;
import java.util.Date;

@Erupt(
        name = "生产计划",
        dataProxy = { ProductionPlanDataProxy.class },
        rowOperation = @RowOperation(
                title = "拆解",
                icon = "fa fa-files-o",
                mode = RowOperation.Mode.SINGLE,
                type = RowOperation.Type.ERUPT,
                eruptClass = ProductionPlanSplit.class,
                operationHandler = ProductionPlanSplitOperationHandler.class
        )
)
@Table(name = "t_production_plan")
@Entity
@Data
public class ProductionPlan extends BaseModel {

        @EruptField(
                views = @View(
                        title = "计划编码"
                ),
                edit = @Edit(
                        title = "计划编码",
                        type = EditType.INPUT, search = @Search(vague = true), notNull = true,
                        inputType = @InputType
                )
        )
        private String code;

        @EruptField(
                views = @View(
                        title = "产品选择",
                        column = "name"
                ),
                edit = @Edit(
                        title = "产品选择",
                        type = EditType.REFERENCE_TABLE, search = @Search, notNull = true,
                        referenceTableType = @ReferenceTableType(id = "id", label = "name")
                )
        )
        @ManyToOne
        private MaterialBOM productName;

        @EruptField(
                views = @View(
                        title = "计划开始日期"
                ),
                edit = @Edit(
                        title = "计划开始日期",
                        type = EditType.DATE, search = @Search,
                        dateType = @DateType
                )
        )
        private Date planStartDate;

        @EruptField(
                views = @View(
                        title = "计划结束日期"
                ),
                edit = @Edit(
                        title = "计划结束日期",
                        type = EditType.DATE, search = @Search,
                        dateType = @DateType
                )
        )
        private Date planEndDate;

        @EruptField(
                views = @View(
                        title = "计划数量"
                ),
                edit = @Edit(
                        title = "计划数量",
                        type = EditType.INPUT, notNull = true,
                        inputType = @InputType
                )
        )
        private String planNumber;

        @EruptField(
                views = @View(
                        title = "生产数量"
                ),
                edit = @Edit(
                        title = "生产数量",
                        type = EditType.INPUT, show = false,
                        inputType = @InputType
                )
        )
        private String produceNumber;

        @EruptField(
                views = @View(
                        title = "完工数量"
                ),
                edit = @Edit(
                        title = "完工数量",
                        type = EditType.INPUT, show = false,
                        inputType = @InputType
                )
        )
        private String finishNumber;

}
