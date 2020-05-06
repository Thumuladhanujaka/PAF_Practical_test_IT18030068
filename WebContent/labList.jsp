<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="UTF-8">
	<title>Health Care System</title>
	
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="assets/js/croppie.js"></script>
    <link rel="stylesheet" href="assets/css/croppie.css" />

    <link href="assets/css/bootstrap.min.css" rel="stylesheet">
    <script src="assets/js/sweetalert.min.js"></script>
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.0/jquery.validate.js"></script>
	 
    
    <style>

        .elementz {
            border:none;
            background-image:none;
            background-color:transparent;
            -webkit-box-shadow: none;
            -moz-box-shadow: none;
            box-shadow: none;
            outline: none;
            -webkit-appearance: none;
            color: #000;
        }

        /* The Modal (background) */
        .modal {
            display: none; /* Hidden by default */
            position: fixed; /* Stay in place */
            z-index: 1; /* Sit on top */
            padding-top: 100px; /* Location of the box */
            left: 0;
            top: 0;
            width: 100%; /* Full height */
            overflow: auto; /* Enable scroll if needed */
            background-color: rgb(0, 0, 0); /* Fallback color */
            background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
        }

        /* Modal Content */
        .modal-content1 {
            background-color: #fefefe;
            margin: auto;
            width: 40%;
            height: 80%;
            overflow-y: scroll;
            padding: 20px;
            border: 1px solid #888;
        }

        /* The Close Button */
        .close1 {
            color: #aaaaaa;
            float: right;
            margin-left: 95%;
            font-size: 28px;
            font-weight: bold;
        }

        .close1:hover,
        .close1:focus {
            color: #000;
            text-decoration: none;
            cursor: pointer;
        }

        .btn-file {
            position: relative;
            overflow: hidden;
        }
        .btn-file input[type=file] {
            position: absolute;
            top: 0;
            right: 0;
            min-width: 100%;
            min-height: 100%;
            font-size: 100px;
            text-align: right;
            filter: alpha(opacity=0);
            opacity: 0;
            outline: none;
            background: white;
            cursor: inherit;
            display: block;
        }

        #img-upload{
            width: 100%;
        }

        .my-error-class {
            color: red;
        }

        .my-valid-class {
            color: green;
        }
    </style>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
    	<div class="container">
	        <a class="navbar-brand" href="profileServlet">Health Care System</a>
	        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
	            <span class="navbar-toggler-icon"></span>
	        </button>
	
	        <div class="collapse navbar-collapse" id="navbarSupportedContent">
	            <ul class="navbar-nav ml-auto">
	                <li class="nav-item">
	                    <a class="nav-link" href="logoutServlet">Logout</a>
	                </li>
	            </ul>
	
	        </div>
        </div>
	</nav>
    <div class="container">
		
<br>
<p></p>
		<main class="login-form">
	        <div class="row justify-content-center">
	            <div class="col-md-10">
	                <div class="card">
	                	<div class="card-header">Add Lab Test</div>
	                    <div class="card-body">
	                        <form id="appointments">
	                            <div class="form-group row">
	                                <label for="email_address" class="col-md-4 col-form-label text-md-right">Patient Name</label>
	                                <div class="col-md-6">
	                                    <input type="text" id="name1" class="form-control" name="name1">
	                                </div>
	                            </div>
	                            
	                            <div class="form-group row">
	                                <label for="email_address" class="col-md-4 col-form-label text-md-right">Patient age</label>
	                                <div class="col-md-6">
	                                    <input type="number" id="age1" class="form-control" name="age1">
	                                </div>
	                            </div>
	                            
	                            <div class="form-group row">
	                                <label for="email_address" class="col-md-4 col-form-label text-md-right">Patient Gender</label>
	                                <div class="col-md-6">
	                                    <select name="gender1" class="form-control" id="gender1">
	                                		<option value="">Select</option>
	                                		<option value="Male">Male</option>
	                                		<option value="Female">Female</option>
	                                	</select>
	                                </div>
	                            </div>
	                            
	                            <div class="form-group row">
	                                <label for="email_address" class="col-md-4 col-form-label text-md-right">Date</label>
	                                <div class="col-md-6">
	                                    <input type="date" id="date1" class="form-control" name="date1">
	                                </div>
	                            </div>
	                            
	                            <div class="form-group row">
	                                <label for="email_address" class="col-md-4 col-form-label text-md-right">Test Name</label>
	                                <div class="col-md-6">
	                                    <input type="text" id="test_name1" class="form-control" name="test_name1">
	                                </div>
	                            </div>
	                            
	                            <div class="col-md-6 offset-md-4">
	                                <button type="submit" class="btn btn-primary">
	                                    Add
	                                </button>
	                            </div>
	                    	</form>
	                    </div>
	                    <div class="card-header">Lab Test List</div>
	                    <div class="card-body">
	                        <div class="p-1" id="usersDiv">
	                    	
	            			</div>
	                    </div>
	                </div>
	            </div>
	        </div>
		</main>
	</div>

