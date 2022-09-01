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
import java.util.Set;

@Erupt(name = "客户")
@Table(name = "t_customer")
@Entity
public class Customer extends BaseModel {

        @EruptField(
                views = @View(
                        title = "名称"
                ),
                edit = @Edit(
                        title = "名称",
                        type = EditType.INPUT, notNull = true,
                        inputType = @InputType
                )
        )
        private String name;

        @EruptField(
                views = @View(
                        title = "地址"
                ),
                edit = @Edit(
                        title = "地址",
                        type = EditType.INPUT,
                        inputType = @InputType
                )
        )
        private String address;

        @EruptField(
                views = @View(
                        title = "联系人", show = false
                ),
                edit = @Edit(
                        title = "联系人",
                        type = EditType.TAB_TABLE_ADD, show = false, notNull = true
                )
        )
        private @OneToMany(cascade = CascadeType.ALL)
                @OrderBy
                @JoinColumn(name = "customer_id")
        Set<Contact> contactList;

}
