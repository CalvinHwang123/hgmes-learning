package com.example.demo.handler;

import com.example.demo.model.material.MaterialCategoryPropertyValue;
import lombok.extern.slf4j.Slf4j;
import xyz.erupt.annotation.fun.OperationHandler;

import java.util.List;

/**
 * @author 一只闲鹿
 * //泛型说明
 * //MaterialCategoryPropertyValue 为目标数据的类型
 * //Void erupt支持使用另一个erupt类作为表单输入框而存在，因为此演示代码并未涉及，所以使用Void来占位
 */
@Slf4j
public class MaterialCategoryPropertyValueOperationHandlerImpl implements OperationHandler<MaterialCategoryPropertyValue, String> {

    //返回值为事件触发执行函数
    @Override
    public String exec(List<MaterialCategoryPropertyValue> data, String s, String[] param) {
        //TODO your logic
        log.info("MaterialCategoryPropertyValueOperationHandlerImpl 执行了");

        // return "alert(23333)"
        // return "this.msg.info('提示信息')"
        // return "this.msg.error('错误信息')"
        // return "this.msg.success('成功信息')";
        return null;
    }

}
