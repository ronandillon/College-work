package com.example.flashlight;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;

public class GreenActivity extends Activity {

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.green_activitiy);
		
		Button start=(Button)findViewById(R.id.red_button);
        start.setOnClickListener(new OnClickListener() {

            @Override
            public void onClick(View v)
            {
                     Intent intent = new Intent
                    (GreenActivity.this, MainActivity.class);
                     startActivity(intent);
            }
        });
	}

	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		// Inflate the menu; this adds items to the action bar if it is present.
		getMenuInflater().inflate(R.menu.main, menu);
		return true;
	}
}
