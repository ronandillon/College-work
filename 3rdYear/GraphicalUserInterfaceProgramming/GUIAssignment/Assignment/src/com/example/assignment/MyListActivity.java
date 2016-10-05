package com.example.assignment;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.util.ArrayList;
import android.support.v7.app.ActionBarActivity;
import android.content.Intent;
import android.os.Bundle;
import android.os.Parcelable;
import android.util.Log;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.ListView;
import android.widget.Toast;

public class MyListActivity extends ActionBarActivity {
	
	ArrayList<Items> itemslist = new ArrayList<Items>();
	static float money;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_my_list);
		
		Intent i= getIntent();
	    money=Float.parseFloat(i.getStringExtra("money"));
		setTitle("Money Available: "+money);
		
		Items product =null;
    	
        try
        {

        	
            BufferedReader reader = new BufferedReader(new InputStreamReader(getAssets().open("items.txt")));
            
    		String listofitems = null;
    		String[] words=null;
    		while ((listofitems = reader.readLine()) != null)
    		{
    			product=new Items();
    			words = listofitems.split(",");
    			product.type=words[0];

    			product.item=words[1];
    			product.cost=Float.parseFloat(words[2]);
    			product.VAT=21;
    			product.sellp= (product.cost*(product.VAT/100 +1));
    			product.taxTotal=product.cost-product.sellp;
    			itemslist.add(product);
        			//fileList[] split = new fileList(words[0],words[1],words[2]);
    			
    			
    		}
        }
        catch (Exception e)
        {
        	
        	e.printStackTrace();
        }
        
        MyCustomAdapter adapter = new MyCustomAdapter(this, R.id.list, itemslist);
		
		ListView lv = (ListView) findViewById(R.id.list);

        lv.setAdapter(adapter);
        Button submit=(Button) findViewById(R.id.submitlist);
        submit.setOnClickListener(new OnClickListener() {
        
        public void onClick(View v)
        {
        	
        	
        	if(money>=0)
        	{
        		setTitle("Money Available: "+money);
        	Intent intent = new Intent(MyListActivity.this, ReceiptActivity.class);
        	intent.putExtra("list",itemslist);
        	
            startActivity(intent);
        	}
        	else
        	{
        		setTitle("Over Spent By: "+(money*-1));
        		Toast myToast = Toast.makeText(MyListActivity.this, "Over spent please remove some items", 5000);
        		myToast.show();
        	}
        }
        });
	}

	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		// Inflate the menu; this adds items to the action bar if it is present.
		getMenuInflater().inflate(R.menu.my_list, menu);
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
