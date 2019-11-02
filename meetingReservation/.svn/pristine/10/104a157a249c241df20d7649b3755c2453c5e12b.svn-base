package com.gsitm.spring.common.vo;

import java.io.Serializable;

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

import com.gsitm.spring.room.vo.RoomVO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@Table(name="TB_ROOM_IMAGE")
@Entity
public class ImageVO{
	
	
	@ManyToOne(targetEntity=RoomVO.class, fetch=FetchType.LAZY)
	@JoinColumn(name="ROOM_NO")
	private RoomVO roomVO;
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name ="ROOM_IMG_NO", length=19, nullable=false)
	private int roomImgNo;
	
    @Lob
	@Column(name ="IMAGE")
	private byte[] image;
    
	
}