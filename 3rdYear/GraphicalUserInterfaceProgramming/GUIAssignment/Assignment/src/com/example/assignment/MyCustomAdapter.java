package com.example.assignment;

import java.util.ArrayList;

import android.content.Context;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.View.OnClickListener;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.TextView;

//Custom adapter

public class MyCustomAdapter extends ArrayAdapter<Items> {
	
	private ArrayList<Items> itemlist = new ArrayList<Items>();
	private final Context context;
	boolean clicked=false;

	public MyCustomAdapter(Context context, int resource, ArrayList<Items> itemlist) {
		super(context, resource,itemlist);

		this.itemlist = itemlist;
		this.context=context;
	}
	
	public View getView(int position, View convertView, ViewGroup parent) {

		View rowView = null;
		
	    LayoutInflater inflater = (LayoutInflater) context.getSystemService(Context.LAYOUT_INFLATER_SERVICE);
	    
	    rowView = inflater.inflate(R.layout.row, parent, false);

	    TextView textViewitem = (TextView) rowView.findViewById(R.id.listofitems);
	    final TextView textViewquantity = (TextView) rowView.findViewById(R.id.listofquantities);
	    TextView textViewprice = (TextView) rowView.findViewById(R.id.listofprices);
	    Items s = itemlist.get(position);
	    
	    
	    //On click listener for adding a product to the shoping list
	    Button plus=(Button) rowView.findViewById(R.id.plus);
	    plus.setTag(position);
	    plus.setOnClickListener(new OnClickListener() {
	        
	        public void onClick(View v)
	        {
	        	int add = (Integer) v.getTag();
	        	Items product = itemlist.get(add);
	        	product.quantity++;
	        	MyListActivity.money-=product.sellp;
	        	textViewquantity.setText(String.valueOf(product.quantity));
	        }
	    });
	    
	    //On click listener for taking a product off the shopping list
	    Button minus=(Button) rowView.findViewById(R.id.minus);
	    minus.setTag(position);
	    minus.setOnClickListener(new OnClickListener() {
	        
	        public void onClick(View v)
	        {
	        	int delete = (Integer) v.getTag();
	        	Items product = itemlist.get(delete);
	        	if(product.quantity>0)
	        	{
	        		product.quantity--;
	        		MyListActivity.money+=product.sellp;
	        	}
	        	textViewquantity.setText(String.valueOf(product.quantity));
	        }
	    });
	    
	    textViewitem.setText(s.item);
	    textViewquantity.setText(String.valueOf(s.quantity));
	    textViewprice.setText(String.format("%.2f", s.sellp));

        
	    
	    
	    return rowView;
	  }

}
