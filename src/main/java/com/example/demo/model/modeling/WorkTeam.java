package com.example.demo.model.modeling;

import com.example.demo.proxy.modeling.WorkTeamDataProxy;
import org.springframework.ui.Model;
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
 * 班组
 */
@Erupt(
        name = "班组",
        dataProxy = { WorkTeamDataProxy.class },
        power = @Power(
                importable = true,
                export = true
        )
)
@Table(name = "t_work_team")
@Entity
public class WorkTeam extends HyperModel {

    @EruptField(
            views = @View(title = "班组编码"),
            edit = @Edit(title = "班组编码", notNull = true, search = @Search(vague = true))
    )
    private String code;

    @EruptField(
            views = @View(title = "班组名称"),
            edit = @Edit(title = "班组名称", notNull = true, search = @Search(vague = true))
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

    @EruptField(
            views = @View(title = "描述"),
            edit = @Edit(title = "描述", type = EditType.TEXTAREA)
    )
    private String description;

    @EruptField(
            views = @View(
                    title = "班组成员"
            ),
            edit = @Edit(
                    title = "班组成员",
                    type = EditType.TAB_TABLE_ADD
            )
    )
    @OneToMany(cascade = CascadeType.ALL)
    @OrderBy
    @JoinColumn(name = "work_team_id")
    private List<WorkTeamEmployee> workTeamEmployeeList;

}
