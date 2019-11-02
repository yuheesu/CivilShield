package com.gsitm.spring.email.vo;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.CreationTimestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/**
 * @programName : SendEmailVO.java
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
@Table(name="TB_SEND_EMAIL")
@Entity
public class SendEmailVO {
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name ="SEND_EMAIL_NO", length=19, nullable=false)
	private Long emailNo;
	
	@ManyToOne(targetEntity=EmailVO.class, fetch=FetchType.LAZY)
	@JoinColumn(name="EMAIL_NO")
	private EmailVO emailVO;
	
	@Column(name ="RAW_DATA", length=4000, nullable=false)
	private String rawData;
	
	@Column(name ="EMAIL_TO", length=50, nullable=false)
	private String emailTo;
	
	@Column(name ="EMAIL_FROM", length=50, nullable=false)
	private String emailFrom;
	
	@Column(name ="SEND_STATE", length=1, nullable=false)
	private int sendState;
	
	@Column(name ="SEND_DT", nullable=false)
	private Date sendDt;
	
	@Column(name ="REG_DT", nullable=false)
	@CreationTimestamp
	private Date regDt;

}
