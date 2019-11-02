package com.gsitm.spring.room.vo;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import lombok.Getter;
import lombok.Setter;

/**
 * @programName : RoomImageVO.java
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
@Table(name="TB_ROOM_IMAGE")
@Entity
public class RoomImageVO {
	
	@ManyToOne(targetEntity=RoomVO.class, fetch=FetchType.LAZY)
	@JoinColumn(name="ROOM_NO")
	private RoomVO roomVO;
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name ="ROOM_IMG_NO", length=19, nullable=false)
	private Long roomImgNo;

	@Lob
	@Column(name ="IMAGE", nullable=false)
	private byte[] image;

}
