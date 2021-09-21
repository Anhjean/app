package com.shop.app.modules.appuser.service;

import java.util.List;
import java.util.Optional;

import com.shop.app.modules.appuser.model.AppUser;

public interface AppUserService {
    Optional<AppUser> findUserByUserName(String username);
    List<AppUser> findAllUser();
    
    AppUser createUser(AppUser user);
    Optional<AppUser> updateUser(Long id, AppUser user);
    String deleteUser(Long id);
    

}
