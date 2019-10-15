<template>
  <div class="panel panel-default">
    <div class="panel-heading no-bg panel-settings">
			<h3 class="panel-title">Contact</h3>
		</div>
    <div class="panel-body static-body px-4">
      <p class="static-para">
        Contact page description can be here
      </p>
      <div class="login-block static-pages">
        <div class="contact-form">
          <div class="special-heading-border">
            <div class="special-heading-inner-border">
            </div>
          </div>
        </div>

        <form method="POST" action="http://onsunroad.com/contact" class="socialite-form">
					<input type="hidden" name="_token" value="eteeIwvHkAA6L775rudisA0l6OFrWAhK9nVbIDqb">
						<fieldset>
							<div class="row">
								<div class="col-md-6 col-sm-12 col-xs-12 left-form">
									<div class="form-group required ">
										<label for="name" class="control-label">name</label>
										<input type="text" class="form-control" name="name" placeholder="Enter your name">
									</div>
								</div>
								<div class="col-md-6 col-sm-12 col-xs-12 right-form">
									<div class="form-group required ">
										<label for="email" class="control-label">E-mail address</label>
										<input type="email" class="form-control" name="email" placeholder="Enter genuine E-mail">
									</div>
								</div>

								<div class="col-md-12 col-sm-12 col-xs-12">
									<div class="form-group required ">
										<label for="subject" class="control-label">Subject</label>
										<input type="text" class="form-control" placeholder="Main subject line" name="subject">
									</div>
								</div>

								<div class="col-md-12 col-sm-12 col-xs-12">
									<div class="form-group required ">
										<label for="message" class="control-label">Message</label>
										<textarea class="form-control" rows="3" placeholder="Enter your message" name="message"></textarea>
									</div>
								</div>
							</div>
							<div class="form-group">
								<button type="submit" class="btn btn-success btn-submit">Submit</button>
							</div>
						</fieldset>
					</form>
				</div>
			</div>
  </div>
</template>
