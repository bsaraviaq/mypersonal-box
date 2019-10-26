<!DOCTYPE html>
<html>
<head>
	<title>Record</title>
	<meta charset="utf-8">
	<link rel="stylesheet" href="{{asset('css/bootstrap.min.css')}}">
</head>
<body>
	<h1>RECORDS 2</h1>
	<a href="{{url('records')}}" class="btn btn-primary btn-lg" role="button">RECORDS 1</a>
		<a href="{{url('records2')}}" class="btn btn-primary btn-lg" role="button">RECORDS 2</a><br><br>
	<div class="col-md-6 offset-md-1">
	<form method="get" action="{{url('records2')}}">
		<label for="sname">Search by city</label><br>
		<input type="text" name="sname" id="sname" >
		<input type="submit" value="Search" class="btn btn-info">
	</form>	
	<table class="table table-sm table-hover">
		<tbody>
			@foreach ($answer as $x)
			@if($x->city===$answer1)
				<tr>
					<th scope="row">{{$x->id_user}}</th>
					<td>{{$x->id_user}}</td>
					<td>{{$x->city}}</td>
					<td>{{$x->address}}</td>	
					<td>{{$x->phone_number}}</td>					
				</tr>
			@endif	
			@endforeach		
		</tbody>
	</table>




	<table class="table table-sm table-hover">
		<thead>
			<tr>
				<th scope="col">ID USER</th>
				<th scope="col">CITY</th>
				<th scope="col">ADDRESS</th>
				<th scope="col">PHONE NUMBER</th>
				<th scope="col">UPDATE</th>

			</tr>
		</thead>
		<tbody>
			@foreach ($answer as $x)
				<tr>
					<th scope="row">{{$x->id_user}}</th>
					<td>{{$x->city}}</td>
					<td>{{$x->address}}</td>	
					<td>{{$x->phone_number}}</td>
					<td><a href="{{url('editrow2/'.$x->id_user)}}">Edit</a></td>
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
	<a href="{{url('agregar2')}}" class="btn btn-primary offset-md-1">-Back-</a>

	<script src="{{asset('js/bootstrap.min.js')}}"></script>
</body>
</html>