package com.example.demo.repository;

import com.example.demo.model.material.ProductionClusterCategory;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.Repository;

/**
 * @author 一只闲鹿
 */
public interface ProductionClusterCategoryRepository extends Repository<ProductionClusterCategory, Long> {

    @Query("from ProductionClusterCategory where id = ?1")
    ProductionClusterCategory findParentById(Long parentId);
}
