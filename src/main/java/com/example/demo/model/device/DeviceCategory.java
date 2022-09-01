package com.example.demo.model.device;

import xyz.erupt.annotation.Erupt;
import xyz.erupt.annotation.EruptField;
import xyz.erupt.annotation.sub_erupt.Tree;
import xyz.erupt.annotation.sub_field.Edit;
import xyz.erupt.annotation.sub_field.EditType;
import xyz.erupt.annotation.sub_field.View;
import xyz.erupt.annotation.sub_field.sub_edit.ReferenceTreeType;
import xyz.erupt.jpa.model.BaseModel;

import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * 设备分类
 * @author 一只闲鹿
 */
@Erupt(
        name = "设备分类",
        tree = @Tree(pid = "parent.id")
)
@Table(name = "t_device_category")
@Entity
public class DeviceCategory extends BaseModel {

    @EruptField(
            views = @View(title = "分类编码"),
            edit = @Edit(title = "分类编码", notNull = true)
    )
    private String code;

    @EruptField(
            views = @View(title = "分类名称"),
            edit = @Edit(title = "分类名称", notNull = true)
    )
    private String name;

    @ManyToOne
    @EruptField(
            edit = @Edit(
                    title = "上级分类",
                    type = EditType.REFERENCE_TREE,
                    referenceTreeType = @ReferenceTreeType(pid = "parent.id")
            )
    )
    private DeviceCategory parent;

}
