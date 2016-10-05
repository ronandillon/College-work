package com.example.lists;

import android.os.Bundle;
import android.app.ListActivity;
import android.view.Menu;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.ListView;
import android.widget.Toast;

public class MainActivity extends ListActivity {
	
	String[] DayOfWeek = {"Monday", "Tuesday",
			"Wednesday", "Thursday", "Friday", "Saturday", "Sunday"};
	
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_main);
		
		setListAdapter(new ArrayAdapter<String>(this, R.layout.row, R.id.weekofday, DayOfWeek));
		
	}
	
	protected void onListItemClick(ListView l, View v, int position, long id) 
	{
		//getListView().getItemAtPosition(position);
		Toast toast = Toast.makeText(MainActivity.this, 
			    DayOfWeek[position], Toast.LENGTH_SHORT);
		toast.show();
		
		// use getItemAtPosition method of listview to select back the text
		// display the text using a Toast class 
	}

	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		// Inflate the menu; this adds items to the action bar if it is present.
		getMenuInflater().inflate(R.menu.main, menu);
		return true;
	}

}
