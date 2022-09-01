package com.example.demo.model.modeling;

import com.example.demo.model.modeling.ProductionLine;
import com.example.demo.model.modeling.WorkingPositionProcedure;
import com.example.demo.proxy.modeling.WorkshopPositionDataProxy;
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
 * 工位
 */
@Erupt(
        name = "工位",
        dataProxy = { WorkshopPositionDataProxy.class },
        power = @Power(
                importable = true,
                export = true
        )
)
@Table(name = "t_workshop_position")
@Entity
@Data
public class WorkshopPosition extends HyperModel {

    @EruptField(
            views = @View(title = "工位编码"),
            edit = @Edit(title = "工位编码", notNull = true, search = @Search(vague = true))
    )
    private String code;

    @EruptField(
            views = @View(title = "工位名称"),
            edit = @Edit(title = "工位名称", notNull = true, search = @Search(vague = true))
    )
    private String name;

    @ManyToOne
    @EruptField(
            views = {
                    @View(title = "所属产线", column = "name"),
            },
            edit = @Edit(title = "所属产线", type = EditType.REFERENCE_TABLE,
                    referenceTableType = @ReferenceTableType)
    )
    private ProductionLine productionLine;

    @OneToMany(cascade = CascadeType.ALL)
    @JoinColumn(name = "working_section_id")
    @EruptField(
            views = @View(title = "关联工序", column = "name"),
            edit = @Edit(
                    title = "关联工序",
                    type = EditType.TAB_TABLE_ADD,
                    notNull = true
            )
    )
    private List<WorkingPositionProcedure> workingPositionProcedures;

}
