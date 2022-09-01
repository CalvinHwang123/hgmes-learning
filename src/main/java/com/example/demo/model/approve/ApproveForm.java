package com.example.demo.model.approve;

import lombok.Data;
import xyz.erupt.annotation.Erupt;
import xyz.erupt.annotation.EruptField;
import xyz.erupt.annotation.sub_field.Edit;
import xyz.erupt.annotation.sub_field.EditType;
import xyz.erupt.annotation.sub_field.View;
import xyz.erupt.annotation.sub_field.sub_edit.BoolType;
import xyz.erupt.jpa.model.BaseModel;

import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * @author 一只闲鹿
 */
@Erupt(name = "审核表单")
@Table(name = "t_approve_form")
@Entity
@Data
public class ApproveForm extends BaseModel {

    @EruptField(
            views = @View(title = "审核结果"),
            edit = @Edit(
                    title = "审核结果",
                    notNull = true,
                    type = EditType.BOOLEAN,
                    boolType = @BoolType(
                            trueText = "通过",
                            falseText = "拒绝"
                    )
            )
    )
    private Boolean result;

    @EruptField(
            views = @View(title = "审核备注"),
            edit = @Edit(title = "审核备注", type = EditType.TEXTAREA)
    )
    private String remark;

    @EruptField(
            views = @View(title = "关联单据ID", show = false),
            edit = @Edit(title = "关联单据ID", show = false)
    )
    private Long relationId;


}
