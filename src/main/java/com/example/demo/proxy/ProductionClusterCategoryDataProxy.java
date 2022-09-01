package com.example.demo.proxy;

import com.example.demo.model.material.ProductionClusterCategory;
import com.example.demo.repository.ProductionClusterCategoryRepository;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;
import xyz.erupt.annotation.fun.DataProxy;
import xyz.erupt.core.exception.EruptWebApiRuntimeException;

/**
 * @author 一只闲鹿
 */
@AllArgsConstructor
@Service
public class ProductionClusterCategoryDataProxy implements DataProxy<ProductionClusterCategory> {

    private ProductionClusterCategoryRepository repository;

    @Override
    public void beforeAdd(ProductionClusterCategory productionClusterCategory) {
        validateLevel(productionClusterCategory);
    }

    @Override
    public void beforeUpdate(ProductionClusterCategory productionClusterCategory) {
        validateLevel(productionClusterCategory);
    }

    private void validateLevel(ProductionClusterCategory productionClusterCategory) {
        // 父节点
        if (null != productionClusterCategory.getParent()) {
            ProductionClusterCategory parentCategory = repository.findParentById(productionClusterCategory.getParent().getId());
            // 祖父节点
            if (null != parentCategory.getParent()) {
                ProductionClusterCategory parentCategory2 = repository.findParentById(parentCategory.getParent().getId());
                // 曾祖父节点
                if (null != parentCategory2.getParent()) {
                    throw new RuntimeException("只允许维护三级节点！");
                }
            }

        }
    }
}
