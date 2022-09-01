package com.example.demo.model.modeling;

import com.example.demo.proxy.modeling.MeasureUnitDataProxy;
import lombok.Data;
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
 * 计量单位
 * @author 一只闲鹿
 */
@Erupt(
        name = "计量单位",
        dataProxy = { MeasureUnitDataProxy.class },
        power = @Power(
                importable = true,
                export = true
        )
)
@Table(name = "t_measure_unit")
@Entity
@Data
public class MeasureUnit extends BaseModel {

    @EruptField(
            views = @View(title = "中文名称"),
            edit = @Edit(title = "中文名称", notNull = true, search = @Search(vague = true))
    )
    private String chineseName;

    @EruptField(
            views = @View(title = "英文名称"),
            edit = @Edit(title = "英文名称", notNull = true, search = @Search(vague = true))
    )
    private String englishName;

    @EruptField(
            views = @View(title = "描述"),
            edit = @Edit(title = "描述", type = EditType.TEXTAREA)
    )
    private String description;

}
