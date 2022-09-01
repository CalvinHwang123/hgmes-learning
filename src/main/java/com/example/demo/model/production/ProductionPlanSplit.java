package com.example.demo.model.production;

import com.example.demo.model.material.ProcessRoute;
import lombok.Data;
import xyz.erupt.annotation.Erupt;
import xyz.erupt.annotation.EruptField;
import xyz.erupt.annotation.fun.DataProxy;
import xyz.erupt.annotation.sub_field.Edit;
import xyz.erupt.annotation.sub_field.EditType;
import xyz.erupt.annotation.sub_field.Readonly;
import xyz.erupt.annotation.sub_field.View;
import xyz.erupt.annotation.sub_field.sub_edit.DateType;
import xyz.erupt.annotation.sub_field.sub_edit.InputType;
import xyz.erupt.annotation.sub_field.sub_edit.ReferenceTableType;
import xyz.erupt.annotation.sub_field.sub_edit.Search;
import xyz.erupt.jpa.model.BaseModel;

import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import java.util.Date;

/**
 * 生产计划拆解表单
 */
@Erupt(
        name = "生产计划拆解表单"
)
@Table(name = "t_production_plan_split")
@Entity
@Data
public class ProductionPlanSplit extends BaseModel implements DataProxy<ProductionPlanSplit> {

    @EruptField(
            views = @View(
                    title = "拆解数量"
            ),
            edit = @Edit(
                    title = "拆解数量",
                    type = EditType.INPUT, notNull = true,
                    inputType = @InputType
            )
    )
    private String splitNumber;

    @EruptField(
            views = @View(
                    title = "可拆解数量"
            ),
            edit = @Edit(
                    title = "可拆解数量",
                    desc = "可拆解数量为生产计划的计划数量扣除所有已拆解工单的数量",
                    type = EditType.INPUT,
                    readonly = @Readonly,
                    inputType = @InputType
            )
    )
    private String canSplitNumber;

    @EruptField(
            views = @View(
                    title = "工艺路线",
                    column = "name"
            ),
            edit = @Edit(
                    title = "工艺路线",
                    type = EditType.REFERENCE_TABLE, search = @Search, notNull = true,
                    referenceTableType = @ReferenceTableType(id = "id", label = "name")
            )
    )
    @ManyToOne
    private ProcessRoute processRoute;

    @EruptField(
            views = @View(
                    title = "计划开始日期"
            ),
            edit = @Edit(
                    title = "计划开始日期",
                    notNull = true,
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
                    notNull = true,
                    type = EditType.DATE, search = @Search,
                    dateType = @DateType
            )
    )
    private Date planEndDate;

    @EruptField(
            views = @View(title = "优先级"),
            edit = @Edit(title = "优先级")
    )
    private String priority;

    @Override
    public void addBehavior(ProductionPlanSplit productionPlanSplit) {
    }
}
