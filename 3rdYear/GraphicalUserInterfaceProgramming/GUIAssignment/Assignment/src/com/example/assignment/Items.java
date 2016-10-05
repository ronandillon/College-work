package com.example.assignment;

import java.io.Serializable;
import java.util.ArrayList;

public class Items implements Serializable {
	
	//Item class
	String type;
	String item;
	float cost;
	float VAT;
	float taxTotal;
	float sellp;
	int quantity;
	
	public Items()
	{
		this.type="";
		this.item="";
		this.cost=0;
		this.quantity=0;
	}
	
	
}
