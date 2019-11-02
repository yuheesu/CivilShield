package com.gsitm.spring.emp.vo;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/**
 * @programName : EmpPermVO.java
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
@Table(name="TB_EMP_PERM")
@Entity
@EqualsAndHashCode(of = "empPermNo")
@ToString
public class EmpPermVO {

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name ="EMP_PERM_NO", length=19, nullable=false)
	private Long empPermNo;
	
	@ManyToOne(cascade=CascadeType.ALL, fetch=FetchType.LAZY)
	@JoinColumn(name="EMP_NO")
	private EmpVO empVO;
	
	@Column(name ="PERM", length=20, nullable=false)
	private String perm;

}
