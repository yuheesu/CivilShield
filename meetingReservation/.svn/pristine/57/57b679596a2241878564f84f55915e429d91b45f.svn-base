package com.gsitm.spring.res.vo;

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

import com.gsitm.spring.item.vo.ItemVO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/**
 * @programName : ResItemVO.java
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
@Table(name="TB_RES_ITEM")
@Entity
public class ResItemVO {

	@ManyToOne(targetEntity=ResVO.class, fetch=FetchType.LAZY)
	@JoinColumn(name="RES_NO")
	private ResVO resVO;
	
	@ManyToOne(targetEntity=ItemVO.class, fetch=FetchType.EAGER)
	@JoinColumn(name="ITEM_NO")
	private ItemVO itemVO;
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name ="RES_ITEM_NO", length=19, nullable=false)
	private Long resItemNo;
	
	@Column(name ="REG_DT", nullable=false)
	@CreationTimestamp
	private Date regDt;
	
	@Column(name ="UPD_DT")
	@UpdateTimestamp
	private Date updDt;

}
