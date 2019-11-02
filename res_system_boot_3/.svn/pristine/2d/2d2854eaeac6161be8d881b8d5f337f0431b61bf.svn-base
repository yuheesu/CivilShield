package com.gsitm.spring.board.vo;

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
import org.hibernate.annotations.UpdateTimestamp;

import com.gsitm.spring.emp.vo.EmpVO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/**
 * @programName : BoardVO.java
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
@Table(name="TB_BOARD")
@Entity
public class BoardVO {

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name ="BOARD_NO", length=19, nullable=false)
	private Long boardNo;
	
	@Column(name ="BOARD_TYPE", length=1, nullable=false)
	private int boardType;
	
	@ManyToOne(targetEntity=EmpVO.class, fetch=FetchType.LAZY)
	@JoinColumn(name="EMP_NO")
	private EmpVO empVO;
	
	@Column(name ="SUBJECT", length=100, nullable=false)
	private String subject;
	
	@Column(name ="CONTENT", length=4000, nullable=false)
	private String content;
	
	@Column(name ="HIT", length=19, nullable=false)
	private Long hit = 0L;
	
	@Column(name ="REG_DT", nullable=false)
	@CreationTimestamp
	private Date regDt;
	
	@Column(name ="UPD_DT")
	@UpdateTimestamp
	private Date updDt;

}
