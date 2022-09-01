/*
 * Copyright © 2020-2035 erupt.xyz All rights reserved.
 * Author: YuePeng (erupts@126.com)
 */

package com.example.demo.model;

import xyz.erupt.annotation.*;
import xyz.erupt.annotation.sub_field.*;
import xyz.erupt.annotation.sub_field.sub_edit.InputType;
import xyz.erupt.jpa.model.BaseModel;

import javax.persistence.*;

@Erupt(name = "联系人")
@Table(name = "t_contact")
@Entity
public class Contact extends BaseModel {

        @EruptField(
                views = @View(
                        title = "姓名"
                ),
                edit = @Edit(
                        title = "姓名",
                        type = EditType.INPUT, notNull = true,
                        inputType = @InputType
                )
        )
        private String name;

        @EruptField(
                views = @View(
                        title = "电话"
                ),
                edit = @Edit(
                        title = "电话",
                        type = EditType.INPUT,
                        inputType = @InputType
                )
        )
        private String phone;

}
