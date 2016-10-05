package com.example.assignment;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.view.WindowManager;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.EditText;
import android.widget.RadioButton;
import android.widget.TextView;
import android.widget.Toast;


public class MainActivity extends Activity {
	
	EditText name;
	EditText age;
	EditText money;
	EditText email;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        //Reference : http://www.androidsnippets.com/how-to-make-an-activity-fullscreen
        getWindow().setFlags(WindowManager.LayoutParams.FLAG_FULLSCREEN, WindowManager.LayoutParams.FLAG_FULLSCREEN);
        //End Reference
        setTitle("Welcome shopper. Enter Details");
        name = (EditText)findViewById(R.id.enter_name);
        age = (EditText)findViewById(R.id.enter_age);
        money = (EditText)findViewById(R.id.enter_money);
        email = (EditText)findViewById(R.id.enter_email);
        
        
        //Submit button listener 
        Button start=(Button)findViewById(R.id.button1);
        start.setOnClickListener(new OnClickListener() {
        
        public void onClick(View v)
        {
        	//Error checking to make sure every field was entered
        	
        	if(name.getText().toString().equals(""))
        	{
        		Toast t =Toast.makeText(MainActivity.this, "Please enter name", 5000);
        		t.show();
        	}
        	else if(age.getText().toString().equals(""))
        	{
        		Toast t =Toast.makeText(MainActivity.this, "Please enter age", 5000);
        		t.show();
        	}
        	else if(money.getText().toString().equals(""))
        	{
        		Toast t =Toast.makeText(MainActivity.this, "Please enter money", 5000);
        		t.show();
        	}
        	else if(email.getText().toString().equals(""))
        	{
        		Toast t =Toast.makeText(MainActivity.this, "Please enter email", 5000);
        		t.show();
        	}
        	else
        	{
                 Intent intent = new Intent(MainActivity.this, MyListActivity.class);
                 intent.putExtra("money",money.getText().toString());
                 startActivity(intent);
        	}
        }
        
        });
    
    }


    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.main, menu);
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