</body>
</html>
<div id="popupEdit" class="modal">
    <div class="modal-content1" style="height: 70%">
        <span class="close">&times;</span>
        <br>
        <div class="col-md-12">
            <form  id="editForm">
                <input type="hidden" id="edit_id">
                <div class="form-group">
                    <label for="Email">Patient Name</label>
                    <input type="text" id="e_name" class="form-control" name="e_name">
                </div>
                <div class="form-group">
                    <label for="Email">Patient Age</label>
                    <input type="number" id="age" class="form-control" name="age">
                </div>
                <div class="form-group">
                    <label for="Email">Patient Gender</label>
                    <select name="gender" class="form-control" id="gender">
                   		<option value="">Select</option>
                   		<option value="Male">Male</option>
                   		<option value="Female">Female</option>
                   	</select>
                </div>
                <div class="form-group">
                    <label for="Email">Date</label>
                    <input type="date" id="date" class="form-control" name="date">
                </div>
                <div class="form-group">
                    <label for="Email">Test Name</label>
                   	<input type="text" id="test_name" class="form-control" name="test_name">
                </div>
                <input type="submit" value="Submit" class="btn btn-primary">
            </form>
        </div>
    </div>
</div>

<script>

$(document).ready(function () {

    $("#appointments").validate({
        errorClass: "my-error-class",
        validClass: "my-valid-class",
        rules: {
        	name1: "required",
        	test_name1: "required",
            gender1: "required",
            age1: {
                number: true,
                required: true
            },
        	date1: "required"
        },
        messages: {
        	name1: "Patient Name Required!",
        	gender1: "Gender Required!",
        	age1: {
                number: "only numbers!",
                required: "Age Required!"
            },
        	date1: "Date Required!",
        	test_name1: "Test Name Required!"
        },
        submitHandler: function () {
            var datas = JSON.stringify({
                "name" : $('#name1').val(),
                "gender" : $('#gender1').val(),
                "age" : $('#age1').val(),
                "date" : $('#date1').val(),
                "test_name" : $('#test_name1').val()
            });

            $.ajax({
                type: "POST",
                url: 'labs/app',
                dataType : 'json',
				contentType : 'application/json',
				data: datas,
                success: function(data){
                	if(data['success']=="1"){
						swal("Success!", "Added Successfull!", "success");
                        $("#appointments")[0].reset();
						reload();
					}
                },
                failure: function(errMsg) {
                	swal({
			            title: "Error",
			            text: "Connection Error!",
			            icon: "warning",
			            dangerMode: true,
			        });
                }
            });
        }
    });

    $("#appointments").submit(function(e) {
        e.preventDefault();
    });

});

</script>
<script>

    var popupEdit = document.getElementById("popupEdit");

    var span = document.getElementsByClassName("close")[0];

    span.onclick = function () {
        popupEdit.style.display = "none";
    }
    
    function deletes(id) {

    	$.ajax({
            type: "DELETE",
            url: "labs/app",
            data: JSON.stringify({ 'id' : id}),
            dataType: "json",
			contentType : 'application/json',
            success: function(data){
            	if(data['success']=="1"){
					swal("Success!", "Delete Successfull!", "success");
					reload();
				}else if(data['success']=="0"){
					swal({
			            title: "Error",
			            text: "Delete Unsuccessful!",
			            icon: "warning",
			            dangerMode: true,
			        });
				}
            },
            failure: function(errMsg) {
                alert('Error');
            }
        });

        
    }

    $(document).ready(function () {

        $("#editForm").validate({
            errorClass: "my-error-class",
            validClass: "my-valid-class",
            rules: {
            	e_name: "required",
                gender: "required",
                age: {
                    number: true,
                    required: true
                },
            	date: "required",
            	test_name: "required"
            },
            messages: {
            	e_name: "Patient Name Required!",
            	gender: "Gender Required!",
            	age: {
                    number: "only numbers!",
                    required: "Age Required!"
                },
            	date: "Date Required!",
            	test_name: "Test Name Required!"
            },
            submitHandler: function () {
                var datas = JSON.stringify({
                    "id" : $('#edit_id').val(),
                    "name" : $('#e_name').val(),
                    "gender" : $('#gender').val(),
                    "age" : $('#age').val(),
                    "date" : $('#date').val(),
                    "test_name" : $('#test_name').val()
                });

                $.ajax({
                    type: "PUT",
                    url: 'labs/app',
                    dataType : 'json',
    				contentType : 'application/json',
    				data: datas,
                    success: function(data){
                    	if(data['success']=="1"){
    						swal("Success!", "Edit Successfull!", "success");
                            $("#editForm")[0].reset();
    						popupEdit.style.display = "none";
    						reload();
    					}else if(data['success']=="0"){
    						swal({
    				            title: "Error",
    				            text: "Something is wrog!!",
    				            icon: "warning",
    				            dangerMode: true,
    				        });
    						$('#name').val("");
    					}
                    },
                    failure: function(errMsg) {
                    	swal({
    			            title: "Error",
    			            text: "Connection Error!",
    			            icon: "warning",
    			            dangerMode: true,
    			        });
                    }
                });
            }
        });

        $("#editForm").submit(function(e) {
            e.preventDefault();
        });

    });

    
    
    
    
    function reload(){
    	$.ajax({
            type: "GET",
            url: "labs/app",
            success: function(data){
            	$("#usersDiv").html(data);
            },
            failure: function(errMsg) {
                alert('Error');
            }
        });
    }

    reload();
    
    
    
    
    
    
    
    
    
    
    
    
    
    function edit(id) {

    	$.ajax({
            type: "POST",
            url: "labs/app/get",
            data: JSON.stringify({ 'id' : id}),
            dataType: "json",
			contentType : 'application/json',
            success: function(data){
                $(e_name).val(data['name']),
                $(gender).val(data['gender']),
                $(age).val(data['age']),
                $(date).val(data['date']),
                $(edit_id).val(data['id']),
                $(test_name).val(data['test_name']),
                popupEdit.style.display = "block";
            },
            failure: function(errMsg) {
                alert('Error');
            }
        });

        
    }
    
    
</script>