package com.example.demo.model.modeling;

import xyz.erupt.annotation.Erupt;
import xyz.erupt.annotation.EruptField;
import xyz.erupt.annotation.sub_erupt.Power;
import xyz.erupt.annotation.sub_field.Edit;
import xyz.erupt.annotation.sub_field.EditType;
import xyz.erupt.annotation.sub_field.View;
import xyz.erupt.annotation.sub_field.sub_edit.DateType;
import xyz.erupt.annotation.sub_field.sub_edit.Search;
import xyz.erupt.jpa.model.BaseModel;

import javax.persistence.*;
import java.util.Date;
import java.util.List;

/**
 * 工作日历
 * @author 一只闲鹿
 */
@Erupt(
        name = "工作日历",
        power = @Power(
                importable = true,
                export = true
        )
)
@Table(name = "t_calendar")
@Entity
public class Calendar extends BaseModel {

    @EruptField(
            views = @View(title = "日历名称"),
            edit = @Edit(title = "日历名称", notNull = true, search = @Search(vague = true))
    )
    private String name;

    @EruptField(
            views = @View(
                    title = "开始时间"
            ),
            edit = @Edit(
                    title = "开始时间",
                    type = EditType.DATE, notNull = true,
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
                    type = EditType.DATE, notNull = true,
                    dateType = @DateType(type = DateType.Type.DATE)
            )
    )
    private Date endTime;

    @EruptField(
            views = @View(
                    title = "工作日历明细"
            ),
            edit = @Edit(
                    title = "工作日历明细",
                    type = EditType.TAB_TABLE_ADD
            )
    )
    @OneToMany(cascade = CascadeType.ALL)
    @OrderBy
    @JoinColumn(name = "calendar_id")
    private List<CalendarDetail> calendarDetailList;

}
