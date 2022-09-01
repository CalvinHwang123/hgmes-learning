package com.example.demo.model.material;/*
 * Copyright © 2020-2035 erupt.xyz All rights reserved.
 * Author: YuePeng (erupts@126.com)
 */

import com.example.demo.handler.material.ProcessRouteApproveOperationHandlerImpl;
import com.example.demo.handler.material.ProcessRouteCancelOperationHandlerImpl;
import com.example.demo.handler.material.ProcessRouteSubmitOperationHandlerImpl;
import com.example.demo.model.approve.ApproveForm;
import com.example.demo.proxy.material.ProcessRouteDataProxy;
import lombok.Data;
import xyz.erupt.annotation.Erupt;
import xyz.erupt.annotation.EruptField;
import xyz.erupt.annotation.sub_erupt.Power;
import xyz.erupt.annotation.sub_erupt.RowOperation;
import xyz.erupt.annotation.sub_field.Edit;
import xyz.erupt.annotation.sub_field.EditType;
import xyz.erupt.annotation.sub_field.View;
import xyz.erupt.annotation.sub_field.sub_edit.ChoiceType;
import xyz.erupt.annotation.sub_field.sub_edit.InputType;
import xyz.erupt.annotation.sub_field.sub_edit.ReferenceTableType;
import xyz.erupt.annotation.sub_field.sub_edit.Search;
import xyz.erupt.jpa.model.BaseModel;
import xyz.erupt.upms.handler.DictChoiceFetchHandler;

import javax.persistence.*;
import java.util.Set;

@Erupt(
        name = "工艺路线",
        dataProxy = { ProcessRouteDataProxy.class },
        power = @Power(
                importable = true,
                export = true
        )
        /*,
        rowOperation = @RowOperation(
                title = "工艺详情",
//                code = "SINGLE",
                icon = "fa fa-wpforms",
                type = RowOperation.Type.TPL,
                tpl = @Tpl(path = "/tpl/tree-table.html"),
                mode = RowOperation.Mode.SINGLE,
                // type 为 TPL 时不生效？👇
                operationHandler = ProcessRouteOperationHandlerImpl.class)*/
        ,
        rowOperation = {
                @RowOperation(
                        title = "提交",
                        icon = "fa fa-check-square-o",
                        code = "SUBMIT",
                        mode = RowOperation.Mode.SINGLE,
                        operationHandler = ProcessRouteSubmitOperationHandlerImpl.class,
                        // js 表达式（显示的表达式）
                        ifExpr = "item.status == null || item.status == '初始'",
                        ifExprBehavior = RowOperation.IfExprBehavior.HIDE
                ),
                @RowOperation(
                        title = "审核",
                        icon = "fa fa-user",
                        code = "APPROVE",
                        mode = RowOperation.Mode.SINGLE,
                        type = RowOperation.Type.ERUPT,
                        eruptClass = ApproveForm.class,
                        operationHandler = ProcessRouteApproveOperationHandlerImpl.class,
                        // js 表达式（显示的表达式）
                        ifExpr = "item.status == '待审核'",
                        ifExprBehavior = RowOperation.IfExprBehavior.HIDE
                ),
                @RowOperation(
                        title = "取消发布",
                        icon = "fa fa-undo",
                        code = "CANCEL",
                        mode = RowOperation.Mode.SINGLE,
                        operationHandler = ProcessRouteCancelOperationHandlerImpl.class,
                        // js 表达式（显示的表达式）
                        ifExpr = "item.status == '发布'",
                        ifExprBehavior = RowOperation.IfExprBehavior.HIDE
                )
        }
)
@Table(name = "t_process_route")
@Entity
@Data
public class ProcessRoute extends BaseModel {

        @EruptField(
                views = @View(
                        title = "工艺路线编码"
                ),
                edit = @Edit(
                        title = "工艺路线编码",
                        type = EditType.INPUT, search = @Search, notNull = true,
                        inputType = @InputType
                )
        )
        private String code;

        @EruptField(
                views = @View(
                        title = "工艺路线名称"
                ),
                edit = @Edit(
                        title = "工艺路线名称",
                        type = EditType.INPUT, search = @Search, notNull = true,
                        inputType = @InputType
                )
        )
        private String name;

        @EruptField(
                views = @View(
                        title = "产品名称",
                        column = "name"
                ),
                edit = @Edit(
                        title = "产品名称",
                        type = EditType.REFERENCE_TABLE,
                        referenceTableType = @ReferenceTableType(id = "id", label = "name")
                )
        )
        @ManyToOne
        private MaterialBOM productName;

        @EruptField(
                views = @View(
                        title = "BOM"
                ),
                edit = @Edit(
                        title = "BOM",
                        type = EditType.INPUT,
                        inputType = @InputType
                )
        )
        private String bomName;

        @EruptField(
                views = @View(
                        title = "工艺路线类型"
                ),
                edit = @Edit(
                        title = "工艺路线类型",
                        type = EditType.CHOICE,
                        choiceType = @ChoiceType(
                                fetchHandler = DictChoiceFetchHandler.class,
                                fetchHandlerParams = "processRouteType" // 字典编码，通过字典编码获取字典项列表
                        )
                )
        )
        private String type;

        @EruptField(
                views = @View(title = "状态"),
                edit = @Edit(title = "状态", show = false)
        )
        private String status;


        @EruptField(
                views = @View(
                        title = "关联工序"
                ),
                edit = @Edit(
                        title = "关联工序",
                        type = EditType.TAB_TABLE_ADD
                )
        )
        @OneToMany(cascade = CascadeType.ALL, orphanRemoval = true)
        @OrderBy
        @JoinColumn(name = "process_route_id")
        private Set<ProcessRouteWorkingProcedure> processRouteWorkingProcedures;

//        @Transient
//        @EruptField(
//                views = @View(
//                        title = "工艺详情",
//                        type = ViewType.LINK
//                ),
//                edit = @Edit(
//                        title = "工艺详情",
//                        show = false
//                )
//        )
//        private String linkDetail;
}
