package com.gsitm.spring.res.vo;

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
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import com.gsitm.spring.emp.vo.EmpVO;
import com.gsitm.spring.room.vo.RoomVO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/**
 * @programName : ResVO.java
 * @author      : 차주현
 * @date        : 2018. 6. 8. 
 * @function    :  
 *
 * [이름]   [수정일]     [내용]
 * ----------------------------------------------------------
 * 차주현 2018. 6. 13. 장소 테이블과의 외래키 관계 추가
 * 
 */ 
@Getter
@Setter
@ToString
@Table(name="TB_RESERVATION")
@Entity
public class ResVO {

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name ="RES_NO", length=19, nullable=false)
	private Long resNo;
	
	@ManyToOne(targetEntity=EmpVO.class, fetch=FetchType.EAGER)
	@JoinColumn(name="EMP_NO")
	private EmpVO empVO;
	
	@ManyToOne(targetEntity=RoomVO.class, fetch=FetchType.EAGER)
	@JoinColumn(name="ROOM_NO")
	private RoomVO roomVO;
	
	@Column(name ="START_DT", nullable=false)
	private Date startDt;
	
	@Column(name ="END_DT", nullable=false)
	private Date endDt;
	
	@Column(name ="RES_STATE", length=1, nullable=false)
	private int resState;
	
	@Column(name ="TOTAL_COST", length=10)
	private Long totalCost;
	
	@Column(name ="REASON", length=4000)
	private String reason;
	
	@OneToMany(cascade=CascadeType.ALL, fetch=FetchType.LAZY)
	@JoinColumn(name="RES_NO")
	private List<ResItemVO> items;
	
	@OneToMany(cascade=CascadeType.ALL, fetch=FetchType.LAZY)
	@JoinColumn(name="EMP_NO")
	private List<ResEmpVO> emps;
	
	@Column(name ="REG_DT", nullable=false)
	@CreationTimestamp
	private Date regDt;
	
	@Column(name ="UPD_DT")
	@UpdateTimestamp
	private Date updDt;
	
	@OneToMany(cascade=CascadeType.ALL, fetch=FetchType.LAZY)
	@JoinColumn(name="ROOM_NO")
	private List<ResVO> reses;
}
