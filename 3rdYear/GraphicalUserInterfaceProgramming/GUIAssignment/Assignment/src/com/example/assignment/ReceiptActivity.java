package com.example.assignment;

import java.util.ArrayList;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.TextView;

public class ReceiptActivity extends Activity {
	
	ArrayList<Items> myItemsList;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_receipt);
		
		setTitle("Thank You For Shopping");
		
		Bundle myBundle = getIntent().getExtras();
		Intent myIntent = getIntent();
		
        String listItems="";
        String listQuantities="";
        String listCosts="";
        
        
	    if(myBundle!=null)
	    {
	    	//Retrieving array list from MyListActivity
	    	myItemsList = (ArrayList<Items>) myIntent.getExtras().getSerializable("list");
	    }  
	        
		
		float totalVAT=0;
		float totalCost=0;
		float totalPrice=0;

		//Text Views
	    TextView itemText = (TextView) findViewById(R.id.chosenitems);
	    TextView quantityText = (TextView) findViewById(R.id.chosenquantities);
	    TextView costText = (TextView) findViewById(R.id.chosencosts);
	    TextView myTotalCost = (TextView) findViewById(R.id.totalcosts);
	    TextView myTotalVAT = (TextView) findViewById(R.id.totalVAT);
	    TextView myTotalPrice = (TextView) findViewById(R.id.totalprice);
	    
		//For loop which goes through each object in the array list
		for(Items myitem : myItemsList)
		{
			if(myitem.quantity>0)
			{
				
				listItems+= myitem.item + "\n";
				listQuantities+="x ("+myitem.quantity+")\n";
				listCosts+=String.format("%.2f",myitem.sellp*myitem.quantity)+"\n";
				
				itemText.setText(listItems);
				quantityText.setText(listQuantities);
				costText.setText(listCosts);
				
				//Adds to total values
				totalVAT -= myitem.taxTotal;
				totalCost += myitem.cost;
				totalPrice += myitem.sellp;
			}
		}
		myTotalCost.setText("Total Cost(before tax):"+String.valueOf(String.format("%.2f",totalCost)));
		myTotalVAT.setText("VAT:"+String.valueOf(String.format("%.2f",totalVAT)));
		myTotalPrice.setText("Total Cost(after tax):"+String.valueOf(String.format("%.2f",totalPrice)));
		
		
	}

	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		// Inflate the menu; this adds items to the action bar if it is present.
		getMenuInflater().inflate(R.menu.receipt, menu);
		return true;
	}

	@Override
	public boolean onOptionsItemSelected(MenuItem item) {
		// Handle action bar item clicks here. The action bar will
		// automatically handle clicks on the Home/Up button, so long
		// as you specify a parent activity in AndroidManifest.xml.
		int id = item.getItemId();
		if (id == R.id.action_settings) {
			return true;
		}
		return super.onOptionsItemSelected(item);
	}
}
