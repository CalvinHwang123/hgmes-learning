package com.example.demo.model.material;

import com.example.demo.constant.Constant;
import com.example.demo.model.modeling.MeasureUnit;
import com.example.demo.proxy.MaterialBOMMaterialDataProxy;
import lombok.Data;
import xyz.erupt.annotation.Erupt;
import xyz.erupt.annotation.EruptField;
import xyz.erupt.annotation.sub_erupt.LinkTree;
import xyz.erupt.annotation.sub_field.Edit;
import xyz.erupt.annotation.sub_field.EditType;
import xyz.erupt.annotation.sub_field.Readonly;
import xyz.erupt.annotation.sub_field.View;
import xyz.erupt.annotation.sub_field.sub_edit.ReferenceTableType;
import xyz.erupt.annotation.sub_field.sub_edit.ReferenceTreeType;
import xyz.erupt.jpa.model.BaseModel;

import javax.persistence.*;
import java.util.List;

/**
 * 物料BOM明细
 */
@Erupt(
        name = "物料BOM明细",
        dataProxy = { MaterialBOMMaterialDataProxy.class }
)
@Table(name = "t_material_bom_material")
@Entity
@Data
public class MaterialBOMMaterial extends BaseModel {

    @EruptField(
            views = @View(title = "物料编码"),
            edit = @Edit(title = "物料编码", readonly = @Readonly, placeHolder = Constant.UPDATE_AUTO_AFTER_SAVE)
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
            views = @View(title = "数量"),
            edit = @Edit(title = "数量")
    )
    private Integer materialNumber;

    @ManyToOne
    @JoinColumn
    @EruptField(
            views = @View(title = "计量单位", column = "englishName"),
            edit = @Edit(
                    title = "计量单位",
                    type = EditType.REFERENCE_TABLE,
                    referenceTableType = @ReferenceTableType(label = "englishName")
            )
    )
    private MeasureUnit measureUnit;

    @EruptField(
            views = @View(title = "用途"),
            edit = @Edit(title = "用途")
    )
    private String materialUsage;

}
