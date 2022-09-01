package com.example.demo.handler.material;

import com.example.demo.model.approve.ApproveForm;
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
public class ProcessRouteApproveOperationHandlerImpl implements OperationHandler<ProcessRoute, ApproveForm> {

    @Modifying
    @Transactional(rollbackFor = Exception.class)
    @Override
    public String exec(List<ProcessRoute> data, ApproveForm approveForm, String[] param) {
        EruptDao eruptDao = EruptSpringUtil.getBean(EruptDao.class);
        ProcessRoute processRoute = data.get(0);
        if (approveForm.getResult()) {
            processRoute.setStatus("发布");
        } else {
            processRoute.setStatus("初始");
        }
        eruptDao.merge(processRoute);
        // 保存审核记录
        approveForm.setRelationId(processRoute.getId());
        eruptDao.persist(approveForm);
        return null;
    }

}
