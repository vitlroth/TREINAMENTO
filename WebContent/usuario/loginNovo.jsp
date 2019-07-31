<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login novo</title>

<link href="login.css" rel="stylesheet" />  

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" ></script>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" ></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
 

 <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
 
 <script async defer src="https://connect.facebook.net/en_US/sdk.js#xfbml=1&version=v3.3"></script>

<!-- <link href="resources4.3.1/css/bootstrap.css"  rel="stylesheet"  />
<link href="resources4.3.1/css/bootstrap.min.css"  rel="stylesheet"  />

<link href="resources4.3.1/js/bootstrap.js"  rel="stylesheet"  />
<link href="resources4.3.1/js/bootstrap.min.js"  rel="stylesheet"  />
<link href="resources4.3.1/js/bootstrap.bundle.js"  rel="stylesheet"  />
<link href="resources4.3.1/js/bootstrap.bundle.min.js"  rel="stylesheet"  /> -->

  

</head>
<body>
<!-- This snippet uses Font Awesome 5 Free as a dependency. You can download it at fontawesome.io! -->
<body>
  <div class="container">
    <div class="row">
      <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
        <div class="card card-signin my-5">
          <div class="card-body">
            <h5 class="card-title text-center">Sign In</h5>
            <form class="form-signin">
              <div class="form-label-group">
                <input type="email" id="inputEmail" class="form-control" placeholder="Email address" required autofocus>
                <label for="inputEmail">Email address</label>
              </div>
              <div class="form-label-group">
                <input type="password" id="inputPassword" class="form-control" placeholder="Password" required>
                <label for="inputPassword">Password</label>
              </div>

              <div class="custom-control custom-checkbox mb-3">
                <input type="checkbox" class="custom-control-input" id="customCheck1">
                <label class="custom-control-label" for="customCheck1">Remember password</label>
              </div>
              <button class="btn btn-lg btn-primary btn-block text-uppercase" type="submit">Sign in</button>
              <hr class="my-4">
              <button class="btn btn-lg btn-google btn-block text-uppercase" type="submit"><i class="fab fa-google mr-2"></i> Sign in with Google</button>
              <button class="btn btn-lg btn-facebook btn-block text-uppercase" type="submit"><i class="fab fa-facebook-f mr-2"></i> Sign in with Facebook</button>
              
              <div id="fb-root">

              </div>

              
              <div class="fb-login-button" data-width="" data-size="large" data-button-type="login_with" data-auto-logout-link="false" data-use-continue-as="false">
              
              

              
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
</body>
</html>