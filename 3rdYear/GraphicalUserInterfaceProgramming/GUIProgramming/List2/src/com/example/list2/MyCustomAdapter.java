package com.example.list2;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.ImageView;
import android.widget.TextView;
 
public class MyCustomAdapter extends ArrayAdapter<String> {
 
private final Context context;
  private final String[] DayOfWeek;
 
  public MyCustomAdapter(Context context, String[] DayOfWeek) {
    super(context, R.layout.row, DayOfWeek);
    this.context = context;
    this.DayOfWeek = DayOfWeek;
  }
 
  @Override
  public View getView(int position, View convertView, ViewGroup parent) {
    LayoutInflater inflater = (LayoutInflater) context
        .getSystemService(Context.LAYOUT_INFLATER_SERVICE);
    View rowView = inflater.inflate(R.layout.row, parent, false);
    TextView textView = (TextView) rowView.findViewById(R.id.weekofday);
    ImageView imageView = (ImageView) rowView.findViewById(R.id.ok);
    textView.setText(DayOfWeek[position]);
    // Change the icon for Windows and iPhone
    String s = DayOfWeek[position];
    if (s == "Thursday") {
      imageView.setImageResource(R.drawable.ok);
    } else {
      imageView.setImageResource(R.drawable.ic_launcher);
    }
 
    return rowView;
  }
}
