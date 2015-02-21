$(document).ready(function(){
	var domain = $("#domain_addon").text();
	$("#new_email").validate({
	 	rules: {
			"email[quota]": { required: true, digits: true, range: [1, 99] },
	 		"email[password]": { required: true, minlength: 8 },
	 		"email[confirmation_password]": { required: true, minlength: 8, equalTo: "#email_password" },
	 		"email[username]": {
				required: true, maxlength: 40,
				emailUsername: true,
				remote: {
					url: "/check_email",
					data: { domain: domain }
				}
			}
	 	},
		messages: {
			"email[username]": {
				remote: "Email username isn't available."
			}
		}
	});
	
	jQuery.validator.addMethod("emailUsername", function(value, element) {
	  return this.optional(element) || /^[a-zA-Z0-9]+([_\.\-]?[a-zA-Z0-9]+)*$/.test(value);
	}, "Please use only alphanumeric characters.");
});
