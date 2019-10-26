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
				<form method="post" action="{{url('updaterow/'.$x->id)}}">
					@csrf
					<br><br>					
					<label for="name">NAME:</label>
					<input type="text" name="name" id="name" value="{{$x->names}}" class="form-control">
					<label for="last">LASTNAME:</label>
					<input type="text" name="last" id="last" value="{{$x->lastnames}}" class="form-control">
					<label for="email">E-MAIL:</label>
					<input type="text" name="email" id="email" value="{{$x->emails}}" class="form-control"><br>
					<input type="submit" value="Save" class="btn btn-info">
				</form>						
				@endforeach
			</div>
		</div>				
	</div>


	<script src="{{asset('js/bootstrap.min.js')}}"></script>
</body>
</html>