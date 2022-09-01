package com.example.demo.model.material;

import com.example.demo.proxy.ProductionClusterCategoryDataProxy;
import lombok.Data;
import xyz.erupt.annotation.Erupt;
import xyz.erupt.annotation.EruptField;
import xyz.erupt.annotation.sub_erupt.Power;
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
 * 产品族分类
 */
@Erupt(
        name = "产品族分类",
        tree = @Tree(pid = "parent.id"),
        dataProxy = { ProductionClusterCategoryDataProxy.class },
        power = @Power(
                importable = true,
                export = true
        )
)
@Table(name = "t_production_cluster_category")
@Entity
@Data
public class ProductionClusterCategory extends BaseModel {

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
            edit = @Edit(
                    title = "上级分类",
                    type = EditType.REFERENCE_TREE,
                    referenceTreeType = @ReferenceTreeType(pid = "parent.id")
            )
    )
    private ProductionClusterCategory parent;

}
