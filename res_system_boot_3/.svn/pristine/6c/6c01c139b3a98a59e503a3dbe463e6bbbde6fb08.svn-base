package com.gsitm.spring.email.vo;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/**
 * @programName : EmailVO.java
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
@ToString
@Table(name="TB_EMAIL")
@Entity
public class EmailVO {

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	//@OneToMany(mappedBy="emailVO")
	@Column(name ="EMAIL_NO", length=19, nullable=false)
	private Long emailNo;
	
	@Column(name ="SUBJECT", length=255, nullable=false)
	private String subject;
	
	@Column(name ="CONTENT", length=4000, nullable=false)
	private String content;
	
	@Column(name ="REG_DT", nullable=false)
	@CreationTimestamp
	private Date regDt;
	
	@Column(name ="UPD_DT")
	@UpdateTimestamp
	private Date updDt;

}
