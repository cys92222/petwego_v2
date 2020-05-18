package com.example.demo.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Animal_info {

	private int pet_no;
	private String user_id;
	private Date pet_date;
	private int pet_number;
	private String pet_type;
}
