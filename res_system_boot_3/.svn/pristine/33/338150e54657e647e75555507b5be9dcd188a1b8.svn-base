package com.gsitm.spring.dept.vo;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ForeignKey;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import com.gsitm.spring.emp.vo.EmpVO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/**
 * @programName : DeptBudgetVO.java
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
@Table(name="TB_DEPT_BUDGET")
@Entity
public class DeptBudgetVO {
	
	@ManyToOne(targetEntity=DeptVO.class, fetch=FetchType.LAZY)
	@JoinColumn(name="DEPT_NO")
	private DeptVO deptVO;
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name ="DEPT_BUDGET_NO", length=19, nullable=false)
	private Long deptBudgetNo;
	
	@CreationTimestamp
	@Column(name ="PROC_DT", nullable=false)
	private Date procDt;
	
	@Column(name ="PROC_DIV", length=100)
	private String procDiv;
	
	@Column(name ="HISTORY", length=4000)
	private String history;
	
	@Column(name ="BUDGET_TYPE", length=1, nullable=false)
	private int budgetType;
	
	@Column(name ="INCOMING", length=10)
	private Long incoming;

	@Column(name ="OUTGOING", length=10)
	private Long outgoing;
	
	@UpdateTimestamp
	@Column(name ="UPD_DT")
	private Date updDt;
	
	@ManyToOne(targetEntity=EmpVO.class, fetch=FetchType.LAZY)
	@JoinColumn(name="UPD_EMP_NO", foreignKey = @ForeignKey(name="UPD_EMP_NO"), referencedColumnName="EMP_NO")
	private EmpVO empVO;

}
