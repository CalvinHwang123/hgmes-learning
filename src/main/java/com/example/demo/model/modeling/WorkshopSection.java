package com.example.demo.model.modeling;

import com.example.demo.model.modeling.WorkingSectionProcedure;
import com.example.demo.model.modeling.Workshop;
import com.example.demo.proxy.modeling.ProductionLineDataProxy;
import com.example.demo.proxy.modeling.WorkshopSectionDataProxy;
import lombok.Data;
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

import javax.persistence.*;
import java.util.List;

/**
 * 工段
 */
@Erupt(
       name = "工段",
        dataProxy = { WorkshopSectionDataProxy.class },
        power = @Power(
                importable = true,
                export = true
        )
)
@Table(name = "t_workshop_section")
@Entity
@Data
public class WorkshopSection extends HyperModel {

    @EruptField(
            views = @View(title = "工段编码"),
            edit = @Edit(title = "工段编码", notNull = true, search = @Search(vague = true))
    )
    private String code;

    @EruptField(
            views = @View(title = "工段名称"),
            edit = @Edit(title = "工段名称", notNull = true, search = @Search(vague = true))
    )
    private String name;

    @ManyToOne
    @EruptField(
            views = @View(title = "所属车间", column = "name"),
            edit = @Edit(
                    title = "所属车间",
                    notNull = true,
                    type = EditType.REFERENCE_TABLE,
                    referenceTableType = @ReferenceTableType
            )
    )
    private Workshop workshop;

    @OneToMany(cascade = CascadeType.ALL)
    @JoinColumn(name = "working_section_id")
    @EruptField(
            views = @View(title = "关联工序", column = "name"),
            edit = @Edit(
                    title = "关联工序",
                    type = EditType.TAB_TABLE_ADD
            )
    )
    private List<WorkingSectionProcedure> workingSectionProcedures;

}
