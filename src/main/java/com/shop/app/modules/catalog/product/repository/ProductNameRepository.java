package com.shop.app.modules.catalog.product.repository;

import java.util.List;
import java.util.Optional;

import com.shop.app.modules.catalog.product.model.ProductName;

import org.springframework.data.jpa.repository.JpaRepository;

public interface ProductNameRepository extends JpaRepository<ProductName,Long>{
    Optional<List<ProductName>> findByProductId( Long id);
}
