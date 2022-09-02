package com.example.demo.model.production;

import com.example.demo.handler.production.WorkOrderDownOperationHandlerImpl;
import com.example.demo.handler.production.WorkOrderEndOperationHandlerImpl;
import com.example.demo.handler.production.WorkOrderOutsourcingOperationHandlerImpl;
import com.example.demo.handler.production.WorkOrderPauseOperationHandlerImpl;
import com.example.demo.model.material.MaterialBOM;
import com.example.demo.model.material.ProcessRoute;
import com.example.demo.proxy.production.WorkOrderDataProxy;
import lombok.Data;
import xyz.erupt.annotation.Erupt;
import xyz.erupt.annotation.EruptField;
import xyz.erupt.annotation.sub_erupt.Power;
import xyz.erupt.annotation.sub_erupt.RowOperation;
import xyz.erupt.annotation.sub_field.Edit;
import xyz.erupt.annotation.sub_field.EditType;
import xyz.erupt.annotation.sub_field.Readonly;
import xyz.erupt.annotation.sub_field.View;
import xyz.erupt.annotation.sub_field.sub_edit.*;
import xyz.erupt.jpa.model.BaseModel;
import xyz.erupt.upms.handler.DictChoiceFetchHandler;

import javax.persistence.*;
import java.util.Date;

import static com.example.demo.constant.Constant.*;

/**
 * 生产工单
 */
@Erupt(
        name = "生产工单",
        dataProxy = { WorkOrderDataProxy.class },
        power = @Power(
                importable = true,
                export = true
        ),
        rowOperation = {
                @RowOperation(
                        title = "下达",
                        icon = "fa fa-level-down",
                        mode = RowOperation.Mode.MULTI,
                        operationParam = { "down" },
                        operationHandler = WorkOrderDownOperationHandlerImpl.class
                ),
                @RowOperation(
                        title = "取消下达",
                        icon = "fa fa-undo",
                        mode = RowOperation.Mode.MULTI,
                        operationParam = { "cancelDown" },
                        operationHandler = WorkOrderDownOperationHandlerImpl.class
                ),
                @RowOperation(
                        title = "暂停",
                        icon = "fa fa-pause",
                        mode = RowOperation.Mode.MULTI,
                        operationParam = { "pause" },
                        operationHandler = WorkOrderPauseOperationHandlerImpl.class
                ),
                @RowOperation(
                        title = "取消暂停",
                        icon = "fa fa-undo",
                        mode = RowOperation.Mode.MULTI,
                        operationParam = { "cancelPause" },
                        operationHandler = WorkOrderPauseOperationHandlerImpl.class
                ),
                @RowOperation(
                        title = "终止",
                        icon = "fa fa-window-close",
                        mode = RowOperation.Mode.MULTI,
                        operationParam = { "end" },
                        operationHandler = WorkOrderEndOperationHandlerImpl.class
                ),
                @RowOperation(
                        title = "强制完工",
                        icon = "fa fa-check-square-o",
                        mode = RowOperation.Mode.MULTI,
                        operationParam = { "forceFinish" },
                        operationHandler = WorkOrderEndOperationHandlerImpl.class
                ),
                @RowOperation(
                        title = "工单委外",
                        icon = "fa fa-user-plus",
                        mode = RowOperation.Mode.MULTI,
                        type = RowOperation.Type.ERUPT,
                        operationParam = { "orderOutsourcing" },
                        eruptClass = WorkOrderOutsourcing.class,
                        operationHandler = WorkOrderOutsourcingOperationHandlerImpl.class
                )
        }
)
@Table(name = "t_work_order")
@Entity
@Data
public class WorkOrder extends BaseModel {

    @EruptField(
            views = @View(title = "工单编码"),
            edit = @Edit(title = "工单编码")
    )
    private String code;

//    @EruptField(
//            views = @View(title = "客户订单号"),
//            edit = @Edit(title = "客户订单号")
//    )
//    private String customerOrderNo;

//    @EruptField(
//            views = @View(title = "销售订单号"),
//            edit = @Edit(title = "销售订单号")
//    )
//    private String saleOrderNo;

    @EruptField(
            views = @View(
                    title = "产品选择",
                    column = "name"
            ),
            edit = @Edit(
                    title = "产品选择",
                    type = EditType.REFERENCE_TABLE, search = @Search, notNull = true,
                    referenceTableType = @ReferenceTableType(id = "id", label = "name")
            )
    )
    @ManyToOne
    private MaterialBOM productName;

