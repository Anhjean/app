package com.shop.app.modules.core.model;

import java.io.Serializable;


import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.MappedSuperclass;

import javax.persistence.Table;

import javax.persistence.Transient;
import javax.persistence.Version;

import com.fasterxml.jackson.annotation.JsonIgnore;

import org.springframework.data.domain.Persistable;


/**
 * Abstract base class for entities.
 *
 * Inspired by {@link org.springframework.data.jpa.domain.AbstractPersistable}, but Id is always Long (and this class
 * thus does not require generic parameterization), and auto-generation is of strategy
 * {@link javax.persistence.GenerationType#IDENTITY}.
 *
 * The {@link #equals(Object)} and {@link #hashCode()} methods are NOT implemented here, which is untypical for JPA
 * (it's usually implemented based on the Id), because "we end up with issues on OpenJPA" (need to clarify this).
 */


@MappedSuperclass
@Table(name = "BaseEntity")
public abstract class BaseEntity implements Persistable<Long>,Serializable{
    private static final long serialVersionUID = 9181640245194392646L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id",nullable = false)
    private Long id;

    @Version
    @Column(name = "version",nullable = false)
    private Integer version;

    @Override
    public Long getId() {
        return id;
    }

    public void setId(final Long id) {
        this.id = id;
    }

    @Override
    @JsonIgnore
    @Transient // DATAJPA-622
    public boolean isNew() {
        return null == this.id;
    }
   
}

