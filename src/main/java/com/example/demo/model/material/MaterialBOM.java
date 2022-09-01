package com.example.demo.model.material;

import com.example.demo.constant.Constant;
import com.example.demo.proxy.material.MaterialBOMDataProxy;
import lombok.Data;
import xyz.erupt.annotation.Erupt;
import xyz.erupt.annotation.EruptField;
import xyz.erupt.annotation.sub_erupt.Power;
import xyz.erupt.annotation.sub_field.Edit;
import xyz.erupt.annotation.sub_field.EditType;
import xyz.erupt.annotation.sub_field.Readonly;
import xyz.erupt.annotation.sub_field.View;
import xyz.erupt.annotation.sub_field.sub_edit.ReferenceTableType;
import xyz.erupt.annotation.sub_field.sub_edit.Search;
import xyz.erupt.jpa.model.BaseModel;

import javax.persistence.*;
import java.util.List;

/**
 * 物料BOM
 * @author 一只闲鹿
 */
@Erupt(
        name = "物料BOM",
        dataProxy = { MaterialBOMDataProxy.class },
        power = @Power(
                importable = true,
                export = true
        )
)
@Table(name = "t_material_bom")
@Entity
@Data
public class MaterialBOM extends BaseModel {

    @EruptField(
            views = @View(title = "BOM编码"),
            edit = @Edit(title = "BOM编码", notNull = true, search = @Search(vague = true))
    )
    private String code;

    @EruptField(
            views = @View(title = "BOM描述"),
            edit = @Edit(title = "BOM描述", notNull = true, search = @Search(vague = true))
    )
    private String name;

    @EruptField(
            views = @View(title = "物料编码"),
            edit = @Edit(
                    title = "物料编码",
                    readonly = @Readonly,
// 这里的 placeholder 也会出现在搜索框，所以注释掉
//                    placeHolder = Constant.UPDATE_AUTO_AFTER_SAVE,
                    search = @Search(vague = true)
            )
    )
    private String materialCode;

    @ManyToOne
    @JoinColumn
    @EruptField(
            views = @View(title = "物料名称", column = "name"),
            edit = @Edit(
                    title = "物料名称",
                    notNull = true,
                    type = EditType.REFERENCE_TABLE,
                    referenceTableType = @ReferenceTableType
            )
    )
    private Material material;

    @EruptField(
            views = @View(title = "产品数量"),
            edit = @Edit(title = "产品数量", notNull = true)
    )
    private Integer productionNumber;

    @OneToMany(cascade = CascadeType.ALL)
    @JoinColumn(name = "material_bom_id")
    @EruptField(
            views = @View(title = "物料BOM明细", column = "name"),
            edit = @Edit(
                    title = "物料BOM明细",
                    type = EditType.TAB_TABLE_ADD,
                    notNull = true
            )
    )
    private List<MaterialBOMMaterial> materialBOMMaterials;

}
