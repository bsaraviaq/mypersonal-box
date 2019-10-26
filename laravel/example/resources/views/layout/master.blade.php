<!DOCTYPE html>
  <html>
    <head>
        <title>@yield('Master')</title>
      <!--Import Google Icon Font-->
      <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
      <!--Import materialize.css-->
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">

      <!--Let browser know website is optimized for mobile-->
      <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    </head>

    <body>
        @section('cabecera')
            <h1>Cabecera</h1>
        @show
        <div class="container">
          <div class="row">
              <div class="col l3">
                @yield('columna1')
              </div>
              <div class="col l3">
                @yield('columna2')
              </div>
              <div class="col l3">
                @yield('columna3')
              </div>
              <div class="col l3">
                @yield('columna4')
              </div>            
          </div>

        </div>    
          @section('pie')
            <h1>Cabecera</h1>
          @show



        <!--JavaScript at end of body for optimized loading-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
        </script>
    </body>
  </html>