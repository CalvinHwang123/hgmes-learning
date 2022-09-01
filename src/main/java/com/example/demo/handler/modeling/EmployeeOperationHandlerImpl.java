package com.example.demo.handler.modeling;

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
public class EmployeeOperationHandlerImpl implements OperationHandler<Employee, Void> {

    // 以下两个注解解决报错
    // No EntityManager with actual transaction available for current thread - cannot reliably process 'persist' call
    // 并且类要加上 @Service 注解
    @Modifying
    @Transactional(rollbackFor = Exception.class)
    @Override
    public String exec(List<Employee> data, Void aVoid, String[] param) {
        if (!CollectionUtils.isEmpty(data)) {
            // 只需要处理未关联用户的员工集合
            List<Employee> needList = data.stream().filter(employee -> ObjectUtils.isEmpty(employee.getEruptUser())).collect(Collectors.toList());
            if (!CollectionUtils.isEmpty(needList)) {
                EruptDao eruptDao= EruptSpringUtil.getBean(EruptDao.class);
                needList.forEach(employee -> {
                    // 所属组织
                    EruptOrg eruptOrg = employee.getEruptOrg();
                    // 构建用户对象
                    EruptUser newEruptUser = new EruptUser();
                    newEruptUser.setAccount(employee.getEmployeeNo());
                    newEruptUser.setName(employee.getName());
                    newEruptUser.setPassword("123456");
                    newEruptUser.setIsMd5(true);
                    newEruptUser.setEmail(employee.getEmail());
                    newEruptUser.setPhone(employee.getPhone());
                    newEruptUser.setRemark(employee.getRemark());
                    newEruptUser.setEruptOrg(eruptOrg);
                    eruptDao.persist(newEruptUser);
                    // 员工关联用户
                    employee.setEruptUser(newEruptUser);
                    eruptDao.merge(employee);
                });
            }
        }
        return null;

    }
}
