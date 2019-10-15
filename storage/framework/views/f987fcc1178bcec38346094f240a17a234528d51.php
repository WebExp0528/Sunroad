<!DOCTYPE html>
<!--[if lt IE 7 ]><html class="ie ie6" lang="en"> <![endif]-->
<!--[if IE 7 ]><html class="ie ie7" lang="en"> <![endif]-->
<!--[if IE 8 ]><html class="ie ie8" lang="en"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!--><html lang="en"> <!--<![endif]-->
<head>

<meta charset="utf-8">
<title>Sun Road || Registration</title>

<meta name="description" content="">
<meta name="author" content="">
    
<meta name="keywords" content="">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

<!-- Roads v1.0 || ex nihilo || September 2013 -->

<!-- style -->
<!-- <link rel="stylesheet" type="text/css" media="all" href="css/style.css"> -->
<link rel="stylesheet" type="text/css" media="all" href="<?php echo e(url('themes/default/assets/registration/css/style.css')); ?>">
<!-- style end -->

<!-- the grid -->
<link rel="stylesheet" type="text/css" media="all" href="<?php echo e(url('themes/default/assets/registration/css/skeleton.css')); ?>">
<link rel="stylesheet" type="text/css" media="all" href="<?php echo e(url('themes/default/assets/registration/css/media.css')); ?>">

<!-- the grid end -->

<!--[if lt IE 9]>
<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
<![endif]-->

<!--[if lt IE 9]>
<link rel="stylesheet" type="text/css" media="all" href="css/IE.css">
<![endif]-->


</head>
<body>

<!-- site loader -->
<div class="loader"></div>
<!-- site loader end -->


<!-- page -->
<div class="page">

<!-- upper page -->
<div id="read-less" class="upper-page">

<!-- page section -->
<div class="page-section">
<!-- container -->
<div class="container">
  <div class="row registration">
      <form method="POST" id="registration_form" class="signup-form col-md-4 mx-auto">
      <?php echo csrf_field(); ?>

        
        <div class="row">
            <div class="col-md-12">
                <fieldset class="form-group required ">
                  <label class="lbl" for="email">Email</label> 
                  <input class="form-control" id="email" placeholder="Email" name="email" type="text">
                </fieldset>
            </div>
        </div>

        <div class="row">
          <div class="col-md-12">
            <fieldset class="form-group required ">
              <label class="lbl" for="username">Name</label> 
              <input class="form-control" id="name" placeholder="Name" name="name" type="text">
            </fieldset>
          </div>
        </div>

        <div class="row">
          <div class="col-md-12">
            <fieldset class="form-group required ">
              <label class="lbl" for="gender">Field</label> 
              <select class="form-control" id="field" name="field">
                <option selected="selected" value="">Select Field</option>
                <option value="Fine Art">Fine Art</option>
                <option value="Photography">Photography</option>
                <option value="Music">Music</option>
                <option value="Design">Design</option>
                <option value="Graphic Art">Graphic Art</option>
                <option value="Architecture">Architecture</option>
                <option value="Writer">Writer</option>
                <option value="Video">Video</option>
                <option value="Woodworker">Woodworker</option>
                <option value="Light Design">Light Design</option>
                <option value="Sculptor">Sculptor</option>
                <option value="Pottery">Pottery</option>
                <option value="Other">Other</option>
              </select>
            </fieldset>
          </div>
        </div>
        <button type="button" id="btn_registration" class="btn btn-success btn-submit">Submit</button>
      </form>
  </div>

</div>
<!-- container end -->
</div>
<!-- page section -->

</div>
<!-- upper page end -->

</div>
<!-- page end -->
<!-- scripts -->
<script type="text/javascript" src="<?php echo e(url('themes/default/assets/registration/js/jquery-1.10.2.min.js')); ?>"></script>
<script type="text/javascript" src="<?php echo e(url('themes/default/assets/registration/js/scripts.js')); ?>"></script>
<script type="text/javascript" src="<?php echo e(url('themes/default/assets/registration/js/jquery-ui.min.js')); ?>"></script>
<script type="text/javascript" src="<?php echo e(url('themes/default/assets/registration/js/jquery.iconmenu.js')); ?>"></script>
<script type="text/javascript" src="<?php echo e(url('themes/default/assets/registration/js/supersized.3.2.7.min.js')); ?>"></script>
<script type="text/javascript" src="<?php echo e(url('themes/default/assets/registration/js/supersized.3.2.7.bg.js')); ?>"></script>
<script type="text/javascript" src="theme/supersized.shutter.min.js"></script>
<script type="text/javascript" src="<?php echo e(url('themes/default/assets/registration/js/jquery.easing.1.3.min.js')); ?>"></script>
<script type="text/javascript" src="<?php echo e(url('themes/default/assets/registration/js/subscription-form.js')); ?>"></script>
<script type="text/javascript" src="<?php echo e(url('themes/default/assets/registration/js/roads.js')); ?>"></script>
<script type="text/javascript" src="<?php echo e(url('themes/default/assets/registration/js/jquery.flexslider.js')); ?>"></script>
<script type="text/javascript" src="<?php echo e(url('themes/default/assets/registration/js/countdown.js')); ?>"></script>
<script type="text/javascript" src="<?php echo e(url('themes/default/assets/registration/js/jquery.maskedinput.min.js')); ?>"></script>
<!-- scripts end -->
<script>

  $(document).ready(function(){

    $("#btn_registration").click(function(){
      var token = $('input[name=_token]').val();
      var registration_url = "<?php echo e(url('registration')); ?>";
      $.ajax({
        url: registration_url,
        type: "POST",
        data: {
          _token : token,
          email : $("#email").val(),
          name : $("#name").val(),
          field : $("#field").val()
        },
        dataType: "JSON",
        success: function(res){
          console.log(res);
          alert("Thank you for joining Sun Road, the artist directory. We will be in touch with you when the full website and Android versions are released");
        },
        error: function(error) {

        }
      })
    });
  });

</script>


</body>
</html>