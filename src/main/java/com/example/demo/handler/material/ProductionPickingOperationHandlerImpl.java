package com.example.demo.handler.material;

import com.example.demo.model.material.ProductionPicking;
import com.example.demo.model.modeling.Employee;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;
import org.springframework.util.ObjectUtils;
import xyz.erupt.annotation.fun.OperationHandler;
import xyz.erupt.core.util.EruptSpringUtil;
import xyz.erupt.jpa.dao.EruptDao;
import xyz.erupt.upms.model.EruptOrg;
import xyz.erupt.upms.model.EruptUser;

import java.util.List;
import java.util.stream.Collectors;

/**
 * @author 一只闲鹿
 */
@Service
public class ProductionPickingOperationHandlerImpl implements OperationHandler<ProductionPicking, Void> {

    // 以下两个注解解决报错
    // No EntityManager with actual transaction available for current thread - cannot reliably process 'persist' call
    // 并且类要加上 @Service 注解
    @Modifying
    @Transactional(rollbackFor = Exception.class)
    @Override
    public String exec(List<ProductionPicking> data, Void aVoid, String[] param) {
        if (!CollectionUtils.isEmpty(data)) {
            EruptDao eruptDao= EruptSpringUtil.getBean(EruptDao.class);
            data.forEach(item -> {
                // status：初始->已提交
                item.setStatus("已提交");
                eruptDao.merge(item);
            });
        }
        return null;

    }
}
