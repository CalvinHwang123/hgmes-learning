package com.example.demo.model.material;

import com.example.demo.model.modeling.Employee;
import com.example.demo.proxy.material.WarehouseDataProxy;
import xyz.erupt.annotation.Erupt;
import xyz.erupt.annotation.EruptField;
import xyz.erupt.annotation.sub_erupt.Power;
import xyz.erupt.annotation.sub_field.Edit;
import xyz.erupt.annotation.sub_field.EditType;
import xyz.erupt.annotation.sub_field.View;
import xyz.erupt.annotation.sub_field.sub_edit.ReferenceTableType;
import xyz.erupt.annotation.sub_field.sub_edit.Search;
import xyz.erupt.upms.model.base.HyperModel;

import javax.persistence.*;
import java.util.List;

/**
 * 线边仓
 * @author 一只闲鹿
 */
@Erupt(
        name = "线边仓",
        dataProxy = { WarehouseDataProxy.class },
        power = @Power(
                importable = true,
                export = true
        )
)
@Table(name = "t_warehouse")
@Entity
public class Warehouse extends HyperModel {

    @EruptField(
            views = @View(title = "仓库编码"),
            edit = @Edit(title = "仓库编码", notNull = true, search = @Search(vague = true))
    )
    private String code;

    @EruptField(
            views = @View(title = "仓库名称"),
            edit = @Edit(title = "仓库名称", notNull = true, search = @Search(vague = true))
    )
    private String name;

    @ManyToOne
    @JoinColumn
    @EruptField(
            views = @View(title = "责任人", column = "name"),
            edit = @Edit(
                    title = "责任人",
                    type = EditType.REFERENCE_TABLE,
                    referenceTableType = @ReferenceTableType
            )
    )
    private Employee principal;

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

    @OneToMany(cascade = CascadeType.ALL)
    @JoinColumn(name = "warehouse_id")
    @EruptField(
            views = @View(title = "关联产线", column = "name"),
            edit = @Edit(
                    title = "关联产线",
                    type = EditType.TAB_TABLE_ADD,
                    notNull = true
            )
    )
    private List<WarehouseProductionLine> warehouseProductionLines;

}
