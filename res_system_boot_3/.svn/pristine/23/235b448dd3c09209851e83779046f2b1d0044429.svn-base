package com.gsitm.spring.emp.vo;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import lombok.Getter;
import lombok.Setter;

/**
 * @programName : PasswordVO.java
 * @author      : 차주현
 * @date        : 2018. 6. 8. 
 * @function    :  
 *
 * [이름]   [수정일]     [내용]
 * ----------------------------------------------------------
 * 
 */ 
@Getter
@Setter
@Table(name="TB_PASSWORD")
@Entity
public class PasswordVO implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -6368529472683596175L;

	@Id
	@Column(name ="EMP_NO", length=19, nullable=false)
	private Long empNo;
	
	@Column(name ="PWD", length=255, nullable=false)
	private String pwd;
	
	@Column(name ="OLD_PWD", length=255)
	private String oldPwd;
	
	@Column(name ="REG_DT", nullable=false)
	@CreationTimestamp
	private Date regDt;
	
	@Column(name ="UPD_DT")
	@UpdateTimestamp
	private Date updDt;
	
	@Override
	public String toString() {
		return "PasswordVO [id=" +empNo+", pwd="+pwd+", oldPwd="+oldPwd+"]";
	}
} 
