package com.example.demo.model.material;

import com.example.demo.handler.material.WorkshopReceiveHandlerImpl;
import com.example.demo.handler.modeling.EmployeeOperationHandlerImpl;
import lombok.Data;
import org.hibernate.annotations.GenericGenerator;
import xyz.erupt.annotation.Erupt;
import xyz.erupt.annotation.EruptField;
import xyz.erupt.annotation.sub_erupt.Power;
import xyz.erupt.annotation.sub_erupt.RowOperation;
import xyz.erupt.annotation.sub_field.Edit;
import xyz.erupt.annotation.sub_field.Readonly;
import xyz.erupt.annotation.sub_field.View;
import xyz.erupt.annotation.sub_field.sub_edit.Search;
import xyz.erupt.jpa.model.BaseModel;

import javax.persistence.*;

/**
 * @author 一只闲鹿
 */
@Erupt(
        name = "车间收料",
        power = @Power(
                add = false,
                edit = false,
                delete = false,
                viewDetails = false
        ),
        rowOperation = @RowOperation(
                title = "收料",
                icon = "fa fa-check-square-o",
                mode = RowOperation.Mode.MULTI,
                operationHandler = WorkshopReceiveHandlerImpl.class
        )
)
@Table(name = "v_workshop_receive")
@Entity
@Data
public class WorkshopReceive {

    @Id
    @Column(
            name = "id"
    )
    @EruptField
    private String id;

    @EruptField(
            views = @View(title = "单号"),
            edit = @Edit(
                    title = "单号",
                    readonly = @Readonly,
                    search = @Search(vague = true)
            )
    )
    private String code;

    @EruptField(
            views = @View(title = "单据类型"),
            edit = @Edit(
                    title = "单据类型",
                    readonly = @Readonly
            )
    )
    private String orderType;

}
