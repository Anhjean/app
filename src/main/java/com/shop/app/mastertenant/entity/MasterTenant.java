package com.shop.app.mastertenant.entity;

import javax.persistence.*;
import javax.validation.constraints.Size;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * @author Jean
 */
@Data
@Entity
@Table(name = "tbl_tenant_master")
public class MasterTenant implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "connection_id")
    private Integer connectionId;

    @Size(max = 50)
    @Column(name = "tenant_id",nullable = false)
    private String tenantClientId;

    @Size(max = 50)
    @Column(name = "schema_name",nullable = false)
    private String dbName;

    @Size(max = 100)
    @Column(name = "schema_url",nullable = false)
    private String url;

    @Size(max = 50)
    @Column(name = "schema_username",nullable = false)
    private String userName;
    @Size(max = 100)
    @Column(name = "schema_password",nullable = false)
    private String password;
    @Size(max = 100)
    @Column(name = "schema_driver_class",nullable = false)
    private String driverClass;
    @Size(max = 10)
    @Column(name = "status",nullable = false)
    private String status;

    @Size(max = 10)
    @Column(name = "timezone_id",nullable = true)
    private String timeZone;

    @Column(name = "country_id",nullable = true)
    private Integer countryId;

    @Column(name = "auto_update",nullable = true)
    private Integer autoUpdate;

    @Column(name = "created_date",nullable = true)
    private Date createdDate;

    @Column(name = "modified_date",nullable = true)
    private Date modifiedDate;

    @Column(name = "pool_initial_size",nullable = true)
    private Integer poolInitialSize;

    @Column(name = "pool_validation_interval",nullable = true)
    private Integer poolValidationInterval;

    @Column(name = "pool_remove_abandoned",nullable = true)
    private Integer poolRemoveAbandoned;

    @Column(name = "pool_remove_abandoned_timeout",nullable = true)
    private Integer poolRemoveAbandonedTimeout;

    @Column(name = "pool_log_abandoned",nullable = true)
    private Integer poolLogAbandoned;

    @Column(name = "pool_abandon_when_percentage_full",nullable = true)
    private Integer poolAbandonWhenPercentageFull;

    @Column(name = "pool_test_on_borrow",nullable = true)
    private Integer poolTestOnBorrow;

    @Column(name = "pool_max_active",nullable = true)
    private Integer poolMaxActive;

    @Column(name = "pool_min_idle",nullable = true)
    private Integer poolMinIdle;

    @Column(name = "pool_max_idle",nullable = true)
    private Integer poolMaxIdle;
    @Column(name = "pool_suspect_timeout",nullable = true)
    private Integer poolSuspectTimeout;
    @Column(name = "pool_time_between_eviction_runs_millis",nullable = true)
    private Integer poolTimeBetweenEvictionRunsMillis;
    @Column(name = "pool_min_evictable_idle_time_millis",nullable = true)
    private Integer poolMinEvictableIdleTimeMillis;
    @Column(name = "deadlock_max_retries",nullable = true)
    private Integer deadlockMaxRetries;
    @Column(name = "deadlock_max_retry_interval",nullable = true)
    private Integer deadlockMaxRetryInterval;
    @Size(max = 255)
    @Column(name = "schema_connection_parameters",nullable = true)
    private String schema_connection_parameters;


    public MasterTenant() {
    }

    public MasterTenant(@Size(max = 50) String dbName, @Size(max = 100) String url, @Size(max = 50) String userName, @Size(max = 100) String password, @Size(max = 100) String driverClass, @Size(max = 10) String status) {
        this.dbName = dbName;
        this.url = url;
        this.userName = userName;
        this.password = password;
        this.driverClass = driverClass;
        this.status = status;
    }

    public String getTenantClientId() {
        return this.tenantClientId;
    }

    public MasterTenant setTenantClientId(String tenantClientId) {
        this.tenantClientId = tenantClientId;
        return this;
    }

    public String getDbName() {
        return this.dbName;
    }

    public MasterTenant setDbName(String dbName) {
        this.dbName = dbName;
        return this;
    }

    public String getUrl() {
        return this.url;
    }

    public MasterTenant setUrl(String url) {
        this.url = url;
        return this;
    }

    public String getUserName() {
        return this.userName;
    }

    public MasterTenant setUserName(String userName) {
        this.userName = userName;
        return this;
    }

    public String getPassword() {
        return this.password;
    }

    public MasterTenant setPassword(String password) {
        this.password = password;
        return this;
    }

    public String getDriverClass() {
        return this.driverClass;
    }

    public MasterTenant setDriverClass(String driverClass) {
        this.driverClass = driverClass;
        return this;
    }

    public String getStatus() {
        return this.status;
    }

    public MasterTenant setStatus(String status) {
        this.status = status;
        return this;
    }

    public Integer getConnectionId() {
        return connectionId;
    }

    public MasterTenant setConnectionId(Integer connectionId) {
        this.connectionId = connectionId;
        return this;
    }

}
