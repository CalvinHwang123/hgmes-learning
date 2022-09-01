package com.example.demo.model.material;/*
 * Copyright © 2020-2035 erupt.xyz All rights reserved.
 * Author: YuePeng (erupts@126.com)
 */

import com.example.demo.proxy.material.ProductionBackDataProxy;
import lombok.Data;
import xyz.erupt.annotation.Erupt;
import xyz.erupt.annotation.EruptField;
import xyz.erupt.annotation.sub_field.Edit;
import xyz.erupt.annotation.sub_field.EditType;
import xyz.erupt.annotation.sub_field.View;
import xyz.erupt.annotation.sub_field.sub_edit.InputType;
import xyz.erupt.annotation.sub_field.sub_edit.ReferenceTableType;
import xyz.erupt.annotation.sub_field.sub_edit.Search;
import xyz.erupt.upms.model.base.HyperModel;

import javax.persistence.*;
import java.util.Set;

@Erupt(
        name = "生产退料",
        dataProxy = { ProductionBackDataProxy.class }/*,
        rowOperation = {
                @RowOperation(
                        title = "提交",
                        icon = "fa fa-check-square-o",
                        mode = RowOperation.Mode.SINGLE,
                        operationHandler = ProductionBackOperationHandlerImpl.class,
                        // js 表达式（显示的表达式）
                        ifExpr = "item.status == null || item.status == '初始'",
                        ifExprBehavior = RowOperation.IfExprBehavior.HIDE
                ),
                @RowOperation(
                        title = "打印",
                        icon = "fa fa-print",
                        mode = RowOperation.Mode.SINGLE,
                        type = RowOperation.Type.TPL,
                        tpl = @Tpl(
                                path = "/tpl/order-print.ftl",
                                tplHandler = ProductionBackPrintHandler.class,  //数据绑定到模板，可不设置
                                engine = Tpl.Engine.FreeMarker //缺省值
                        ),
                        operationHandler = ProductionBackOperationHandlerImpl.class//,
//                        // js 表达式（显示的表达式）
//                        ifExpr = "item.status == null || item.status == '初始'",
//                        ifExprBehavior = RowOperation.IfExprBehavior.HIDE
                )
        }*/
)
@Table(name = "t_production_back")
@Entity
@Data
public class ProductionBack extends HyperModel {

        @EruptField(
                views = @View(
                        title = "单号"
                ),
                edit = @Edit(
                        title = "单号",
                        type = EditType.INPUT, search = @Search(vague = true), notNull = true,
                        inputType = @InputType
                )
        )
        private String code;

        @EruptField(
                views = @View(
                        title = "接收线边仓",
                        column = "name"
                ),
                edit = @Edit(
                        title = "接收线边仓",
                        type = EditType.REFERENCE_TABLE, search = @Search, notNull = true,
                        referenceTableType = @ReferenceTableType(id = "id", label = "name")
                )
        )
        @ManyToOne
        private Warehouse warehouse;

        @EruptField(
                views = @View(
                        title = "退料人"
                ),
                edit = @Edit(
                        title = "退料人",
                        type = EditType.INPUT,
                        inputType = @InputType
                )
        )
        private String backPerson;

        @EruptField(
                views = @View(
                        title = "退料时间"
                ),
                edit = @Edit(
                        title = "退料时间",
                        type = EditType.INPUT,
                        inputType = @InputType
                )
        )
        private String backDate;

        @EruptField(
                views = @View(
                        title = "备注"
                ),
                edit = @Edit(
                        title = "备注",
                        type = EditType.TEXTAREA
                )
        )
        private @Lob String remark;

        @EruptField(
                views = @View(title = "状态"),
                edit = @Edit(title = "状态", show = false)
        )
        private String status;

        @EruptField(
                views = @View(
                        title = "物料移动单明细"
                ),
                edit = @Edit(
                        title = "物料移动单明细",
                        type = EditType.TAB_TABLE_ADD
                )
        )
        @OneToMany(cascade = CascadeType.ALL, orphanRemoval = true)
        @OrderBy
        @JoinColumn(name = "production_back_id")
        private Set<ProductionBackMaterialMoveOrder> productionBackMaterialMoveOrders;

}
