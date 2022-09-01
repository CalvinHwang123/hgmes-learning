package com.example.demo.model.material;

import com.example.demo.proxy.material.MaterialCategoryDataProxy;
import lombok.Data;
import xyz.erupt.annotation.Erupt;
import xyz.erupt.annotation.EruptField;
import xyz.erupt.annotation.sub_erupt.Power;
import xyz.erupt.annotation.sub_erupt.Tree;
import xyz.erupt.annotation.sub_field.Edit;
import xyz.erupt.annotation.sub_field.EditType;
import xyz.erupt.annotation.sub_field.View;
import xyz.erupt.annotation.sub_field.sub_edit.BoolType;
import xyz.erupt.annotation.sub_field.sub_edit.ReferenceTreeType;
import xyz.erupt.annotation.sub_field.sub_edit.Search;
import xyz.erupt.jpa.model.BaseModel;

import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * 物料分类
 */
@Erupt(
        name = "物料分类",
        tree = @Tree(pid = "parent.id"),
        dataProxy = { MaterialCategoryDataProxy.class },
        power = @Power(
                importable = true,
                export = true
        )
)
@Table(name = "t_material_category")
@Entity
@Data
public class MaterialCategory extends BaseModel {

    @EruptField(
            views = @View(title = "分类编码"),
            edit = @Edit(title = "分类编码", notNull = true, search = @Search(vague = true))
    )
    private String code;

    @EruptField(
            views = @View(title = "分类名称"),
            edit = @Edit(title = "分类名称", notNull = true, search = @Search(vague = true))
    )
    private String name;

    @EruptField(
            views = @View(title = "状态"),
            edit = @Edit(
                    title = "状态",
                    notNull = true,
                    type = EditType.BOOLEAN,
                    boolType = @BoolType(trueText = "启用", falseText = "禁用")
            )
    )
    private Boolean status = true;

    @EruptField(
            views = @View(title = "备注"),
            edit = @Edit(title = "备注", type = EditType.TEXTAREA)
    )
    private String remark;

    @ManyToOne
    @EruptField(
            views = @View(title = "上级分类", column = "name"),
            edit = @Edit(
                    title = "上级分类",
                    type = EditType.REFERENCE_TREE,
                    referenceTreeType = @ReferenceTreeType(pid = "parent.id")
            )
    )
    private MaterialCategory parent;

}