    @EruptField(
            views = @View(
                    title = "工艺路线",
                    column = "name"
            ),
            edit = @Edit(
                    title = "工艺路线",
                    type = EditType.REFERENCE_TABLE, search = @Search, notNull = true,
                    referenceTableType = @ReferenceTableType(id = "id", label = "name")
            )
    )
    @ManyToOne
    private ProcessRoute processRoute;

    @EruptField(
            views = @View(
                    title = "工单类型"
            ),
            edit = @Edit(
                    search = @Search,
                    title = "工单类型",
                    type = EditType.CHOICE,
                    choiceType = @ChoiceType(
                            fetchHandler = DictChoiceFetchHandler.class,
                            fetchHandlerParams = "workOrderType" // 字典编码，通过字典编码获取字典项列表
                    )
            )
    )
    private String workOrderType;

    @EruptField(
            views = @View(title = "状态"),
            edit = @Edit(title = "状态")
    )
    private String status;

    @EruptField(
            views = @View(
                    title = "计划开始日期"
            ),
            edit = @Edit(
                    title = "计划开始日期",
                    notNull = true,
                    type = EditType.DATE, search = @Search,
                    dateType = @DateType
            )
    )
    private Date planStartDate;

    @EruptField(
            views = @View(
                    title = "计划结束日期"
            ),
            edit = @Edit(
                    title = "计划结束日期",
                    notNull = true,
                    type = EditType.DATE, search = @Search,
                    dateType = @DateType
            )
    )
    private Date planEndDate;

    @EruptField(
            views = @View(
                    title = "实际开始日期"
            ),
            edit = @Edit(
                    title = "实际开始日期",
                    type = EditType.DATE, search = @Search,
                    dateType = @DateType
            )
    )
    private Date actualStartDate;

    @EruptField(
            views = @View(
                    title = "实际结束日期"
            ),
            edit = @Edit(
                    title = "实际结束日期",
                    type = EditType.DATE, search = @Search,
                    dateType = @DateType
            )
    )
    private Date actualDate;

    @EruptField(
            views = @View(
                    title = "计划数量"
            ),
            edit = @Edit(
                    title = "计划数量",
                    type = EditType.INPUT, notNull = true,
                    inputType = @InputType
            )
    )
    private String planNumber;

    @EruptField(
            views = @View(
                    title = "完工数量"
            ),
            edit = @Edit(
                    title = "完工数量",
                    readonly = @Readonly,
                    type = EditType.INPUT,
                    inputType = @InputType
            )
    )
    private String finishNumber;

    @EruptField(
            views = @View(title = "委外状态"),
            edit = @Edit(title = "委外状态", type = EditType.BOOLEAN,
                    boolType = @BoolType(trueText = "自制", falseText = "委外"))
    )
    private Boolean noOutsourcing;

    @EruptField(
            views = @View(title = "优先级"),
            edit = @Edit(title = "优先级")
    )
    private String priority;

    @EruptField(
            views = @View(title = "是否排程"),
            edit = @Edit(title = "是否排程", type = EditType.BOOLEAN,
                    boolType = @BoolType(trueText = "是", falseText = "否"))
    )
    private Boolean schedule;

    @EruptField(
            views = @View(
                    title = "生产计划",
                    column = "code"
            ),
            edit = @Edit(
                    title = "生产计划",
                    type = EditType.REFERENCE_TABLE,
                    referenceTableType = @ReferenceTableType(id = "id", label = "code")
            )
    )
    @ManyToOne
    private ProductionPlan productionPlan;

//    @ManyToOne
//    @EruptField(
//            views = @View(title = "资源编码", column = "name"),
//            edit = @Edit(
//                    title = "资源编码",
//                    type = EditType.REFERENCE_TREE,
//                    referenceTreeType = @ReferenceTreeType(pid = "parent.id")
//            )
//    )
//    private UnitFramework unitFramework;

//    @ManyToMany // 多对多
//    @JoinTable(name = "t_material_property_relationship", // 定义多对多中间表
//            joinColumns = @JoinColumn(name = "material_id", referencedColumnName = "id"),
//            inverseJoinColumns = @JoinColumn(name = "property_id", referencedColumnName = "id"))
//    @EruptField(
//            edit = @Edit(
//                    title = "属性值",
//                    type = EditType.TAB_TABLE_REFER,
//                    referenceTableType = @ReferenceTableType()
//            )
//    )
//    private List<MaterialProperty> materialProperties;

}
