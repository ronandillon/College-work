package com.example.helloworld;

import android.app.Activity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import java.util.Date;

public class MainActivity extends Activity
implements View.OnClickListener {
Button btn;

@Override
public void onCreate(Bundle icicle) {
	super.onCreate(icicle);

	setContentView(R.layout.activity_main);

	btn=(Button)findViewById(R.id.button);
	btn.setOnClickListener(this);
	updateTime();
}

public void onClick(View view) {
	updateTime();
}

private void updateTime() {
	btn.setText(new Date().toString());
}
}