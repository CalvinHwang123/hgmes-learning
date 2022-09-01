package com.example.demo.model.material;

import xyz.erupt.annotation.Erupt;
import xyz.erupt.annotation.EruptField;
import xyz.erupt.annotation.sub_erupt.Drill;
import xyz.erupt.annotation.sub_erupt.Link;
import xyz.erupt.annotation.sub_field.Edit;
import xyz.erupt.annotation.sub_field.View;
import xyz.erupt.jpa.model.BaseModel;

import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * 物料属性
 */
@Erupt(
        name = "物料属性",
        drills = {
                @Drill(code = "drill",
                        title = "属性值",
                        //最终生成的表达式为：MaterialProperty.id = MaterialPropertyValue.materialProperty.id
                        link = @Link(linkErupt = MaterialPropertyValue.class,  //关联表
                                joinColumn = "materialProperty.id"))  //关联表达式
        }
)
@Table(name = "t_material_property")
@Entity
public class MaterialProperty extends BaseModel {

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

}
