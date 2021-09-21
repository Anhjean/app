package com.shop.app.modules.appuser.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

import com.shop.app.modules.appuser.model.AppUser;


@Repository
public interface AppUserRepo extends JpaRepository<AppUser,Long>{
    Optional<AppUser> findByUserName(String userName);
}
