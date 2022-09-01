package com.example.demo.handler;

import com.example.demo.model.modeling.WorkTeam;
import xyz.erupt.annotation.fun.OperationHandler;

import java.util.List;

//泛型说明
//EruptTest 为目标数据的类型
//Void erupt支持使用另一个erupt类作为表单输入框而存在，因为此演示代码并未涉及，所以使用Void来占位
public class OperationHandlerImpl implements OperationHandler<WorkTeam, Void> {

    //返回值为事件触发执行函数
    @Override
    public String exec(List<WorkTeam> data, Void vo, String[] param) {
        //TODO your logic

        // return "alert(23333)"
        // return "this.msg.info('提示信息')"
        // return "this.msg.error('错误信息')"
        // return "this.msg.success('成功信息')";
		return null;
    }

}
