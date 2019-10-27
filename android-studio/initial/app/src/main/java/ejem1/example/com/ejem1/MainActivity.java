package ejem1.example.com.ejem1;

import android.support.v7.app.ActionBarActivity;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.EditText;
import android.widget.TextView;


public class MainActivity extends ActionBarActivity {


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);


    }
public void conv1(){
    TextView text=(TextView)findViewById(R.id.textView);
    EditText date=(EditText)findViewById(R.id.editText);
    Double num1=Double.parseDouble(date.getText().toString());
    TextView text2=(TextView)findViewById(R.id.textView2);
    EditText date2=(EditText)findViewById(R.id.editText2);
    String m1="[ pie ]";
    String m2="[ m ]";
    text2.setText(m1);
    date2.setText(m2);
    Double total1=num1/0.3048;
    String resul=String.valueOf(total1);
    text.setText(resul);
}
    public void on1(View view){
        conv1();
    }
    public void conv2(){
        TextView text=(TextView)findViewById(R.id.textView);
        EditText date=(EditText)findViewById(R.id.editText);
        Double num1=Double.parseDouble(date.getText().toString());
        TextView text2=(TextView)findViewById(R.id.textView2);
        EditText date2=(EditText)findViewById(R.id.editText2);
        String m1="[ pul ]";
        String m2="[ m ]";
        text2.setText(m1);
        date2.setText(m2);
        Double total1=num1/0.0254;
        String resul=String.valueOf(total1);
        text.setText(resul);
    }
    public void on2(View view){
        conv2();
    }
    public void conv3(){
        TextView text=(TextView)findViewById(R.id.textView);
        EditText date=(EditText)findViewById(R.id.editText);
        Double num1=Double.parseDouble(date.getText().toString());
        TextView text2=(TextView)findViewById(R.id.textView2);
        EditText date2=(EditText)findViewById(R.id.editText2);
        String m1="[ milla ]";
        String m2="[ m ]";
        text2.setText(m1);
        date2.setText(m2);
        Double total1=num1/1609;
        String resul=String.valueOf(total1);
        text.setText(resul);
    }
    public void on3(View view){
        conv3();
    }
    public void conv4(){
        TextView text=(TextView)findViewById(R.id.textView);
        EditText date=(EditText)findViewById(R.id.editText);
        Double num1=Double.parseDouble(date.getText().toString());
        TextView text2=(TextView)findViewById(R.id.textView2);
        EditText date2=(EditText)findViewById(R.id.editText2);
        String m1=" [ m ] ";
        String m2="[ pie ]";
        text2.setText(m1);
        date2.setText(m2);
        Double total1=num1*0.3048;
        String resul=String.valueOf(total1);
        text.setText(resul);
    }
    public void on4(View view){
        conv4();
    }
    public void conv5(){
        TextView text=(TextView)findViewById(R.id.textView);
        EditText date=(EditText)findViewById(R.id.editText);
        Double num1=Double.parseDouble(date.getText().toString());
        TextView text2=(TextView)findViewById(R.id.textView2);
        EditText date2=(EditText)findViewById(R.id.editText2);
        String m1=" [ m ] ";
        String m2="[ pul ]";
        text2.setText(m1);
        date2.setText(m2);
        Double total1=num1*0.0254;
        String resul=String.valueOf(total1);
        text.setText(resul);
    }
    public void on5(View view){
        conv5();
    }
    public void conv6(){
        TextView text=(TextView)findViewById(R.id.textView);
        EditText date=(EditText)findViewById(R.id.editText);
        Double num1=Double.parseDouble(date.getText().toString());
        TextView text2=(TextView)findViewById(R.id.textView2);
        EditText date2=(EditText)findViewById(R.id.editText2);
        String m1="  [ m ]   ";
        String m2="[ milla ]";
        text2.setText(m1);
        date2.setText(m2);
        Double total1=num1*1609;
        String resul=String.valueOf(total1);
        text.setText(resul);
    }
    public void on6(View view){
        conv6();
    }
    public void conv7(){
        TextView text=(TextView)findViewById(R.id.textView);
        EditText date=(EditText)findViewById(R.id.editText);
        Double num1=Double.parseDouble(date.getText().toString());
        TextView text2=(TextView)findViewById(R.id.textView2);
        EditText date2=(EditText)findViewById(R.id.editText2);
        String m1="[ lb ] ";
        String m2="[ kg ]";
        text2.setText(m1);
        date2.setText(m2);
        Double total1=num1/0.454;
        String resul=String.valueOf(total1);
        text.setText(resul);
    }
    public void on7(View view){
        conv7();
    }
    public void conv8(){
        TextView text=(TextView)findViewById(R.id.textView);
        EditText date=(EditText)findViewById(R.id.editText);
        Double num1=Double.parseDouble(date.getText().toString());
        TextView text2=(TextView)findViewById(R.id.textView2);
        EditText date2=(EditText)findViewById(R.id.editText2);
        String m1="[ oz ]";
        String m2="[ kg ]";
        text2.setText(m1);
        date2.setText(m2);
        Double total1=num1/0.0238;
        String resul=String.valueOf(total1);
        text.setText(resul);
    }
    public void on8(View view){
        conv8();
    }
    public void conv9(){
        TextView text=(TextView)findViewById(R.id.textView);
        EditText date=(EditText)findViewById(R.id.editText);
        Double num1=Double.parseDouble(date.getText().toString());
        TextView text2=(TextView)findViewById(R.id.textView2);
        EditText date2=(EditText)findViewById(R.id.editText2);
        String m1="[ @ ] ";
        String m2="[ kg ]";
        text2.setText(m1);
        date2.setText(m2);
        Double total1=num1/11.339;
        String resul=String.valueOf(total1);
        text.setText(resul);
    }
    public void on9(View view){
        conv9();
    }
    public void conv10(){
        TextView text=(TextView)findViewById(R.id.textView);
        EditText date=(EditText)findViewById(R.id.editText);
        Double num1=Double.parseDouble(date.getText().toString());
        TextView text2=(TextView)findViewById(R.id.textView2);
        EditText date2=(EditText)findViewById(R.id.editText2);
        String m1="[ kg ]";
        String m2="[ lb ]";
        text2.setText(m1);
        date2.setText(m2);
        Double total1=num1*0.454;
        String resul=String.valueOf(total1);
        text.setText(resul);
    }
    public void on10(View view){
        conv10();
    }
    public void conv11(){
        TextView text=(TextView)findViewById(R.id.textView);
        EditText date=(EditText)findViewById(R.id.editText);
        Double num1=Double.parseDouble(date.getText().toString());
        TextView text2=(TextView)findViewById(R.id.textView2);
        EditText date2=(EditText)findViewById(R.id.editText2);
        String m1="[ kg ]";
        String m2="[ oz ]";
        text2.setText(m1);
        date2.setText(m2);
        Double total1=num1*0.0238;
        String resul=String.valueOf(total1);
        text.setText(resul);
    }
    public void on11(View view){
        conv11();
    }
    public void conv12(){
        TextView text=(TextView)findViewById(R.id.textView);
        EditText date=(EditText)findViewById(R.id.editText);
        Double num1=Double.parseDouble(date.getText().toString());
        TextView text2=(TextView)findViewById(R.id.textView2);
        EditText date2=(EditText)findViewById(R.id.editText2);
        String m1="[ kg ]";
        String m2="[ @ ] ";
        text2.setText(m1);
        date2.setText(m2);
        Double total1=num1*11.339;
        String resul=String.valueOf(total1);
        text.setText(resul);
    }
    public void on12(View view){
        conv12();
    }
    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.menu_main, menu);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        // Handle action bar item clicks here. The action bar will
        // automatically handle clicks on the Home/Up button, so long
        // as you specify a parent activity in AndroidManifest.xml.
        int id = item.getItemId();

        //noinspection SimplifiableIfStatement
        if (id == R.id.action_settings) {
            return true;
        }

        return super.onOptionsItemSelected(item);
    }
}
