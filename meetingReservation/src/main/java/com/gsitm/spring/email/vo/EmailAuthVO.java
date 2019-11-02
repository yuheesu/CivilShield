package com.gsitm.spring.email.vo;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.CreationTimestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/**
 * @programName : EmailAuthVO.java
 * @author      : 차주현
 * @date        : 2018. 6. 18. 
 * @function    :  
 *
 * [이름]   [수정일]     [내용]
 * ----------------------------------------------------------
 * 
 */ 
@Getter
@Setter
@ToString
@Table(name="TB_EMAIL_AUTH")
@Entity
public class EmailAuthVO {
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name ="EMAIL_AUTH_NO", length=19, nullable=false)
	private Long emailAuthNo;
	
	@Column(name ="EMAIL", length=50, nullable=false)
	private String email;
	
	@Column(name ="KEY", length=100, nullable=false)
	private String key;
	
	@Column(name ="REG_DT", nullable=false)
	@CreationTimestamp
	private Date regDt;
}
