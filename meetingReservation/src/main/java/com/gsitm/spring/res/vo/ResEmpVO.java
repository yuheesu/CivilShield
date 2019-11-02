package com.gsitm.spring.res.vo;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.gsitm.spring.dept.vo.DeptVO;
import com.gsitm.spring.emp.vo.EmpVO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/**
 * @programName : ResEmpVO.java
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
@Table(name="TB_RES_EMP")
@Entity
public class ResEmpVO {
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name ="RES_EMP_NO", length=19, nullable=false)
	private Long resEmpNo;
	
	@ManyToOne(targetEntity=ResVO.class, fetch=FetchType.LAZY)
	@JoinColumn(name="RES_NO")
	private ResVO resVO;
	
	
	@ManyToOne(targetEntity=EmpVO.class, fetch=FetchType.LAZY)
	@JoinColumn(name="EMP_NO")
	private EmpVO empVO;
	
	@ManyToOne(targetEntity=DeptVO.class, fetch=FetchType.LAZY)
	@JoinColumn(name="DEPT_NO")
	private DeptVO deptVO;
	
}
