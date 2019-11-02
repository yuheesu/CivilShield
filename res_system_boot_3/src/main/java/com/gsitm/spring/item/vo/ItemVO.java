package com.gsitm.spring.item.vo;

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

import com.gsitm.spring.common.GenericClass;
import com.gsitm.spring.room.vo.RoomVO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/**
 * @programName : ItemVO.java
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
@Table(name="TB_ITEM")
@Entity
public class ItemVO extends GenericClass {

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name ="ITEM_NO", length=19, nullable=false)
	private Long itemNo;
	
	@ManyToOne(targetEntity=RoomVO.class, fetch=FetchType.LAZY)
	@JoinColumn(name="ROOM_NO")
	private RoomVO roomVO;
	
	@Column(name ="ITEM_NM", length=255, nullable=false)
	private String itemNm;
	
	@Column(name ="USE_COST", length=10)
	private int useCost;
	
	@Column(name ="REG_DT", nullable=false)
	@CreationTimestamp
	private Date regDt;
	
	@Column(name ="UPD_DT")
	@UpdateTimestamp
	private Date updDt;

	@Override
	public void setId(Long id) {
		this.itemNo = id;
	}

	@Override
	public Long getId() {
		return this.itemNo;
	}

}
