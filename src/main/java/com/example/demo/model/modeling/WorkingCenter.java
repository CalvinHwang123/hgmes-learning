package com.example.demo.model.modeling;

import com.example.demo.model.device.Device;
import xyz.erupt.annotation.Erupt;
import xyz.erupt.annotation.EruptField;
import xyz.erupt.annotation.sub_field.Edit;
import xyz.erupt.annotation.sub_field.EditType;
import xyz.erupt.annotation.sub_field.View;
import xyz.erupt.annotation.sub_field.sub_edit.ReferenceTableType;
import xyz.erupt.jpa.model.BaseModel;

import javax.persistence.*;
import java.util.List;

/**
 * 工作中心
 */
@Erupt(
        name = "工作中心"
)
@Table(name = "t_working_center")
@Entity
public class WorkingCenter extends BaseModel {

    @EruptField(
            views = @View(title = "编码"),
            edit = @Edit(title = "编码", notNull = true)
    )
    private String code;

    @EruptField(
            views = @View(title = "名称"),
            edit = @Edit(title = "名称", notNull = true)
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
                    type = EditType.REFERENCE_TABLE,
                    referenceTableType = @ReferenceTableType
            )
    )
    private Workshop workshop;

    @ManyToMany // 多对多
    @JoinTable(name = "t_working_center_working_procedure", // 定义多对多中间表
            joinColumns = @JoinColumn(name = "working_center_id", referencedColumnName = "id"),
            inverseJoinColumns = @JoinColumn(name = "working_procedure_id", referencedColumnName = "id"))
    @EruptField(
            views = @View(title = "工作中心工序"),
            edit = @Edit(
                    title = "工作中心工序",
                    type = EditType.TAB_TABLE_REFER,
                    referenceTableType = @ReferenceTableType
            )
    )
    private List<WorkingProcedure> workingProcedures;

    @ManyToMany // 多对多
    @JoinTable(name = "t_working_center_device", // 定义多对多中间表
            joinColumns = @JoinColumn(name = "working_center_id", referencedColumnName = "id"),
            inverseJoinColumns = @JoinColumn(name = "device_id", referencedColumnName = "id"))
    @EruptField(
            views = @View(title = "工作中心设备"),
            edit = @Edit(
                    title = "工作中心设备",
                    type = EditType.TAB_TABLE_REFER,
                    referenceTableType = @ReferenceTableType
            )
    )
    private List<Device> devices;

}
