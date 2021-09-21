package com.shop.app.modules.appuser.service;

import java.util.List;
import java.util.Optional;

import com.shop.app.modules.appuser.model.AppUser;
import com.shop.app.modules.appuser.repository.AppUserRepo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AppUserServiceImpl implements AppUserService {
    
    @Autowired
    private AppUserRepo userRepository;

    @Override
    public AppUser createUser(AppUser user) {
        return userRepository.save(user);
    }

    @Override
    public String deleteUser(Long id) {
        Optional<AppUser> foundUser = userRepository.findById(id);
        if (foundUser.isPresent()){
            userRepository.deleteById(id);
        return " Deleted Success";
        } else{
            return null;
        }
    }

    @Override
    public List<AppUser> findAllUser() {
        return this.userRepository.findAll();
    }

    @Override
    public Optional<AppUser> findUserByUserName(String userName) {

        return userRepository.findByUserName(userName);
    }

    @Override
    public Optional<AppUser> updateUser(Long id, AppUser user) {
        Optional<AppUser> foundUser = userRepository.findById(id);
        if (foundUser.isPresent()){
            foundUser.get().update(user);
            return userRepository.findById(id);
        } else{
            return null;
        }
    }

    
}
