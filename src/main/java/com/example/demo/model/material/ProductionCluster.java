package com.example.demo.model.material;

import xyz.erupt.annotation.Erupt;
import xyz.erupt.annotation.EruptField;
import xyz.erupt.annotation.sub_erupt.Power;
import xyz.erupt.annotation.sub_field.Edit;
import xyz.erupt.annotation.sub_field.EditType;
import xyz.erupt.annotation.sub_field.View;
import xyz.erupt.annotation.sub_field.sub_edit.ReferenceTableType;
import xyz.erupt.annotation.sub_field.sub_edit.Search;
import xyz.erupt.jpa.model.BaseModel;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * 产品族
 */
@Erupt(
        name = "产品族",
        power = @Power(
                importable = true,
                export = true
        )
)
@Table(name = "t_production_cluster")
@Entity
public class ProductionCluster extends BaseModel {

    @EruptField(
            views = @View(title = "产品型号"),
            edit = @Edit(title = "产品型号")
    )
    private String model;

    @EruptField(
            views = @View(title = "产品族编号"),
            edit = @Edit(title = "产品族编号")
    )
    private String code;

    @EruptField(
            views = @View(title = "主材质"),
            edit = @Edit(title = "主材质")
    )
    private String material;

    @ManyToOne
    @JoinColumn
    @EruptField(
            views = {
                    @View(title = "产品族分类", column = "name"),
            },
            edit = @Edit(title = "产品族分类", type = EditType.REFERENCE_TABLE, search = @Search,
                    referenceTableType = @ReferenceTableType(label = "name")
            )
    )
    private ProductionClusterCategory category;

}
