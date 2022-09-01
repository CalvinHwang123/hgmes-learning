package com.example.demo.model.modeling;

import com.example.demo.constant.Constant;
import com.example.demo.proxy.WorkingSectionProcedureDataProxy;
import lombok.Data;
import xyz.erupt.annotation.Erupt;
import xyz.erupt.annotation.EruptField;
import xyz.erupt.annotation.sub_field.Edit;
import xyz.erupt.annotation.sub_field.EditType;
import xyz.erupt.annotation.sub_field.Readonly;
import xyz.erupt.annotation.sub_field.View;
import xyz.erupt.annotation.sub_field.sub_edit.ReferenceTableType;
import xyz.erupt.jpa.model.BaseModel;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * 工段关联工序明细
 * @author 一只闲鹿
 */
@Erupt(name = "工段关联工序明细", dataProxy = { WorkingSectionProcedureDataProxy.class })
@Table(name = "t_working_section_procedure")
@Entity
@Data
public class WorkingSectionProcedure extends BaseModel /*implements DataProxy<WorkingSectionProcedure>*/ {

    @EruptField(
            views = @View(title = "工序编码"),
            edit = @Edit(title = "工序编码", readonly = @Readonly, placeHolder = Constant.UPDATE_AUTO_AFTER_SAVE)
    )
    private String procedureCode;

    @ManyToOne
    @JoinColumn
    @EruptField(
            views = @View(title = "工序名称", column = "name"),
            edit = @Edit(
                    title = "工序名称",
                    notNull = true,
                    type = EditType.REFERENCE_TABLE,
                    referenceTableType = @ReferenceTableType
            )
    )
    private WorkingProcedure workingProcedure;

    @EruptField(
            views = @View(title = "顺序"),
            edit = @Edit(title = "顺序")
    )
    private Integer sortNo;

    /* 测试过，并不会生效
    @Override
    public void beforeAdd(WorkingSectionProcedure workingSectionProcedure) {
        setProcedureCodeField(workingSectionProcedure);
    }

    @Override
    public void beforeUpdate(WorkingSectionProcedure workingSectionProcedure) {
        setProcedureCodeField(workingSectionProcedure);
    }

    private void setProcedureCodeField(WorkingSectionProcedure workingSectionProcedure) {
        EruptDao eruptDao = EruptSpringUtil.getBean(EruptDao.class);
        WorkingProcedure workingProcedure = eruptDao.queryEntity(WorkingProcedure.class, "id = " + workingSectionProcedure.getWorkingProcedure().getId());
        workingSectionProcedure.setProcedureCode(workingProcedure.getCode());
    }*/

}
