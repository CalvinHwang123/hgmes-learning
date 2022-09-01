package com.example.demo.model.device;

import com.example.demo.model.material.Supplier;
import com.example.demo.model.modeling.Workshop;
import xyz.erupt.annotation.Erupt;
import xyz.erupt.annotation.EruptField;
import xyz.erupt.annotation.sub_erupt.LinkTree;
import xyz.erupt.annotation.sub_erupt.Tree;
import xyz.erupt.annotation.sub_field.Edit;
import xyz.erupt.annotation.sub_field.EditType;
import xyz.erupt.annotation.sub_field.View;
import xyz.erupt.annotation.sub_field.sub_edit.ReferenceTableType;
import xyz.erupt.annotation.sub_field.sub_edit.ReferenceTreeType;
import xyz.erupt.jpa.model.BaseModel;

import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * 设备台账
 * @author 一只闲鹿
 */
@Erupt(
        name = "设备台账",
        linkTree = @LinkTree(field = "deviceCategory")
)
@Table(name = "t_device")
@Entity
public class Device extends BaseModel {

    @EruptField(
            views = @View(title = "设备编码"),
            edit = @Edit(title = "设备编码", notNull = true)
    )
    private String code;

    @EruptField(
            views = @View(title = "设备名称"),
            edit = @Edit(title = "设备名称", notNull = true)
    )
    private String name;

    @ManyToOne
    @EruptField(
            views = @View(title = "设备分类", column = "name"),
            edit = @Edit(
                    title = "设备分类",
                    type = EditType.REFERENCE_TREE,
                    referenceTreeType = @ReferenceTreeType(pid = "parent.id")
            )
    )
    private DeviceCategory deviceCategory;

    @EruptField(
            views = @View(title = "生产日期"),
            edit = @Edit(
                    title = "生产日期",
                    type = EditType.DATE
            )
    )
    private String manufactureDate;

    @EruptField(
            views = @View(title = "生产商"),
            edit = @Edit(title = "生产商")
    )
    private String manufacturer;

    @EruptField(
            views = @View(title = "规格"),
            edit = @Edit(title = "规格")
    )
    private String specification;

    @EruptField(
            views = @View(title = "状态"),
            edit = @Edit(title = "状态")
    )
    private String status;

    @ManyToOne
    @EruptField(
            views = @View(title = "供应商", column = "name"),
            edit = @Edit(
                    title = "供应商",
                    type = EditType.REFERENCE_TABLE,
                    referenceTableType = @ReferenceTableType
            )
    )
    private Supplier supplier;

    @ManyToOne
    @EruptField(
            views = @View(title = "所属车间", column = "name"),
            edit = @Edit(
                    title = "所属车间",
                    type = EditType.REFERENCE_TABLE,
                    referenceTableType = @ReferenceTableType
            )
    )
    private Workshop workshop;

}
