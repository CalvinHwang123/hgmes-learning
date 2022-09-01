package com.example.demo.model.modeling;

import com.example.demo.handler.modeling.EmployeeOperationHandlerImpl;
import com.example.demo.proxy.modeling.EmployeeDataProxy;
import lombok.Data;
import xyz.erupt.annotation.Erupt;
import xyz.erupt.annotation.EruptField;
import xyz.erupt.annotation.sub_erupt.LinkTree;
import xyz.erupt.annotation.sub_erupt.Power;
import xyz.erupt.annotation.sub_erupt.RowOperation;
import xyz.erupt.annotation.sub_field.Edit;
import xyz.erupt.annotation.sub_field.EditType;
import xyz.erupt.annotation.sub_field.View;
import xyz.erupt.annotation.sub_field.sub_edit.*;
import xyz.erupt.upms.model.EruptOrg;
import xyz.erupt.upms.model.EruptUser;
import xyz.erupt.upms.model.base.HyperModel;

import javax.persistence.*;
import java.util.Date;

/**
 * 员工
 */
@Erupt(
        name = "员工",
        linkTree = @LinkTree(field = "eruptOrg"),
        dataProxy = { EmployeeDataProxy.class },
        power = @Power(
                importable = true,
                export = true
        ),
        rowOperation = {
                @RowOperation(
                        title = "批量生成用户",
                        icon = "fa fa-users",
                        mode = RowOperation.Mode.MULTI,
                        tip = "执行该操作时将跳过已有所属用户的选中行数据",
                        operationHandler = EmployeeOperationHandlerImpl.class,
                        // js 表达式
                        ifExpr = "item.eruptUser_name == null",
                        ifExprBehavior = RowOperation.IfExprBehavior.HIDE
                ),
                @RowOperation(
                        title = "生成用户",
                        icon = "fa fa-user-circle",
                        mode = RowOperation.Mode.SINGLE,
                        operationHandler = EmployeeOperationHandlerImpl.class,
                        // js 表达式
                        ifExpr = "item.eruptUser_name == null",
                        ifExprBehavior = RowOperation.IfExprBehavior.HIDE
                )
        }
)
@Table(name = "t_employee")
@Entity
@Data
// 属性依赖了 EruptUser，必须 extends HyperModel，
// 否则报错 class xyz.erupt.upms.model.EruptRole declares multiple JSON fields named updateTime
// 猜测是实体类需要 updateTime 属性
public class Employee extends HyperModel {

    @EruptField(
            views = @View(title = "头像"),
            edit = @Edit(title = "头像", type = EditType.ATTACHMENT,
                    attachmentType = @AttachmentType(type = AttachmentType.Type.IMAGE, maxLimit = 3))
    )
    private String avatar;

    @EruptField(
            views = @View(title = "工号"),
            edit = @Edit(title = "工号", notNull = true, search = @Search(vague = true))
    )
    private String employeeNo;

    @EruptField(
            views = @View(title = "姓名"),
            edit = @Edit(title = "姓名", notNull = true, search = @Search(vague = true))
    )
    private String name;

    @EruptField(
            views = @View(
                    title = "性别"
            ),
            edit = @Edit(
                    title = "性别",
                    type = EditType.BOOLEAN, notNull = true,
                    boolType = @BoolType(trueText = "男", falseText = "女"),
                    search = @Search
            )
    )
    private Boolean sex = true;

    @EruptField(
            views = @View(title = "入职时间"),
            edit = @Edit(title = "入职时间", type = EditType.DATE, notNull = true, search = @Search(vague = true))
    )
    private Date enterDate;

    @EruptField(
            views = @View(
                    title = "状态"
            ),
            edit = @Edit(
                    title = "状态",
                    type = EditType.BOOLEAN, notNull = true,
                    boolType = @BoolType(trueText = "在职", falseText = "离职"),
                    search = @Search
            )
    )
    private Boolean onJob = true;

    @EruptField(
            views = @View(title = "出生日期"),
            edit = @Edit(title = "出生日期", type = EditType.DATE)
    )
    private Date birthDate;

    @EruptField(
            views = @View(title = "电话"),
            edit = @Edit(title = "电话")
    )
    private String phone;

    @EruptField(
            views = @View(title = "邮箱"),
            edit = @Edit(title = "邮箱")
    )
    private String email;

    @ManyToOne
    //如果 linkTree 配置中 dependNode 值为 true 可以不声明 @EruptField 新增时会自动填充当前选择树节点
    @EruptField(
            views =  @View(title = "所属组织", column = "name"),
            edit = @Edit(
                    title = "所属组织", type = EditType.REFERENCE_TREE,
                    referenceTreeType = @ReferenceTreeType(pid = "parentOrg.id") // parentOrg 是 EruptOrg 内部写法
            )
    )
    private EruptOrg eruptOrg;

    @ManyToOne
    @EruptField(
            views =  @View(title = "所属用户", column = "name"),
            edit = @Edit(
                    title = "所属用户", type = EditType.REFERENCE_TABLE,
                    referenceTableType = @ReferenceTableType
            )
    )
    private EruptUser eruptUser;

    @EruptField(
            views = @View(title = "备注"),
            edit = @Edit(title = "备注", type = EditType.TEXTAREA)
    )
    private String remark;

//    @ManyToMany // 多对多
//    @JoinTable(name = "t_employee_unit_framework", // 定义多对多中间表
//            joinColumns = @JoinColumn(name = "employee_id", referencedColumnName = "id"),
//            inverseJoinColumns = @JoinColumn(name = "unit_framework_id", referencedColumnName = "id"))
//    @EruptField(
//            edit = @Edit(
//                    title = "资源",
//                    type = EditType.TAB_TABLE_REFER,
//                    referenceTableType = @ReferenceTableType()
//            )
//    )
//    private List<UnitFramework> unitFrameworks;
//
//    @ManyToMany // 多对多
//    @JoinTable(name = "t_employee_working_procedure", // 定义多对多中间表
//            joinColumns = @JoinColumn(name = "employee_id", referencedColumnName = "id"),
//            inverseJoinColumns = @JoinColumn(name = "working_procedure_id", referencedColumnName = "id"))
//    @EruptField(
//            edit = @Edit(
//                    title = "工序",
//                    type = EditType.TAB_TABLE_REFER,
//                    referenceTableType = @ReferenceTableType()
//            )
//    )
//    private List<WorkingProcedure> workingProcedures;

}
