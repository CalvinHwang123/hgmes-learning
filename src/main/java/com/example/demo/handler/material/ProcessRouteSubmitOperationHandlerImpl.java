package com.example.demo.handler.material;

import com.example.demo.model.material.ProcessRoute;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import xyz.erupt.annotation.fun.OperationHandler;
import xyz.erupt.core.util.EruptSpringUtil;
import xyz.erupt.jpa.dao.EruptDao;

import java.util.List;

/**
 * @author 一只闲鹿
 */
@Service
public class ProcessRouteSubmitOperationHandlerImpl implements OperationHandler<ProcessRoute, Void> {

    @Modifying
    @Transactional(rollbackFor = Exception.class)
    @Override
    public String exec(List<ProcessRoute> data, Void v, String[] param) {
        EruptDao eruptDao = EruptSpringUtil.getBean(EruptDao.class);
        ProcessRoute processRoute = data.get(0);
        processRoute.setStatus("待审核");
        eruptDao.merge(processRoute);
        return null;
    }

}
