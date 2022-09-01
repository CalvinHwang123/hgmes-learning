package com.example.demo.model.modeling;

import com.example.demo.constant.Constant;
import com.example.demo.proxy.modeling.WorkTeamEmployeeDataProxy;
import lombok.Data;
import xyz.erupt.annotation.Erupt;
import xyz.erupt.annotation.EruptField;
import xyz.erupt.annotation.sub_field.Edit;
import xyz.erupt.annotation.sub_field.EditType;
import xyz.erupt.annotation.sub_field.Readonly;
import xyz.erupt.annotation.sub_field.View;
import xyz.erupt.annotation.sub_field.sub_edit.ReferenceTableType;
import xyz.erupt.jpa.model.BaseModel;

import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * 班组员工明细
 */
@Erupt(
        name = "班组员工明细",
        dataProxy = {WorkTeamEmployeeDataProxy.class}
)
@Table(name = "t_work_team_employee")
@Entity
@Data
public class WorkTeamEmployee extends BaseModel {

    @EruptField(
            views = @View(title = "工号"),
            edit = @Edit(title = "工号", readonly = @Readonly, placeHolder = Constant.UPDATE_AUTO_AFTER_SAVE)
    )
    private String employeeNo;

    @ManyToOne
    @EruptField(
            views = @View(title = "姓名", column = "name"),
            edit = @Edit(title = "姓名", type = EditType.REFERENCE_TABLE, referenceTableType = @ReferenceTableType)
    )
    private Employee employee;

    @EruptField(
            views = @View(title = "是否负责人"),
            edit = @Edit(title = "是否负责人", type = EditType.BOOLEAN)
    )
    private Boolean principal;

}
