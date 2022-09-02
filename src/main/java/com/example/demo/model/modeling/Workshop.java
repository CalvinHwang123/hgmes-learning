package com.example.demo.model.modeling;

import com.example.demo.proxy.modeling.WorkshopDataProxy;
import xyz.erupt.annotation.Erupt;
import xyz.erupt.annotation.EruptField;
import xyz.erupt.annotation.sub_erupt.Power;
import xyz.erupt.annotation.sub_field.Edit;
import xyz.erupt.annotation.sub_field.EditType;
import xyz.erupt.annotation.sub_field.View;
import xyz.erupt.annotation.sub_field.sub_edit.ReferenceTableType;
import xyz.erupt.annotation.sub_field.sub_edit.Search;
import xyz.erupt.jpa.model.BaseModel;
import xyz.erupt.upms.model.base.HyperModel;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * @author 一只闲鹿
 */
@Erupt(
        name = "车间建模",
        dataProxy = { WorkshopDataProxy.class },
        power = @Power(
                importable = true,
                export = true
        )
)
@Table(name = "t_workshop")
@Entity
public class Workshop extends HyperModel { // 引用了 Employee 类，如果 views 是数组，则当前类要 extends HyperModel

    @EruptField(
            views = @View(title = "车间编码"),
            edit = @Edit(title = "车间编码", notNull = true, search = @Search(vague = true))
    )
    private String code;

    @EruptField(
            views = @View(title = "车间名称"),
            edit = @Edit(title = "车间名称", notNull = true, search = @Search(vague = true))
    )
    private String name;

    @ManyToOne
    @JoinColumn
    @EruptField(
            views = {
                    @View(title = "责任人", column = "name"),
                    // 引用了 Employee 类，如果 views 是数组，则当前类要 extends HyperModel
                    @View(title = "责任人工号", column = "employeeNo")
            },
            edit = @Edit(
                    title = "责任人",
                    type = EditType.REFERENCE_TABLE,
                    referenceTableType = @ReferenceTableType
            )
    )
    private Employee principal;

    @ManyToOne
    @JoinColumn
    @EruptField(
            views = @View(title = "班制", column = "name"),
            edit = @Edit(
                    title = "班制",
                    type = EditType.REFERENCE_TABLE,
                    referenceTableType = @ReferenceTableType
            )
    )
    private Shift shift;


    @ManyToOne
    @JoinColumn
    @EruptField(
            views = @View(title = "工作日历", column = "name"),
            edit = @Edit(
                    title = "工作日历",
                    type = EditType.REFERENCE_TABLE,
                    referenceTableType = @ReferenceTableType
            )
    )
    private Calendar calendar;

}
