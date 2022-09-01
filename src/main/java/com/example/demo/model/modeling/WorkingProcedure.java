package com.example.demo.model.modeling;

import com.example.demo.proxy.modeling.WorkingProcedureDataProxy;
import lombok.Data;
import xyz.erupt.annotation.Erupt;
import xyz.erupt.annotation.EruptField;
import xyz.erupt.annotation.sub_erupt.Power;
import xyz.erupt.annotation.sub_field.Edit;
import xyz.erupt.annotation.sub_field.View;
import xyz.erupt.annotation.sub_field.sub_edit.Search;
import xyz.erupt.jpa.model.BaseModel;

import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * 工序
 */
@Erupt(
        name = "工序",
        dataProxy = { WorkingProcedureDataProxy.class },
        power = @Power(
                importable = true,
                export = true
        )
)
@Table(name = "t_working_procedure")
@Entity
@Data
public class WorkingProcedure extends BaseModel {

    @EruptField(
            views = @View(title = "工序编码"),
            edit = @Edit(title = "工序编码", notNull = true, search = @Search(vague = true))
    )
    private String code;

    @EruptField(
            views = @View(title = "工序名称"),
            edit = @Edit(title = "工序名称", notNull = true, search = @Search(vague = true))
    )
    private String name;

//    @ManyToOne
//    @JoinColumn
//    @EruptField(
//            views = {
//                    @View(title = "产品族小类", column = "code"),
//            },
//            edit = @Edit(title = "产品族小类", type = EditType.REFERENCE_TABLE, search = @Search,
//                    referenceTableType = @ReferenceTableType(label = "code")
//            )
//    )
//    private ProductionCluster productionCluster;
//
//    @ManyToOne
//    @JoinColumn
//    @EruptField(
//            views = {
//                    @View(title = "工序类型", column = "name"),
//            },
//            edit = @Edit(title = "工序类型", type = EditType.REFERENCE_TABLE, search = @Search,
//                    referenceTableType = @ReferenceTableType(label = "name")
//            )
//    )
//    private QuickCode quickCode;

}
