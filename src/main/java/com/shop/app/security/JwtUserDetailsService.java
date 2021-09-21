package com.shop.app.security;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Service;

import java.util.Arrays;
import java.util.List;
import java.util.Optional;

import com.shop.app.modules.appuser.model.AppUser;
import com.shop.app.modules.appuser.repository.AppUserRepo;



/**
 * @author Jeans
 */
@Service
public class JwtUserDetailsService implements UserDetailsService {

    @Autowired
    AppUserRepo userRepository;

    @Override
    public UserDetails loadUserByUsername(String userName) throws UsernameNotFoundException {
        Optional<AppUser> user = userRepository.findByUserName(userName);
        if(null == user){
            throw new UsernameNotFoundException("Invalid user name or password.");
        }
        return new User(user.get().getUserName(), user.get().getPassword(), getAuthority());
    }

    private List<SimpleGrantedAuthority> getAuthority() {
        return Arrays.asList(new SimpleGrantedAuthority("ROLE_ADMIN"));
    }
}
