package com.example.demo.proxy;

import com.example.demo.model.material.MaterialCategoryPropertyTeam;
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
public class MaterialCategoryPropertyTeamDataProxy implements DataProxy<MaterialCategoryPropertyTeam> {

    private EruptDao eruptDao;

    @Override
    public void afterFetch(Collection<Map<String, Object>> list) {
        for (Map<String, Object> map : list) {
            Long teamId = Long.valueOf(map.get("id").toString());
            String sql = " select id, code, name from t_material_property where id in ( " +
                    "select property_id from t_material_category_property_team_property where material_category_property_team_id = " + teamId + " ) ";
            List resultList = eruptDao.getEntityManager().createNativeQuery(sql).getResultList();
            if (!CollectionUtils.isEmpty(resultList)) {
                StringBuilder builder = new StringBuilder();
                for (Object object: resultList) {
                    Object[] objs = (Object[]) object;
                    builder.append(objs[2]); // name
                    builder.append(",");
                }
                map.put("properties", builder.toString().substring(0, builder.toString().length() - 1));
            }
        }
    }

}
