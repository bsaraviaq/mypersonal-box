<!DOCTYPE html>
<html>
<head>
	<title>EDIT</title>
	<meta charset="utf-8">
	<link rel="stylesheet" href="{{asset('css/bootstrap.min.css')}}">
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-6 offset-md-3">
				@foreach($answer as $x)
				<form method="post" action="{{url('updaterow2/'.$x->id_user)}}">
					@csrf
					<br><br>
					<label for="city">CITY:</label>
					<input type="text" name="city" id="city" value="{{$x->city}}" class="form-control">
					<label for="address">ADDRESS:</label>
					<input type="text" name="address" id="address" value="{{$x->address}}" class="form-control">
					<label for="phone_number">PHONE NUMBER:</label>
					<input type="text" name="phone_number" id="phone_nuber" value="{{$x->phone_number}}" class="form-control"><br>
					<input type="submit" value="Save" class="btn btn-info"> 
				</form>						
				@endforeach
			</div>
		</div>				
	</div>


	<script src="{{asset('js/bootstrap.min.js')}}"></script>
</body>
</html>