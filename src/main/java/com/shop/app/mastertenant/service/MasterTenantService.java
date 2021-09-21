package com.shop.app.mastertenant.service;

import com.shop.app.mastertenant.entity.MasterTenant;

/**
 * @author Jean
 */
public interface MasterTenantService {

    MasterTenant findByClientId(String clientId);
}
