package com.example.demo.model.material;

import com.example.demo.model.modeling.MeasureUnit;
import com.example.demo.model.modeling.ProductionLine;
import com.example.demo.proxy.material.MaterialDataProxy;
import lombok.Data;
import xyz.erupt.annotation.Erupt;
import xyz.erupt.annotation.EruptField;
import xyz.erupt.annotation.sub_erupt.LinkTree;
import xyz.erupt.annotation.sub_erupt.Power;
import xyz.erupt.annotation.sub_field.Edit;
import xyz.erupt.annotation.sub_field.EditType;
import xyz.erupt.annotation.sub_field.View;
import xyz.erupt.annotation.sub_field.sub_edit.ChoiceType;
import xyz.erupt.annotation.sub_field.sub_edit.ReferenceTableType;
import xyz.erupt.annotation.sub_field.sub_edit.ReferenceTreeType;
import xyz.erupt.annotation.sub_field.sub_edit.Search;
import xyz.erupt.jpa.model.BaseModel;
import xyz.erupt.upms.handler.DictChoiceFetchHandler;

import javax.persistence.*;
import java.util.List;

/**
 * 物料
 */
@Erupt(
        name = "物料",
        linkTree = @LinkTree(field = "materialCategory"),
        dataProxy = { MaterialDataProxy.class },
        power = @Power(
                importable = true,
                export = true
        )
)
@Table(name = "t_material")
@Entity
@Data
public class Material extends BaseModel {

    @EruptField(
            views = @View(title = "物料编码"),
            edit = @Edit(title = "物料编码", notNull = true, search = @Search(vague = true))
    )
    private String code;

    @EruptField(
            views = @View(title = "物料名称"),
            edit = @Edit(title = "物料名称", notNull = true, search = @Search(vague = true))
    )
    private String name;

    @ManyToOne
    @JoinColumn
    @EruptField(
            views = @View(title = "计量单位", column = "englishName"),
            edit = @Edit(
                    title = "计量单位",
                    notNull = true,
                    type = EditType.REFERENCE_TABLE,
                    referenceTableType = @ReferenceTableType(label = "englishName")
            )
    )
    private MeasureUnit measureUnit;

    @EruptField(
            views = @View(title = "管控类型"),
            edit = @Edit(
                    title = "管控类型",
                    notNull = true,
                    type = EditType.CHOICE,
                    choiceType = @ChoiceType(
                            fetchHandler = DictChoiceFetchHandler.class,
                            fetchHandlerParams = "controlType"
                    )
            )
    )
    private String controlType;

    @EruptField(
            views = @View(title = "规格"),
            edit = @Edit(title = "规格")
    )
    private String specification;

    @EruptField(
            views = @View(title = "型号"),
            edit = @Edit(title = "型号")
    )
    private String modelNumber;

    @ManyToOne
    @EruptField(
            views = @View(title = "所属分类", column = "name"),
            edit = @Edit(
                    title = "所属分类",
                    notNull = true,
                    type = EditType.REFERENCE_TREE,
                    referenceTreeType = @ReferenceTreeType(pid = "parent.id"),
                    search = @Search
            )
    )
    private MaterialCategory materialCategory;

    @EruptField(
            views = @View(title = "物料描述"),
            edit = @Edit(title = "物料描述", type = EditType.TEXTAREA)
    )
    private String description;

//    @ManyToMany // 多对多
//    @JoinTable(name = "t_material_property_relationship", // 定义多对多中间表
//            joinColumns = @JoinColumn(name = "material_id", referencedColumnName = "id"),
//            inverseJoinColumns = @JoinColumn(name = "property_id", referencedColumnName = "id"))
//    @EruptField(
//            edit = @Edit(
//                    title = "属性",
//                    type = EditType.TAB_TABLE_REFER,
//                    referenceTableType = @ReferenceTableType()
//            )
//    )
//    private List<MaterialProperty> materialProperties;

}
