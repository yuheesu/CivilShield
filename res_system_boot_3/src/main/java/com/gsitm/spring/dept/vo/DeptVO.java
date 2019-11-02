package com.gsitm.spring.dept.vo;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ForeignKey;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.gsitm.spring.co.bldg.vo.BldgVO;
import com.gsitm.spring.co.vo.CoVO;
import com.gsitm.spring.common.GenericClass;
import com.gsitm.spring.emp.vo.EmpVO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/**
 * @programName : DeptVO.java
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
@Table(name="TB_DEPARTMENT")
@Entity
public class DeptVO extends GenericClass {

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	//@OneToMany(mappedBy="deptVO")
	@Column(name ="DEPT_NO", length=19, nullable=false)
	private Long deptNo;
	
	@ManyToOne(targetEntity=CoVO.class, fetch=FetchType.LAZY)
	@JoinColumn(name="CO_NO")
	private CoVO coVO;
	
	@ManyToOne(targetEntity=BldgVO.class, fetch=FetchType.LAZY)
	@JoinColumn(name="BLDG_NO")
	private BldgVO bldgVO;
	
	@ManyToOne(targetEntity=EmpVO.class, fetch=FetchType.LAZY)
	@JoinColumn(name="MGR_NO", foreignKey = @ForeignKey(name="MGR_NO"), referencedColumnName="EMP_NO")
	private EmpVO mgrVO;
	
	@OneToMany(targetEntity=EmpVO.class, fetch=FetchType.LAZY)
	@JoinColumn(name="DEPT_NO")
	private List<EmpVO> emps;
	
	@Column(name ="DEPT_NM", length=30, nullable=false)
	private String deptNm;
	
	@Column(name ="DEPT_BUDGET", length=10)
	private Long deptBudget;
	
	@Column(name ="MONTH_BUDGET", length=10)
	private Long monthBudget;
	
	@Column(name ="DELETE_YN", length=1, nullable=false)
	private String deleteYn = "N";
	
	@Override
	public void setId(Long id) {
		this.deptNo = id;
	}

	@Override
	public Long getId() {
		return this.deptNo;
	}
}
