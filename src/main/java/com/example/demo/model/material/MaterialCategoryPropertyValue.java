package com.example.demo.model.material;

import com.example.demo.handler.MaterialCategoryPropertyValueOperationHandlerImpl;
import com.example.demo.proxy.MaterialCategoryPropertyValueDataProxy;
import xyz.erupt.annotation.Erupt;
import xyz.erupt.annotation.EruptField;
import xyz.erupt.annotation.sub_erupt.Power;
import xyz.erupt.annotation.sub_erupt.RowOperation;
import xyz.erupt.annotation.sub_field.Edit;
import xyz.erupt.annotation.sub_field.EditType;
import xyz.erupt.annotation.sub_field.View;
import xyz.erupt.annotation.sub_field.sub_edit.ReferenceTreeType;
import xyz.erupt.annotation.sub_field.sub_edit.Search;
import xyz.erupt.jpa.model.BaseModel;

import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

/**
 * 类别属性值
 */
@Erupt(
        name = "类别属性值",
        dataProxy = { MaterialCategoryPropertyValueDataProxy.class },
        power = @Power(
                edit = false,
                delete = false,
                viewDetails = false
        ),
        rowOperation = {
                @RowOperation(
                        title = "属性值",
                        code = "SINGLE",
                        mode = RowOperation.Mode.SINGLE,
                        operationHandler = MaterialCategoryPropertyValueOperationHandlerImpl.class)
        }
)
@Table(name = "t_material_category_property_value")
@Entity
public class MaterialCategoryPropertyValue extends BaseModel {

    /**
     * 这里只能关联 id，因为 MaterialCategoryPropertyValueDataProxy 要根据 id 做查询
     */
    @ManyToOne
    @EruptField(
            views = @View(title = "物料类别", column = "id"),
            edit = @Edit(
                    title = "物料类别",
                    type = EditType.REFERENCE_TREE,
                    referenceTreeType = @ReferenceTreeType(pid = "parent.id"),
                    search = @Search
            )
    )
    private MaterialCategory materialCategory;

    @Transient
    @EruptField(
            views = @View(title = "物料类别编码")
    )
    private String materialCategoryCode;

    @Transient
    @EruptField(
            views = @View(title = "物料类别名称")
    )
    private String materialCategoryName;

    @Transient
    @EruptField(
            views = @View(title = "类别属性")
    )
    private String property;

    @Transient
    @EruptField(
            views = @View(title = "类别属性编码")
    )
    private String propertyCode;

}
