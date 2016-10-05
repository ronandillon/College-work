package com.example.list2;

import android.os.Bundle;
import android.app.ListActivity;
import android.view.Menu;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.ListView;
import android.widget.Toast;

 
public class MainActivity extends ListActivity {
       
        @Override
        protected void onCreate(Bundle savedInstanceState) {
                super.onCreate(savedInstanceState);
                String[] DayOfWeek = {"Monday", "Tuesday",
                        "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"};
                setContentView(R.layout.activity_main);
               
                MyCustomAdapter adapter = new MyCustomAdapter(this, DayOfWeek);
                setListAdapter(adapter);
               
        }
       
        protected void onListItemClick(ListView l, View v, int position, long id)
        {
                //getListView().getItemAtPosition(position);
                        String item = (String) getListAdapter().getItem(position);
                        Toast toast = Toast.makeText(MainActivity.this, item, Toast.LENGTH_LONG);
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