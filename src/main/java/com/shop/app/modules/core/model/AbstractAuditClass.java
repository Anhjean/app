package com.shop.app.modules.core.model;

import java.time.Instant;
import java.util.Date;
import java.util.Optional;

import javax.persistence.Column;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.MappedSuperclass;
import javax.persistence.PrePersist;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.shop.app.modules.appuser.model.AppUser;

import org.springframework.data.domain.Auditable;


/**
 * A custom copy of {@link AbstractAuditable} to override the column names used on database. It also uses Instant
 * instead of LocalDateTime for created and modified.
 *
 * Abstract base class for auditable entities. Stores the audit values in persistent fields.
 *
 * @param <U>
 *            the auditing type. Typically some kind of user.
 * @param <PK>
 *            the type of the auditing type's identifier
 */

@MappedSuperclass
public abstract class AbstractAuditClass extends BaseEntity implements Auditable<AppUser, Long, Instant>{
    
    private static final long serialVersionUID = 141481953116476081L;
 

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "createdby_id", referencedColumnName="id", updatable=false)
    private AppUser createdBy;

    @Column(name = "created_date", updatable=false)
    @Temporal(TemporalType.TIMESTAMP)
    private Date createdDate;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "lastmodifiedby_id")
    private AppUser lastModifiedBy;

    @Column(name = "lastmodified_date")
    @Temporal(TemporalType.TIMESTAMP)
    private Date lastModifiedDate;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "deletedby_id")
    private AppUser deletedBy;

    @Column(name = "deleted_date")
    @Temporal(TemporalType.TIMESTAMP)
    private Date deletedDate;

    @Column(name = "is_delete")
    private boolean isDeleted;

    //Getter and Setter
    @Override
    public Optional<AppUser> getCreatedBy() {
        return Optional.ofNullable(this.createdBy);
    }
    

    @Override
    public void setCreatedBy(final AppUser createdBy) {
        this.createdBy = createdBy;
    }

    @Override
    public Optional<Instant> getCreatedDate() {
        return null == this.createdDate ? Optional.empty() : Optional.of(this.createdDate.toInstant());
    }

    @Override
    public void setCreatedDate(final Instant createdDate) {
        this.createdDate = null == createdDate ? null : Date.from(createdDate);
    }

    @Override
    public Optional<AppUser> getLastModifiedBy() {
        return Optional.ofNullable(this.lastModifiedBy);
    }

    @Override
    public void setLastModifiedBy(final AppUser lastModifiedBy) {
        this.lastModifiedBy = lastModifiedBy;
    }

    @Override
    public Optional<Instant> getLastModifiedDate() {
        return null == this.lastModifiedDate ? Optional.empty() : Optional.of(this.lastModifiedDate.toInstant());
    }

    @Override
    public void setLastModifiedDate(final Instant lastModifiedDate) {
        this.lastModifiedDate = null == lastModifiedDate ? null : Date.from(lastModifiedDate);
    }


    public Optional<AppUser> getDeletedBy() {
        return Optional.ofNullable(this.deletedBy);
    }

    public void setDeletedBy(final AppUser deletedBy) {
        this.deletedBy = deletedBy;
    }

 
    public Optional<Instant> getDeletedDate() {
        return null == this.deletedDate ? Optional.empty() : Optional.of(this.deletedDate.toInstant());
    }

    public void setDeletedDate(final Instant deletedDate) {
        this.deletedDate = null == deletedDate ? null : Date.from(deletedDate);
    }

    public boolean isDeleted() {
        return isDeleted;
    }

    public void setDeleted(boolean isDeleted) {
        this.isDeleted = isDeleted;
    }

    @PrePersist
    private void setDefault(){
        
        if( this.isNew() == true){
            this.createdDate = new Date();
        } else{
            this.lastModifiedDate = new Date();
        }

    }
}
