<!DOCTYPE html>
<html>
<head>
	<title>FORM</title>
	<meta charset="utf-8">
	<link rel="stylesheet" href="{{asset('css/bootstrap.min.css')}}" >
</head>
<body>
	<div class="container">
		<h1>Form-1 (main)</h1>
		<a href="{{url('agregar')}}" class="btn btn-primary btn-lg" role="button">FORM 1</a>
		<a href="{{url('agregar2')}}" class="btn btn-primary btn-lg" role="button">FORM 2</a>
		<div class="row">
			<div class="col-md-6 offset-md-3">
				<form method="post" action="{{url('guardar')}}">
					@csrf
					<br><br>
					<label for="name">NAME:</label>
					<input type="text" name="name" id="name" class="form-control">
					<label for="last">LASTNAME:</label>
					<input type="text" name="last" id="last" class="form-control">
					<label for="email">E-MAIL:</label>
					<input type="text" name="email" id="email" class="form-control"><br>
					<input type="submit" value="Send" class="btn btn-info"> 

				</form>
			</div>
		</div>
		@if (session('alert'))
    		<div class="alert alert-success">
       	 		{{ session('alert') }}
    		</div>
		@endif
		<br>
		<a href="{{url('records')}}" class="btn btn-secondary" role="button">Show Records</a>


	</div>


	<script src="{{asset('js/bootstrap.min.js')}}"> </script>
</body>
</html>