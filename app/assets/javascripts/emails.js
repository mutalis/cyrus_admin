$(document).ready(function(){
	$("#new_email").validate({
	 	rules: {
	 		"email[username]": { required: true, maxlength: 40 },
	 		"email[quota]": { required: true, digits: true, range: [1, 99] },
	 		"email[password]": { required: true, minlength: 8 },
	 		"email[confirmation_password]": { required: true, minlength: 8, equalTo: "#email_password" }
	 	}
	});
});
