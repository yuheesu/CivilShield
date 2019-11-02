package com.gsitm.spring.emp.vo;

import java.util.Date;
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
import javax.persistence.MapsId;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

import com.gsitm.spring.common.GenericClass;
import com.gsitm.spring.dept.vo.DeptVO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/**
 * @programName : EmpVO.java
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
@Table(name="TB_EMPLOYEE")
@Entity
public class EmpVO extends GenericClass {

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name ="EMP_NO", length=19, nullable=false)
	private Long empNo;

//	@OneToMany(fetch=FetchType.LAZY)
//	@JoinColumn(name="EMP_NO")
//	private List<PasswordVO> passwordVO;
	
	@ManyToOne(targetEntity=DeptVO.class, fetch=FetchType.LAZY)
	@JoinColumn(name="DEPT_NO")
	private DeptVO deptVO;

	@Column(name ="EMP_ID", length=30, nullable=false, unique=true)
	private String empId;
	
	@Column(name ="EMP_NM", length=30, nullable=false)
	private String empNm;
	
	@Column(name ="CO_GRADE", length=100)
	private String coGrade;
	
	@Column(name ="PERSONAL_PHONE", length=20, nullable=false)
	private String personalPhone;
	
	@Column(name ="COMPANY_PHONE", length=20)
	private String companyPhone;
	
	@Column(name ="JOB", length=100)
	private String job;
	
	@Column(name ="EMAIL_ADDR", length=50)
	private String emailAddr;
	
	@Column(name ="HIREDATE", length=20, nullable=false)
	private Date hiredate;
	
	@Column(name ="SALARY", length=10, nullable=false)
	private Long salary;

	@OneToMany(cascade=CascadeType.ALL, fetch=FetchType.LAZY)
	@JoinColumn(name="EMP_NO")
	private List<EmpPermVO> perms;
	
	@Override
	public void setId(Long id) {
		this.empNo = id;
	}

	@Override
	public Long getId() {
		return this.empNo;
	}
}
