package com.example.demo.model.material;

import com.example.demo.proxy.material.SupplierDataProxy;
import xyz.erupt.annotation.Erupt;
import xyz.erupt.annotation.EruptField;
import xyz.erupt.annotation.sub_erupt.Power;
import xyz.erupt.annotation.sub_field.Edit;
import xyz.erupt.annotation.sub_field.EditType;
import xyz.erupt.annotation.sub_field.View;
import xyz.erupt.annotation.sub_field.sub_edit.Search;
import xyz.erupt.jpa.model.BaseModel;

import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * 供应商
 * @author 一只闲鹿
 */
@Erupt(
        name = "供应商",
        dataProxy = { SupplierDataProxy.class },
        power = @Power(
                importable = true,
                export = true
        )
)
@Table(name = "t_supplier")
@Entity
public class Supplier extends BaseModel {

    @EruptField(
            views = @View(title = "供应商编码"),
            edit = @Edit(title = "供应商编码", notNull = true, search = @Search(vague = true))
    )
    private String code;

    @EruptField(
            views = @View(title = "供应商名称"),
            edit = @Edit(title = "供应商名称", notNull = true, search = @Search(vague = true))
    )
    private String name;

    @EruptField(
            views = @View(title = "联系人"),
            edit = @Edit(title = "联系人")
    )
    private String linkman;

    @EruptField(
            views = @View(title = "联系方式"),
            edit = @Edit(title = "联系方式")
    )
    private String linkMethod;

    @EruptField(
            views = @View(title = "地址"),
            edit = @Edit(title = "地址")
    )
    private String address;

    @EruptField(
            views = @View(title = "备注"),
            edit = @Edit(title = "备注", type = EditType.TEXTAREA)
    )
    private String remark;

}
