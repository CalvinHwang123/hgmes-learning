package com.example.demo.model.material;

import com.example.demo.proxy.MaterialCategoryPropertyTeamDataProxy;
import xyz.erupt.annotation.Erupt;
import xyz.erupt.annotation.EruptField;
import xyz.erupt.annotation.sub_field.Edit;
import xyz.erupt.annotation.sub_field.EditType;
import xyz.erupt.annotation.sub_field.View;
import xyz.erupt.annotation.sub_field.sub_edit.ReferenceTableType;
import xyz.erupt.annotation.sub_field.sub_edit.ReferenceTreeType;
import xyz.erupt.jpa.model.BaseModel;

import javax.persistence.*;
import java.util.List;

/**
 * 类别属性组
 */
@Erupt(
        name = "类别属性组",
        dataProxy = { MaterialCategoryPropertyTeamDataProxy.class }
)
@Table(name = "t_material_category_property_team")
@Entity
public class MaterialCategoryPropertyTeam extends BaseModel {

    @EruptField(
            views = @View(title = "编码"),
            edit = @Edit(title = "编码")
    )
    private String code;

    @ManyToOne
    @EruptField(
            views = @View(title = "物料类别", column = "name"),
            edit = @Edit(
                    title = "物料类别",
                    type = EditType.REFERENCE_TREE,
                    referenceTreeType = @ReferenceTreeType(pid = "parent.id")
            )
    )
    private MaterialCategory materialCategory;

    @ManyToMany // 多对多
    @JoinTable(name = "t_material_category_property_team_property", // 定义多对多中间表
            joinColumns = @JoinColumn(name = "material_category_property_team_id", referencedColumnName = "id"),
            inverseJoinColumns = @JoinColumn(name = "property_id", referencedColumnName = "id"))
    @EruptField(
            edit = @Edit(
                    title = "属性",
                    type = EditType.TAB_TABLE_REFER,
                    referenceTableType = @ReferenceTableType()
            )
    )
    private List<MaterialProperty> materialProperties;

    @Transient
    @EruptField(
            views = @View(title = "属性范围")
    )
    private String properties;

}
