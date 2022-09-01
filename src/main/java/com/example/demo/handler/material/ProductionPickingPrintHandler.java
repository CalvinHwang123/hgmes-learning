package com.example.demo.handler.material;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import xyz.erupt.annotation.sub_erupt.Tpl;

import java.util.Map;

/**
 * @author 一只闲鹿
 */
public class ProductionPickingPrintHandler implements Tpl.TplHandler {

    @Override
    public void bindTplData(Map<String, Object> binding, String[] params) {
        System.out.println("binding");
        System.out.println(binding);
        binding.put("title", "生产领料单");
        // 复杂对象转json，便于前端处理
        try {
            String json = new ObjectMapper().writeValueAsString(binding);
            System.out.println(json);
            binding.put("jsonResult", json);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
            throw new RuntimeException("操作失败：" + e.getMessage());
        }
    }

}
