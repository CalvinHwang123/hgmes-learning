package com.example.demo.model.production;

import com.example.demo.model.material.Supplier;
import xyz.erupt.annotation.Erupt;
import xyz.erupt.annotation.EruptField;
import xyz.erupt.annotation.sub_field.Edit;
import xyz.erupt.annotation.sub_field.EditType;
import xyz.erupt.annotation.sub_field.View;
import xyz.erupt.annotation.sub_field.sub_edit.ReferenceTableType;

import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

/**
 * @author 一只闲鹿
 */
@Erupt(name = "工单委外表单")
public class WorkOrderOutsourcing {

    @Id
    @EruptField
    private String id;

    @ManyToOne
    @JoinColumn
    @EruptField(
            views = @View(title = "供应商", column = "name"),
            edit = @Edit(
                    title = "供应商",
                    notNull = true,
                    type = EditType.REFERENCE_TABLE,
                    referenceTableType = @ReferenceTableType
            )
    )
    private Supplier supplier;

}
