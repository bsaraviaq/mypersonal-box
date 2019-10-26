import { Component,OnInit, SelfDecorator } from '@angular/core';
import {Fun1Service} from './fun1.service';
import {Task} from './task';



@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css'],
  providers: [Fun1Service]
})
export class AppComponent {
  tasks:Task[];
  task = new Task();
  httpdata;
  data_id;
  data_color;
  errorMessage:String;
  flag0:boolean;
  taskEdit=new Task();
  
    
  constructor(private fun1Service:Fun1Service){}
  
  //------Get All Table 
  ngOnInit(){
    this.fun1Service.getTask()    
    //.subscribe(tasks=>console.log(tasks));
    .subscribe(tasks=>(this.httpdata=tasks));      
  }

  //------Get by Id
  getOneTask(_id:number):void{    
    this.fun1Service.getOne(_id)
    .subscribe(tasks=>(this.data_id=tasks));
  }
  
  //------Send a record
  postOneTask():void{  
    if(this.task.total==null){
      this.task.total=0;   // for EMPTY inputs      
    }   
    if(this.task.name==null){
      this.flag0=true;
      return;
    }
    this.fun1Service.postOne(this.task)
    .subscribe(task=>{
      console.log(task);
      this.reset();
    },
    error=>this.errorMessage=<any>error);
  }

  private reset() {
    this.task.name=null;
    this.task.color=null;
    this.task.total=null;
    this.flag0=false;
  }

  //------Update and Delete records
  //-------------Get All by Color
  getOneTask1(color:string):void{    
    this.fun1Service.getOne1(color)
    .subscribe(tasks=>(this.data_color=tasks));
    
  }
  //-------------Delete a Record
  deleteOneTask(task:Task):void{
    this.data_color=this.data_color.filter(x=>x!=task)
    this.fun1Service.deleteOne(task.id)
    .subscribe();
  }
  //-------------Update a Record
  enableUpdate(task:Task):void{
    this.taskEdit=task;
  }
  updateOneTask():void{
    if(this.taskEdit){   //verify if there is a change
      this.fun1Service.updateOne(this.taskEdit)
      .subscribe();
    }
    this.taskEdit=undefined;
    
  }

}
