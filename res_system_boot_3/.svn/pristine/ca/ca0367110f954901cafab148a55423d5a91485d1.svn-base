package com.gsitm.spring.co.vo;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/**
 * @programName : CoVO.java
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
@Table(name="TB_COMPANY")
@Entity
public class CoVO {

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	//@OneToMany(mappedBy="coVO")
	@Column(name ="CO_NO", length=19, nullable=false)
	private Long coNo;
	
	@Column(name ="CO_NM", length=100, nullable=false)
	private String coNm;

	@Column(name ="DELETE_YN", length=1, nullable=false)
	private String deleteYn = "N";

}
