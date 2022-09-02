package com.example.demo.model.modeling;

import com.example.demo.proxy.modeling.ProductionLineDataProxy;
import lombok.Data;
import xyz.erupt.annotation.Erupt;
import xyz.erupt.annotation.EruptField;
import xyz.erupt.annotation.sub_erupt.Power;
import xyz.erupt.annotation.sub_field.Edit;
import xyz.erupt.annotation.sub_field.EditType;
import xyz.erupt.annotation.sub_field.View;
import xyz.erupt.annotation.sub_field.sub_edit.ChoiceType;
import xyz.erupt.annotation.sub_field.sub_edit.ReferenceTableType;
import xyz.erupt.annotation.sub_field.sub_edit.Search;
import xyz.erupt.upms.handler.DictChoiceFetchHandler;
import xyz.erupt.upms.model.base.HyperModel;

import javax.persistence.*;
import java.util.List;

/**
 * 产线建模
 * @author 一只闲鹿
 */
@Erupt(
        name = "产线建模",
        dataProxy = { ProductionLineDataProxy.class },
        power = @Power(
                importable = true,
                export = true
        )
)
@Table(name = "t_production_line")
@Entity
@Data
public class ProductionLine extends HyperModel {

    @EruptField(
            views = @View(title = "产线编码"),
            edit = @Edit(title = "产线编码", notNull = true, search = @Search(vague = true))
    )
    private String code;

    @EruptField(
            views = @View(title = "产线名称"),
            edit = @Edit(title = "产线名称", notNull = true, search = @Search(vague = true))
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

    @ManyToOne
    @JoinColumn
    @EruptField(
            views = @View(title = "所属车间", column = "name"),
            edit = @Edit(
                    title = "所属车间",
                    notNull = true,
                    type = EditType.REFERENCE_TABLE,
                    referenceTableType = @ReferenceTableType
            )
    )
    private Workshop workshop;

    @EruptField(
            views = @View(title = "标准产能"),
            edit = @Edit(title = "标准产能")
    )
    private String standardEnergy;

    @ManyToOne
    @JoinColumn
    @EruptField(
            views = {
                    @View(title = "产能单位", column = "englishName"),
                    @View(title = "产能单位中文", column = "chineseName")
            },
            edit = @Edit(
                    title = "产能单位",
                    type = EditType.REFERENCE_TABLE,
                    referenceTableType = @ReferenceTableType(label = "englishName")
            )
    )
    private MeasureUnit measureUnit;

    @EruptField(
            views = @View(title = "状态"),
            edit = @Edit(
                    title = "状态",
                    type = EditType.CHOICE,
                    choiceType = @ChoiceType(
                            fetchHandler = DictChoiceFetchHandler.class,
                            fetchHandlerParams = "productionLineStatus" // 字典编码，通过字典编码获取字典项列表
                    )
            )
    )
    private String status;

    @ManyToMany
    @JoinTable(
            name = "t_production_line_working_procedure",
            joinColumns = @JoinColumn(name = "production_line_id", referencedColumnName = "id"),
            inverseJoinColumns = @JoinColumn(name = "working_procedure_id", referencedColumnName = "id")
    )
    @EruptField(
            views = @View(title = "产线关联工序表"),
            edit = @Edit(
                    title = "产线关联工序表",
                    type = EditType.TAB_TABLE_REFER,
                    referenceTableType = @ReferenceTableType
            )
    )
    private List<WorkingProcedure> workingProcedures;
}
