package com.shop.app.modules.appuser.model;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.validation.constraints.Size;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.shop.app.modules.core.model.BaseEntity;

/**
 * @author Jean
 */
@Entity
@Table(name = "tbl_user")
public class AppUser extends BaseEntity{
    /** User from Spring boot security
     * Username=jean, Password=[PROTECTED], Enabled=true, AccountNonExpired=true, credentialsNonExpired=true, AccountNonLocked=true, Granted Authorities=[ROLE_ADMIN]
    */
     // @Id
    // @GeneratedValue(strategy = GenerationType.IDENTITY)
    // @Column(name = "user_id")
    // private Integer userId;
    @JsonIgnore
    @Size(max = 100)
    @Column(name = "full_name",nullable = false)
    private String fullName;
    @JsonIgnore
    @Size(max = 10)
    @Column(name = "gender",nullable = false)
    private String gender;
    @Size(max = 50)
    @Column(name = "username",nullable = false,unique = true)
    private String userName;
    @JsonIgnore
    @Size(max = 100)
    @Column(name = "password",nullable = false)
    private String password;
    //$2a$12$0K8pjnG8K88U/7jLlAUaQuGv9ax8lMLhkh0i.36vIG6FjjsyRjpZq
    // @JsonIgnore
    @Size(max = 10)
    @Column(name = "status",nullable = false)
    private String status;

    public AppUser() {
    }

    public AppUser(@Size(max = 100) String fullName, @Size(max = 10) String gender, @Size(max = 50) String userName, @Size(max = 100) String password, @Size(max = 10) String status) {
        this.fullName = fullName;
        this.gender = gender;
        this.userName = userName;
        this.password = password;
        this.status = status;
    }

    public String getFullName() {
        return fullName;
    }

    public AppUser setFullName(String fullName) {
        this.fullName = fullName;
        return this;
    }

    public String getGender() {
        return gender;
    }

    public AppUser setGender(String gender) {
        this.gender = gender;
        return this;
    }

    public String getUserName() {
        return userName;
    }

    public AppUser setUserName(String userName) {
        this.userName = userName;
        return this;
    }

    public String getPassword() {
        return password;
    }

    public AppUser setPassword(String password) {
        this.password = password;
        return this;
    }

    public String getStatus() {
        return status;
    }

    public AppUser setStatus(String status) {
        this.status = status;
        return this;
    }

    public AppUser update(AppUser newUser){
        this.setFullName(newUser.getFullName());
        this.setGender(newUser.getGender());
        this.setUserName(newUser.getUserName());
        this.setPassword(newUser.getPassword());
        this.setStatus(newUser.getStatus());
        
        return this;
    }
}
