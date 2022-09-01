package com.example.demo.handler.material;

import com.example.demo.model.material.WorkshopReceive;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;
import xyz.erupt.annotation.fun.OperationHandler;
import xyz.erupt.core.util.EruptSpringUtil;
import xyz.erupt.jpa.dao.EruptDao;

import java.util.List;

/**
 * @author 一只闲鹿
 */
@Service
public class WorkshopReceiveHandlerImpl implements OperationHandler<WorkshopReceive, Void> {

    @Modifying
    @Transactional(rollbackFor = Exception.class)
    @Override
    public String exec(List<WorkshopReceive> data, Void o, String[] param) {
        if (!CollectionUtils.isEmpty(data)) {
            EruptDao eruptDao = EruptSpringUtil.getBean(EruptDao.class);
            data.forEach(item -> {
                String sql = " update ";
                if ("生产领料".equals(item.getOrderType())) {
                    sql += " t_production_picking ";
                } else {
                    sql += " t_common_picking ";
                }
                sql += " set status = '已接收' where id = ";
                sql += item.getId();
                sql += " ";
                eruptDao.getJdbcTemplate().execute(sql);
            });
        }
        return null;
    }

}
