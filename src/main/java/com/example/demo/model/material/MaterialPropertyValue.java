package com.example.demo.model.material;

import xyz.erupt.annotation.Erupt;
import xyz.erupt.annotation.EruptField;
import xyz.erupt.annotation.sub_field.Edit;
import xyz.erupt.annotation.sub_field.View;
import xyz.erupt.jpa.model.BaseModel;

import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * 物料属性值
 */
@Erupt(
        name = "物料属性值"
)
@Table(name = "t_material_property_value")
@Entity
public class MaterialPropertyValue extends BaseModel {

    // 定义关联类
    @ManyToOne
    private MaterialProperty materialProperty;

    @EruptField(
            views = @View(title = "属性值"),
            edit = @Edit(title = "属性值")
    )
    private String value;

}
