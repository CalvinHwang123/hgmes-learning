package com.example.demo.model.modeling;

import com.example.demo.proxy.modeling.CalendarDetailDataProxy;
import lombok.Data;
import xyz.erupt.annotation.Erupt;
import xyz.erupt.annotation.EruptField;
import xyz.erupt.annotation.sub_field.Edit;
import xyz.erupt.annotation.sub_field.EditType;
import xyz.erupt.annotation.sub_field.View;
import xyz.erupt.annotation.sub_field.sub_edit.BoolType;
import xyz.erupt.annotation.sub_field.sub_edit.DateType;
import xyz.erupt.annotation.sub_field.sub_edit.ShowBy;
import xyz.erupt.jpa.model.BaseModel;

import javax.persistence.Entity;
import javax.persistence.Table;
import java.util.Date;

/**
 * 工作日历明细
 * @author 一只闲鹿
 */
@Erupt(
        name = "工作日历明细",
        dataProxy = { CalendarDetailDataProxy.class }
)
@Table(name = "t_calendar_detail")
@Entity
@Data
public class CalendarDetail extends BaseModel {

    @EruptField(
            views = @View(title = "日历类型"),
            edit = @Edit(title = "日历类型", type = EditType.BOOLEAN, notNull = true,
                    boolType = @BoolType(trueText = "工作日", falseText = "非工作日"))
    )
    private Boolean type;

    @EruptField(
            views = @View(title = "权重"),
            edit = @Edit(title = "权重", notNull = true)
    )
    private Float weight;

    @EruptField(
            views = @View(title = "循环周期"),
            edit = @Edit(title = "循环周期", type = EditType.BOOLEAN, notNull = true,
                    boolType = @BoolType(trueText = "循环", falseText = "固定日期"))
    )
    private Boolean cyclePeriod;

    @EruptField(
            views = @View(
                    title = "开始时间"
            ),
            edit = @Edit(
                    title = "开始时间",
                    type = EditType.DATE,
                    dateType = @DateType(type = DateType.Type.DATE)
            )
    )
    private Date startTime;

    @EruptField(
            views = @View(
                    title = "结束时间"
            ),
            edit = @Edit(
                    title = "结束时间",
                    type = EditType.DATE,
                    dateType = @DateType(type = DateType.Type.DATE),
                    showBy = @ShowBy(dependField = "cyclePeriod", expr = "value == false")
            )
    )
    private Date endTime;

    @EruptField(
            views = @View(title = "周期"),
            edit = @Edit(title = "周期", showBy = @ShowBy(dependField = "cyclePeriod", expr = "value == true"))
    )
    private String period;

    @EruptField(
            views = @View(title = "间隔"),
            edit = @Edit(title = "间隔", showBy = @ShowBy(dependField = "cyclePeriod", expr = "value == true"))
    )
    private String timeInterval;

    @EruptField(
            views = @View(title = "天数"),
            edit = @Edit(title = "天数", showBy = @ShowBy(dependField = "cyclePeriod", expr = "value == true"))
    )
    private String days;

    @EruptField(
            views = @View(title = "备注"),
            edit = @Edit(title = "备注", type = EditType.TEXTAREA)
    )
    private String remark;

}
