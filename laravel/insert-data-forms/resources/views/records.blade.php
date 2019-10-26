<!DOCTYPE html>
<html>
<head>
	<title>Record</title>
	<meta charset="utf-8">
	<link rel="stylesheet" href="{{asset('css/bootstrap.min.css')}}">
</head>
<body>
	<h1>RECORDS 1 (main)</h1>
	<a href="{{url('records')}}" class="btn btn-primary btn-lg" role="button">RECORDS 1</a>
		<a href="{{url('records2')}}" class="btn btn-primary btn-lg" role="button">RECORDS 2</a><br><br>
	<div class="col-md-6 offset-md-1">
	<form method="get" action="{{url('records')}}">
		<label for="sname">Search by name</label><br>
		<input type="text" name="sname" id="sname" >
		<input type="submit" value="Search" class="btn btn-info">
	</form>	
	<table class="table table-sm table-hover">
		<tbody>
			@foreach ($answer as $x)
			@if($x->names===$answer1)
				<tr>
					<th scope="row">{{$x->id}}</th>
					<td>{{$x->names}}</td>
					<td>{{$x->lastnames}}</td>
					<td>{{$x->emails}}</td>					
				</tr>
			@endif	
			@endforeach		
		</tbody>
	</table>




	<table class="table table-sm table-hover">
		<thead>
			<tr>
				<th scope="col">ID USER</th>
				<th scope="col">NAME</th>
				<th scope="col">LASTNAME</th>
				<th scope="col">EMAIL</th>
				<th scope="col">DELETE ROW</th>
				<th scope="col">UPDATE</th>

			</tr>
		</thead>
		<tbody>
			@foreach ($answer as $x)
				<tr>
					<th scope="row">{{$x->id}}</th>
					<td>{{$x->names}}</td>
					<td>{{$x->lastnames}}</td>
					<td>{{$x->emails}}</td>
					<td><a href="{{url('deleterow/'.$x->id)}}">Delete</a></td>
					<td><a href="{{url('editrow/'.$x->id)}}">Edit</a></td>
				</tr>
			@endforeach
		</tbody>
	</table>
	</div>
	@if (session('alert'))
    	<div class="alert alert-success">
       	 	{{ session('alert') }}
    	</div>
	@endif
	<a href="{{url('agregar')}}" class="btn btn-primary offset-md-1">-Back-</a>

	<script src="{{asset('js/bootstrap.min.js')}}"></script>
</body>
</html>