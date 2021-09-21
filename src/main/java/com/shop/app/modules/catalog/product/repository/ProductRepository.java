package com.shop.app.modules.catalog.product.repository;

import com.shop.app.modules.catalog.product.model.Product;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * @author Jean
 */
@Repository
public interface ProductRepository extends JpaRepository<Product, Long> {
}
