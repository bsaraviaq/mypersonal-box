<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\RedirectResponse;

class SystemController extends Controller
{
    //[[[[[[[[---FORM 1---]]]]]]]]
    //**************************
    //  go form1
    //**************************
    public function formulario(){
    	return view('formulario')
    	->with('alert','');
    }
    //*************************
    //  insert data into the table 'register'
    //*************************
    public function guardar(Request $request){
    	$ans=DB::table('register')->insert(array('names'=>$request->input('name'),'lastnames'=>$request->input('last'),'emails'=>$request->input('email')));
    	
    	if(!empty($ans)){
    		return redirect()->back()
    		->with('alert','Registerd Succesfull!!!'); 
    	}
    	else{
    		return redirect()->back()
    		->with('alert','Registerd Failed!!!'); 
    	}    	
    }
    //*******************************
    //  sending an array with the table's data
    //********************************
    public function showrecords(Request $request){
    	$ans=DB::table('register')->get();
    	$ans1=$request->input('sname');
        return view('records',['answer'=>$ans,'answer1'=>$ans1]);
    }
    //*************************************
    //  delete a row based on the -id-
    //*************************************

    public function deleterow($id){
        $ans=DB::table('register')->where('id',$id)->delete();
        DB::table('register2')->where('id_user',$id)->delete();
        return redirect('records')
        ->with('alert','Row Deleted!!!');

    }
    //**************************************
    //  send the row'data selected to the view
    //*************************************

    public function editrow($id){
        $ans=DB::table('register')->where('id',$id)->get();
        return view('formupdate',['answer'=>$ans]);
    }    
    //****************************************
    //  update the row selected
    //****************************************
    public function updaterow(Request $request,$id){
        DB::table('register')->where('id',$id)->update(['names'=>$request->input('name'),'lastnames'=>$request->input('last'),'emails'=>$request->input('email')]); 
              
        return redirect('records'); 
    }
    //[[[[[[[[---FORM2---]]]]]]]]
    //**************************
    //  go form2
    //**************************
    public function formulario2(){
        return view('formulario2')
        ->with('alert','');
    }
    //*************************
    //  insert data into the table 'register2'
    //*************************
    public function guardar2(Request $request){
        $ans=DB::table('register2')->insert(array('city'=>$request->input('city'),'address'=>$request->input('address'),'phone_number'=>$request->input('phone_number')));
        
        if(!empty($ans)){
            return redirect()->back()
            ->with('alert','Registerd Succesfull!!!'); 
        }
        else{
            return redirect()->back()
            ->with('alert','Registerd Failed!!!'); 
        }       
    }
    //*******************************
    //  sending an array with the table's data
    //********************************
    public function showrecords2(Request $request){
        $ans=DB::table('register2')->get();
        $ans1=$request->input('sname');
        return view('records2',['answer'=>$ans,'answer1'=>$ans1]);
    }
    //**************************************
    //  send the row'data selected to the view
    //*************************************

    public function editrow2($id){
        $ans=DB::table('register2')->where('id_user',$id)->get();
        return view('formupdate2',['answer'=>$ans]);
    }    
    //****************************************
    //  update the row selected
    //****************************************
    public function updaterow2(Request $request,$id){
        DB::table('register2')->where('id_user',$id)->update(['city'=>$request->input('city'),'address'=>$request->input('address'),'phone_number'=>$request->input('phone_number')]); 
                
        return redirect('records2'); 
    }    

   

}
