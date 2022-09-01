package com.example.demo.proxy;

import com.example.demo.model.material.MaterialCategoryPropertyValue;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;
import xyz.erupt.annotation.fun.DataProxy;
import xyz.erupt.jpa.dao.EruptDao;

import java.util.Collection;
import java.util.List;
import java.util.Map;

/**
 * @author 一只闲鹿
 */
@AllArgsConstructor
@Service
public class MaterialCategoryPropertyValueDataProxy implements DataProxy<MaterialCategoryPropertyValue> {

    private EruptDao eruptDao;

    @Override
    public void afterFetch(Collection<Map<String, Object>> list) {
        for (Map<String, Object> map : list) {
            Long categoryId = Long.valueOf(map.get("materialCategory_id").toString());
            String sql = " select id, code, name from t_material_category where id = " + categoryId + " ";
            Object materialCategory = eruptDao.getEntityManager().createNativeQuery(sql).getSingleResult();
            // 物料类别编码
            String categoryCode = ((Object[]) materialCategory)[1].toString();
            // 物料类别名称
            String categoryName = ((Object[]) materialCategory)[2].toString();
            map.put("materialCategoryCode", categoryCode);
            map.put("materialCategoryName", categoryName);
            sql = " select id, code, name from t_material_property where id in (" +
                    "select property_id from t_material_category_property_team_property where material_category_property_team_id in (" +
                    "select id from t_material_category_property_team where material_category_id = " + categoryId + " )) ";
            List propertyList = eruptDao.getEntityManager().createNativeQuery(sql).getResultList();
            if (!CollectionUtils.isEmpty(propertyList)) {
                for (Object obj: propertyList) {
                    Object[] objs = (Object[]) obj;
                    map.put("propertyCode", objs[1]);
                    map.put("property", objs[2]);
                }
            }
        }
    }

}
