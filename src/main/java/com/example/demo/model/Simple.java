package com.example.demo.model;

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

/**
 * @author 一只闲鹿
 */
@Erupt(
        name = "简单的例子",
        power = @Power(importable = true, export = true)
)
@Table(name = "t_simple")
@Entity
public class Simple extends BaseModel {

    @EruptField(
            views = @View(title = "文本"),
            edit = @Edit(title = "文本", notNull = true, search = @Search(vague = true))
    )
    private String input;

    @EruptField(
            views = @View(title = "数值", sortable = true),
            edit = @Edit(title = "数值", notNull = false, search = @Search)
    )
    private Float number;

    @EruptField(
            views = @View(title = "布尔", sortable = true),
            edit = @Edit(title = "布尔", notNull = false, search = @Search)
    )
    private Boolean bool;

    @EruptField(
            views = @View(title = "时间", sortable = true),
            edit = @Edit(title = "时间", notNull = false, search = @Search(vague = true), type = EditType.DATE, dateType = @DateType(type = DateType.Type.DATE_TIME))
    )
    private Date date;

}
