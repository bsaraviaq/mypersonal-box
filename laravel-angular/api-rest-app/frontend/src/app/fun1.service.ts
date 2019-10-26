import { Injectable } from '@angular/core';
import {HttpClient} from '@angular/common/http';

import {Observable} from 'rxjs';
import {Task} from './task';

@Injectable({
  providedIn: 'root'
})
export class Fun1Service {  
  url:string="http://localhost:8000/api/";
  constructor(private http:HttpClient) { }
  //-----Get All Service
  getTask():Observable<Task[]>{    
    return this.http
    .get<Task[]>(this.url+'task/')
  }
  //-----Get by Id Service
  getOne(_id:number):Observable<Task[]>{
    return this.http
    .get<Task[]>(this.url+'task/'+_id)
  }
  //-----Get by Color Service
  getOne1(color:string):Observable<Task[]>{
    return this.http
    .get<Task[]>(this.url+'task1/'+color)
  }
  //----Send a record Service
  postOne(task:Task):Observable<Task>{
    return this.http
    .post<Task>(this.url+'task',task);
  }
  //---Update a record Service
  updateOne(task:Task){
    return this.http
    .put<Task>(this.url+'task/'+task.id,task);
  }
  //---Delete a Record Service
  deleteOne(id:number):Observable<{}>{
    return this.http
    .delete(this.url+'task/'+id);
  }


}
