package com.example.demo.model.modeling;

import xyz.erupt.annotation.Erupt;
import xyz.erupt.annotation.EruptField;
import xyz.erupt.annotation.sub_erupt.Tree;
import xyz.erupt.annotation.sub_field.Edit;
import xyz.erupt.annotation.sub_field.EditType;
import xyz.erupt.annotation.sub_field.View;
import xyz.erupt.annotation.sub_field.sub_edit.BoolType;
import xyz.erupt.annotation.sub_field.sub_edit.ReferenceTreeType;
import xyz.erupt.jpa.model.BaseModel;

import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * 组织架构
 */
@Erupt(
       name = "组织架构",
       tree = @Tree(pid = "parent.id")
)
@Table(name = "t_unit_framework")
@Entity
public class UnitFramework extends BaseModel {

    @EruptField(
            views = @View(title = "编码"),
            edit = @Edit(title = "编码")
    )
    private String code;

    @EruptField(
            views = @View(title = "名称"),
            edit = @Edit(title = "名称")
    )
    private String name;

    @ManyToOne
    @EruptField(
            edit = @Edit(title = "层级名称", type = EditType.REFERENCE_TREE,
                    referenceTreeType = @ReferenceTreeType(pid = "parent.id"))
    )
    private UnitLevel unitLevel;

    @ManyToOne
    @EruptField(
            edit = @Edit(
                    title = "父组织架构",
                    type = EditType.REFERENCE_TREE,
                    referenceTreeType = @ReferenceTreeType(pid = "parent.id")
            )
    )
    private UnitFramework parent;

    @EruptField(
            views = @View(
                    title = "是否资源"
            ),
            edit = @Edit(
                    title = "是否资源",
                    type = EditType.BOOLEAN,
                    boolType = @BoolType
            )
    )
    private Boolean resource = false;

}
