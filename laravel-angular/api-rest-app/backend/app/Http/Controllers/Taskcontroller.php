<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Task;

class Taskcontroller extends Controller
{
    public function index(){
    	return Task::all();
    }
    public function show($id){
    	return Task::where('id',$id)->get();
    }
    public function show1($color){
    	return Task::where('color',$color)->get();
    }
    public function store(Request $request){
    	return Task::create($request->all());
    }
    public function update(Request $request, $id){
    	$task=Task::findOrFail($id);
    	$task->update($request->all());    	
    	return $task;
    }
    public function delete(Request $request, $id){
    	$task=Task::findOrFail($id);
    	$task->delete();
    	return 204;
    }
}
