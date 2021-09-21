package com.shop.app.mastertenant.repository;

import com.shop.app.mastertenant.entity.MasterTenant;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * @author Jean
 */
@Repository
public interface MasterTenantRepository extends JpaRepository<MasterTenant, Integer> {
    MasterTenant findByTenantClientId(String clientId);
}
