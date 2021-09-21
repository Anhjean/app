package com.shop.app.mastertenant.service;

import com.shop.app.mastertenant.entity.MasterTenant;
import com.shop.app.mastertenant.repository.MasterTenantRepository;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author Jean
 */
@Service
public class MasterTenantServiceImpl implements MasterTenantService{

    private static final Logger LOG = LoggerFactory.getLogger(MasterTenantServiceImpl.class);

    @Autowired
    MasterTenantRepository masterTenantRepository;


    @Override
    public MasterTenant findByClientId(String clientId) {
        LOG.info("----- findByClientId() method call... -----");
        return masterTenantRepository.findByTenantClientId(clientId);
    }
}
