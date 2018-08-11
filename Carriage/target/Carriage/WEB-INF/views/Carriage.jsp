<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>Carriage</title>
<style>
.username.ng-valid {
	background-color: lightgreen;
}

.username.ng-dirty.ng-invalid-required {
	background-color: red;
}

.username.ng-dirty.ng-invalid-minlength {
	background-color: yellow;
}

.email.ng-valid {
	background-color: lightgreen;
}

.email.ng-dirty.ng-invalid-required {
	background-color: red;
}

.email.ng-dirty.ng-invalid-email {
	background-color: yellow;
}
</style>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<link href="<c:url value='/static/css/app.css' />" rel="stylesheet"></link>

  <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="https://resources/demos/style.css">

  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  
</head>
<body ng-app="myApp" >
	<div class="generic-container" ng-controller="Controller as ctrl">
		<div class="panel panel-default">
			<div class="panel-login">
				<span class="lead"> </span>
				<button type="button" ng-click="ctrl.logout()" class="btn btn-link"	ng-show="buttonLogout">Log out</button>
				<button type="button" ng-click="ctrl.profile()" class="btn btn-link" ng-show="buttonLogout">{{ctrl.loginUser.email}}</button>

				<button type="button" ng-click="ctrl.login()" class="btn btn-link"	ng-show="buttonLogin">Log in</button>
			</div>
		</div>
		<div class="panel panel-default">
			<div class="panel-menu">
				<span class="lead"> </span>
				<button type="button" ng-click="ctrl.home()" class="btn btn-default btn-sm">Home</button>
				<button type="button" ng-click="ctrl.about()" class="btn btn-default btn-sm">Advert</button>

				<button type="button" ng-click="ctrl.newAdvertForm()" class="btn btn-default btn-sm" ng-show = "admin">New Advert {{ctrl.countNewAdvert}}</button>
				<button type="button" ng-click="ctrl.newUserForm()" class="btn btn-default btn-sm" ng-show = "admin">New User {{ctrl.countNewUser}}</button>
				<button type="button" ng-click="ctrl.about()" class="btn btn-default btn-sm" ng-show = "admin">Admin</button>
				
				<button type="button" ng-click="ctrl.youyOrder()" class="btn btn-default btn-sm" ng-show = "tenant">Your order</button>
				
				<button type="button" ng-click="ctrl.createAdvert()" class="btn btn-default btn-sm" ng-show = "landlord">Create advert</button>
				<button type="button" ng-click="ctrl.yourAdvert()" class="btn btn-default btn-sm" ng-show = "landlord">Your advert</button>
				<button type="button" ng-click="ctrl.orderAdvert()" class="btn btn-default btn-sm" ng-show = "landlord">Order</button>
				

			</div>
		</div>

		<div class="panel panel-default">
			<div class="panel-search">
				
			</div>
		</div>
		<div class="panel panel-default" ng-show="home">

			<div class="panel-heading">
				<span class="lead">Home </span>
			</div>
			<div class="formcontainer">
				<form ng-submit="ctrl.submit()" name="myForm" class="form-horizontal">
					<input type="hidden" ng-model="ctrl.advert[0]" />
					<div class="row">
						<div class="form-group col-md-12">
							<label class="col-md-2 control-lable" for="file">Name</label>
							<div class="col-md-7">
								<input type="text" ng-model="ctrl.user.username" name="uname" class="username form-control input-sm" placeholder="Enter your name" required ng-minlength="3" />
								<div class="has-error" ng-show="myForm.$dirty">
									<span ng-show="myForm.uname.$error.required">This is a required field</span> 
										<span ng-show="myForm.uname.$error.minlength">Minimum length required is 3</span> 
										<span ng-show="myForm.uname.$invalid">This field is invalid </span>
								</div>
							</div>
						</div>
					</div>


					<div class="row">
						<div class="form-group col-md-12">
							<label class="col-md-2 control-lable" for="file">Address</label>
							<div class="col-md-7">
								<input type="text" ng-model="ctrl.user.address"
									class="form-control input-sm"
									placeholder="Enter your Address. [This field is validation free]" />
							</div>
						</div>
					</div>

					<div class="row">
						<div class="form-group col-md-12">
							<label class="col-md-2 control-lable" for="file">Email</label>
							<div class="col-md-7">
								<input type="email" ng-model="ctrl.user.email" name="email"
									class="email form-control input-sm"
									placeholder="Enter your Email" required />
								<div class="has-error" ng-show="myForm.$dirty">
									<span ng-show="myForm.email.$error.required">This is a
										required field</span> <span ng-show="myForm.email.$invalid">This
										field is invalid </span>
								</div>
							</div>
						</div>
					</div>

					<div class="row">
						<div class="form-actions floatRight">
							<input type="submit" value="{{!ctrl.user.id ? 'Add' : 'Update'}}" class="btn btn-primary btn-sm" ng-disabled="myForm.$invalid">
							<button type="button" ng-click="ctrl.reset()" class="btn btn-warning btn-sm" ng-disabled="myForm.$pristine">Reset
								Form</button>
						</div>
					</div>
				</form>
			</div>
		</div>
		
		<div ng-repeat="a in ctrl.advert" ng-show="about" >
		<samp ng-if=" a[27] == 1">
			<div class="panel panel-default">
				<div class="panel-heading">
					<span class="lead" ng-bind="a[2]"></span>
						<span class="lead" ng-bind="a[4]"></span>
				</div>
				<div class="formcontainer" >
					<table border="1" width="80%">
						<tr>
							<td rowspan="10" width="40%">
								<span ng-repeat="p in ctrl.allPhoto" ng-if="p[1] == a[0]">
									 
									<img ng-src="{{p[2]}}"  width="100" height="100px" />
								</span>
							</td>
							<th width="40%">Year of issue</th>
							<td width="40%"><span ng-bind="a[5]"></span></td>
						</tr>
						<tr>
							<th>Miliage</th>
							<td><span ng-bind="a[7]"></span></td>
						</tr>
						<tr>
							<th>Seats</th>
							<td><span ng-bind="a[8]"></span></td>
						</tr>
	
						<tr>
							<th>Transmission</th>
							<td><span ng-bind="a[11]"></span></td>
						</tr>
	
						<tr>
							<th>Body</th>
							<td><span ng-bind="a[13]"></span></td>
						</tr>
	
						<tr>
							<th>Drive</th>
							<td><span ng-bind="a[15]"></span></td>
						</tr>
	
						<tr>
							<th>Engine</th>
							<td><span ng-bind="a[17]"></span></td>
						</tr>
	
						<tr>
							<th>Fuel</th>
							<td><span ng-bind="a[19]"></span></td>
						</tr>
	
						<tr>
							<th>Cena</th>
							<td><span ng-bind="a[24]"></span></td>
						</tr>
					</table>
						<input type="hidden" ng-model="a[0]" />
						<div class="row">
							<div class="form-actions floatRight">
								<button type="button" ng-click="ctrl.modelById(a[0])" class="btn btn-warning btn-lg btn-block" >Read more...</button>
							</div>
						</div>
				</div>
			</div>
		</span>
		</div>
		
		<div ng-repeat="a in ctrl.advert" ng-show="model" >
		<span ng-if="a[0] == modelById">
			<div class="panel panel-default">
				<div class="panel-heading">
					<span class="lead" ng-bind="a[2]"></span>
						<span class="lead" ng-bind="a[4]"></span>
				</div>
				<div class="formcontainer"  >
						<span ng-repeat="p in ctrl.allPhoto" ng-if="p[1] == a[0]">
							<img ng-src="{{p[2]}}" width="100" height="100px" />
						</span>
						<input type="hidden" ng-model="a[0]" />
	<!-- 	 
						<div class="row">
							<div class="form-group col-md-12">
								<label class="col-md-3 control-lable" for="file">Marka</label>
								<div class="col-md-7">
									<span ng-bind="a[2]"></span>
								</div>
							</div>
						</div>
	
	
						<div class="row">
							<div class="form-group col-md-12">
								<label class="col-md-2 control-lable" for="file">Model</label>
								<div class="col-md-7">
									<span ng-bind="a[4]"></span>
								</div>
							</div>
						</div>
	-->
						<div class="row">
							<div class="form-group col-md-12">
								<label class="col-md-2 control-lable" for="file">Year of issue</label>
								<div class="col-md-7">
									<span ng-bind="a[5]"></span>
								</div>
							</div>
						</div>
						
				 		<div class="row">
							<div class="form-group col-md-12">
								<label class="col-md-2 control-lable" for="file">Gov number</label>
								<div class="col-md-7">
									<span ng-bind="a[6]"></span>
								</div>
							</div>
						</div>
				
						<div class="row">
							<div class="form-group col-md-12">
								<label class="col-md-2 control-lable" for="file">Miliage</label>
								<div class="col-md-7">
									<span ng-bind="a[7]"></span>
								</div>
							</div>
						</div>
	
						<div class="row">
							<div class="form-group col-md-12">
								<label class="col-md-2 control-lable" for="file">Seats</label>
								<div class="col-md-7">
									<span ng-bind="a[8]"></span>
								</div>
							</div>
						</div>
	
						<div class="row">
							<div class="form-group col-md-12">
								<label class="col-md-2 control-lable" for="file">Location</label>
								<div class="col-md-7">
									<span ng-bind="a[9]"></span>
								</div>
							</div>
						</div>
	
						<div class="row">
							<div class="form-group col-md-12">
								<label class="col-md-2 control-lable" for="file">Transmission</label>
								<div class="col-md-7">
									<span ng-bind="a[11]"></span>
								</div>
							</div>
						</div>
	
						<div class="row">
							<div class="form-group col-md-12">
								<label class="col-md-2 control-lable" for="file">Body</label>
								<div class="col-md-7">
									<span ng-bind="a[13]"></span>
								</div>
							</div>
						</div>
	
						<div class="row">
							<div class="form-group col-md-12">
								<label class="col-md-2 control-lable" for="file">Drive</label>
								<div class="col-md-7">
									<span ng-bind="a[15]"></span>
								</div>
							</div>
						</div>
	
						<div class="row">
							<div class="form-group col-md-12">
								<label class="col-md-2 control-lable" for="file">Engine</label>
								<div class="col-md-7">
									<span ng-bind="a[17]"></span>
								</div>
							</div>
						</div>
	
						<div class="row">
							<div class="form-group col-md-12">
								<label class="col-md-2 control-lable" for="file">Fuel</label>
								<div class="col-md-7">
									<span ng-bind="a[19]"></span>
								</div>
							</div>
						</div>
	 
						<div class="row">
							<div class="form-group col-md-12">
								<label class="col-md-2 control-lable" for="file">Consumption</label>
								<div class="col-md-7">
									<span ng-bind="a[20]"></span>
								</div>
							</div>
						</div>
	
						<div class="row">
							<div class="form-group col-md-12">
								<label class="col-md-2 control-lable" for="file">Demage</label>
								<div class="col-md-7">
									<span ng-bind="a[21]"></span>
								</div>
							</div>
						</div>
	
						<div class="row">
							<div class="form-group col-md-12">
								<label class="col-md-2 control-lable" for="file">Accessory</label>
								<div class="col-md-7">
									<span ng-bind="a[22]"></span>
								</div>
							</div>
						</div>
	
						<div class="row">
							<div class="form-group col-md-12">
								<label class="col-md-2 control-lable" for="file">Insurance</label>
								<div class="col-md-7">
									<span ng-bind="a[23]"></span>
								</div>
							</div>
						</div>
	
						<div class="row">
							<div class="form-group col-md-12">
								<label class="col-md-2 control-lable" for="file">Cena</label>
								<div class="col-md-7">
									<span ng-bind="a[24]"></span>
								</div>
							</div>
						</div>
	 
						<div class="row">
							<div class="form-group col-md-12">
								<label class="col-md-2 control-lable" for="file">Text</label>
								<div class="col-md-7">
									<span ng-bind="a[25]"></span>
								</div>
							</div>
						</div>
	
						<div class="row">
							<div class="form-group col-md-12">
								<label class="col-md-2 control-lable" for="file">Date Registration</label>
								<div class="col-md-7">
									<span ng-bind="a[26]"></span>
								</div>
							</div>
						</div>
				</div>
			</div>
		</span>
		</div>
		
		
		<div class="panel panel-default" ng-show="about">
			<!-- Default panel contents -->
			<div class="panel-heading">
				<span class="lead">List of Users </span>
			</div>
			<div class="tablecontainer">
				<table class="table table-hover">
					<thead>
						<tr>
							<th>ID.</th>
							<th>Marka</th>
							<th>Model</th>
							<th>Year of issue</th>
							<th width="20%"></th>
						</tr>
					</thead>
					<tbody>
						<tr ng-repeat="a in ctrl.advert">
							<td><span ng-bind="a[0]"></span></td>
							<td><span ng-bind="a[2]"></span></td>
							<td><span ng-bind="a[4]"></span></td>
							<td><span ng-bind="a[5]"></span></td>
							<td>
								<button type="button" ng-click="ctrl.edit(u.id)"
									class="btn btn-success custom-width">Edit</button>
								<button type="button" ng-click="ctrl.remove(u.id)"
									class="btn btn-danger custom-width">Remove</button>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>

		<div class="panel panel-default" ng-show="login">

			<div class="panel-heading">
				<span class="lead">Log in Form </span>
			</div>
			<div class="formcontainer">
				<form name="loginForm" class="form-horizontal">
					<input type="hidden" ng-model="ctrl.user.id" />

					<div class="row">
						<div class="form-group col-md-12">
							<label class="col-md-2 control-lable" for="file">Email</label>
							<div class="col-md-7">
								<input type="email" ng-model="email" name="email"
									class="email form-control input-sm"
									placeholder="Enter your Email" required />
								<div class="has-error" ng-show="myForm.$dirty">

									<span ng-show="myForm.email.$invalid">This field is
										invalid </span>
								</div>
							</div>
						</div>
					</div>

					<div class="row">
						<div class="form-group col-md-12">
							<label class="col-md-2 control-lable" for="file">Pass</label>
							<div class="col-md-7">
								<input type="password" ng-model="pass" name="pass"
									class="username form-control input-sm"
									placeholder="Enter your pass" required ng-minlength="3" />
								<div class="has-error" ng-show="myForm.$dirty">

									<span ng-show="myForm.uname.$error.minlength">Minimum
										length required is 3</span> <span ng-show="myForm.uname.$invalid">This
										field is invalid </span>
								</div>
							</div>
						</div>
					</div>

					<div class="row">
						<div class="errorlogin">
							<span ng-show="errorLogin">login or password invalid </span>
							<span ng-show="errorActive">login is not active </span>

						</div>
					</div>

					<div class="row">
						<div class="form-actions floatRight">
							<!--  
                              <input type="submit"  value="{{!ctrl.user.id ? 'Add' : 'Update'}}" class="btn btn-primary btn-sm" ng-disabled="myForm.$invalid">
                              <button type="button" ng-click="ctrl.reset()" class="btn btn-warning btn-sm" ng-disabled="myForm.$pristine">Reset Form</button>
                              -->

							<button type="button" ng-click="ctrl.registration()"
								class="btn btn-primary">Registration</button>
							<button type="button" ng-click="ctrl.authorization(email,pass)"
								class="btn btn-warning ">Log in</button>

						</div>
					</div>
				</form>
			</div>
		</div>


		<div class="panel panel-default" ng-show="profileEdit">

			<div class="panel-heading">
				<span class="lead">Profil edit </span>
			</div>
			<div class="formcontainer">
				<form ng-submit="ctrl.submit()" name="myForm"
					class="form-horizontal">
					<input type="hidden" ng-model="ctrl.user.id" />

					<div class="row">
						<div class="form-group col-md-12">
							<label class="col-md-2 control-lable" for="file">Name</label>
							<div class="col-md-7">
								<input type="text" ng-model="ctrl.user.last_name"
									name="last_name" class="form-control input-sm"
									placeholder="Enter your Name" required />
							</div>
						</div>
					</div>
					<div class="row">
						<div class="form-group col-md-12">
							<label class="col-md-2 control-lable" for="file">First
								name</label>
							<div class="col-md-7">
								<input type="text" ng-model="ctrl.user.first_name"
									name="first_name" class="form-control input-sm"
									placeholder="Enter your First name" required />
							</div>
						</div>
					</div>
					<div class="row">
						<div class="form-group col-md-12">
							<label class="col-md-2 control-lable" for="file">Midle
								name</label>
							<div class="col-md-7">
								<input type="text" ng-model="ctrl.user.midle_name"
									name="midle_name" class="form-control input-sm"
									placeholder="Enter your Midle name" required />
							</div>
						</div>
					</div>
					<div class="row">
						<div class="form-group col-md-12">
							<label class="col-md-2 control-lable" for="file">Series
								passport</label>
							<div class="col-md-7">
								<input type="text" ng-model="ctrl.user.series_passport"
									name="series_passport" class="form-control input-sm"
									placeholder="Enter your Series passport" required />
							</div>
						</div>
					</div>
					<div class="row">
						<div class="form-group col-md-12">
							<label class="col-md-2 control-lable" for="file">Number
								passport</label>
							<div class="col-md-7">
								<input type="text" ng-model="ctrl.user.number_passport"
									name="number_passport" class="form-control input-sm"
									placeholder="Enter your number passport" required />
							</div>
						</div>
					</div>
					<div class="row">
						<div class="form-group col-md-12">
							<label class="col-md-2 control-lable" for="file">Issued
								by passport</label>
							<div class="col-md-7">
								<input type="text" ng-model="ctrl.user.issued_by_passport"
									name="issued_by_passport" class="form-control input-sm"
									placeholder="Enter your Issued by passport" required />
							</div>
						</div>
					</div>
					<div class="row">
						<div class="form-group col-md-12">
							<label class="col-md-2 control-lable" for="file">Issued
								passport</label>
							<div class="col-md-7">
							
							
							
							
								<input id="datepicker" type="date" placeholder="yy-MM-dd" ng-model="ctrl.user.issued_passport"	name="issued_passport" class="form-control input-sm"	placeholder="Enter your Issued passport" required />
							</div>
						</div>
					</div>
					<div class="row">
						<div class="form-group col-md-12">
							<label class="col-md-2 control-lable" for="file">Date birthday</label>
							<div class="col-md-7">
								<input id="datepicker" type="text" class="form-control input-sm" ng-model="ctrl.user.date_birthday | date: 'yyyy-MM-dd'"	name="date_birthday" placeholder="Enter your Date birthday" required />
							<!--  	<input type="text" ng-model="ctrl.user.date_birthday | date: 'yyyy-MM-dd'"	name="date_birthday" class="form-control input-sm"	placeholder="Enter your Date birthday" required />
								-->
							</div>
						</div>
					</div>
					<div class="row">
						<div class="form-group col-md-12">
							<label class="col-md-2 control-lable" for="file">Location
								birthday</label>
							<div class="col-md-7">
								<input type="text" ng-model="ctrl.user.location_birthday"	name="location_birthday" class="form-control input-sm"
									placeholder="Enter your location birthday" required />
							</div>
						</div>
					</div>
					<div class="row">
						<div class="form-group col-md-12">
							<label class="col-md-2 control-lable" for="file">Series
								license</label>
							<div class="col-md-7">
								<input type="text" ng-model="ctrl.user.series_license"
									name="series_license" class="form-control input-sm"
									placeholder="Enter your Series License" required />
							</div>
						</div>
					</div>
					<div class="row">
						<div class="form-group col-md-12">
							<label class="col-md-2 control-lable" for="file">Number
								license</label>
							<div class="col-md-7">
								<input type="text" ng-model="ctrl.user.number_license"
									name="number_license" class="form-control input-sm"
									placeholder="Enter your Number License" required />
							</div>
						</div>
					</div>
					<div class="row">
						<div class="form-group col-md-12">
							<label class="col-md-2 control-lable" for="file">Issued
								by license</label>
							<div class="col-md-7">
								<input type="text" ng-model="ctrl.user.issued_by_license"
									name="issued_by_license" class="form-control input-sm"
									placeholder="Enter your Issued by License" required />
							</div>
						</div>
					</div>
					<div class="row">
						<div class="form-group col-md-12">
							<label class="col-md-2 control-lable" for="file">Issued
								license</label>
							<div class="col-md-7">
								<input type="text" ng-model="ctrl.user.issued_license | date: 'yyyy-MM-dd'"
									name="issued_license" class="form-control input-sm"
									placeholder="Enter your Issued License" required />
							</div>
						</div>
					</div>
					<div class="row">
						<div class="form-group col-md-12">
							<label class="col-md-2 control-lable" for="file">Valid
								license</label>
							<div class="col-md-7">
								<input type="text" ng-model="ctrl.user.valid_license | date: 'yyyy-MM-dd'"
									name="valid_license" class="form-control input-sm"
									placeholder="Enter your Valid License" required />
							</div>
						</div>
					</div>
					<div class="row">
						<div class="form-group col-md-12">
							<label class="col-md-2 control-lable" for="file">Id	category</label>
							<div class="col-md-7">
								<select name="category" >
								
									<option value="{{c.id}}" ng-repeat="c in ctrl.category" ng-selected="ctrl.user.id_category == c.id">
										{{c.category}}
									</option>
								</select> 
							
							
								<input type="text" ng-model="ctrl.user.id_category"	name="id_category" class="form-control input-sm" placeholder="Enter your Id category" required />
							</div>
						</div>
					</div>
					<div class="row">
						<div class="form-group col-md-12">
							<label class="col-md-2 control-lable" for="file">Photo</label>
							<div class="col-md-7">
								<input type="text" ng-model="ctrl.user.photo" name="photo"
									class="form-control input-sm" />
							</div>
						</div>
					</div>
					<div class="row">
						<div class="form-group col-md-12">
							<label class="col-md-2 control-lable" for="file">Phone</label>
							<div class="col-md-7">
								<input type="text" ng-model="ctrl.user.phone" name="phone"
									class="form-control input-sm" placeholder="Enter your Phone"
									required />
							</div>
						</div>
					</div>

					<div class="row">
						<div class="form-group col-md-12">
							<label class="col-md-2 control-lable" for="file">Email</label>
							<div class="col-md-7">
								<input type="email" ng-model="ctrl.user.email" name="email"
									class="email form-control input-sm"
									placeholder="Enter your Email" required />
							</div>
						</div>
					</div>



					<div class="row">
						<div class="form-actions floatRight">

							<input type="submit" value="{{!ctrl.user.id ? 'Add' : 'Update'}}"
								class="btn btn-primary btn-sm" ng-disabled="myForm.$invalid">
							<button type="button" ng-click="ctrl.reset()"
								class="btn btn-warning btn-sm" ng-disabled="myForm.$pristine">Reset
								Form</button>


						</div>
					</div>
				</form>
			</div>
		</div>



		<div class="panel panel-default" ng-show="profile">
			<!-- Default panel contents -->
			<div class="panel-heading">
				<span class="lead">Profile of Users </span>
			</div>
			<div class="tablecontainer">
							
				<table border="1" class="table table-hover">

					<tr>
						<td rowspan="20" width=20%"">
						
							<img ng-src="{{ctrl.loginUser.photo}}" width="100" height="100"/>
						
							
							<input type="file" (change)="fileChange($event)" placeholder="Upload file" accept=".jpg">
							
						</td>
						<th>ID.</th>
						<td><span ng-bind="ctrl.loginUser.id"></span></td>
					</tr>
					<tr>
						<th>Name</th>
						<td><span ng-bind="ctrl.loginUser.last_name"></span></td>

					</tr>
					<tr>
						<th>First name</th>
						<td><span ng-bind="ctrl.loginUser.first_name"></span></td>
					</tr>
					<tr>
						<th>Midle name</th>
						<td><span ng-bind="ctrl.loginUser.midle_name"></span></td>
					</tr>
					<tr>
						<th>Series passport</th>
						<td><span ng-bind="ctrl.loginUser.series_passport"></span></td>
					</tr>
					<tr>
						<th>Number passport</th>
						<td><span ng-bind="ctrl.loginUser.number_passport"></span></td>
					</tr>
					<tr>
						<th>Issued by passport</th>
						<td><span ng-bind="ctrl.loginUser.issued_by_passport"></span></td>
					</tr>
					<tr>
						<th>Issurd passport</th>
						<td><span ng-bind="ctrl.loginUser.issued_passport | date: 'yyyy-MM-dd'"></span></td>
					</tr>
					<tr>
						<th>Date birthday</th>
						<td><span ng-bind="ctrl.loginUser.date_birthday | date: 'yyyy-MM-dd'"></span></td>
					</tr>
					<tr>
						<th>Location birthday</th>
						<td><span ng-bind="ctrl.loginUser.location_birthday"></span></td>
					</tr>
					<tr>
						<th>Series license</th>
						<td><span ng-bind="ctrl.loginUser.series_license"></span></td>
					</tr>
					<tr>
						<th>Number license</th>
						<td><span ng-bind="ctrl.loginUser.number_license"></span></td>
					</tr>
					<tr>
						<th>Issued by license</th>
						<td><span ng-bind="ctrl.loginUser.issued_by_license"></span></td>
					</tr>
					<tr>
						<th>Issued license</th>
						<td><span ng-bind="ctrl.loginUser.issued_license | date: 'yyyy-MM-dd'"></span></td>
					</tr>
					<tr>
						<th>Valid license</th>
						<td><span ng-bind="ctrl.loginUser.valid_license | date: 'yyyy-MM-dd'"></span></td>
					</tr>
					<tr>
						<th>Category</th>
						<td>
							<div ng-repeat="c in ctrl.category">					
								<div ng-if=" ctrl.loginUser.id_category == c.id">
	                           		 <span ng-bind="c.category"></span>
                        		</div>
							
		 					</div>
	 					</td>
					</tr>
					<tr>
						<th>Photo</th>
						<td><span ng-bind="ctrl.loginUser.photo"></span></td>
					</tr>
					<tr>
						<th>Phone</th>
						<td><span ng-bind="ctrl.loginUser.phone"></span></td>
					</tr>
					<tr>
						<th>Email</th>
						<td><span ng-bind="ctrl.loginUser.email"></span></td>
					</tr>
					<tr>
			
						<th width="20%"></th>
						<td width="20%">
							<button type="button" ng-click="ctrl.edit(ctrl.loginUser.id)" class="btn btn-success custom-width">Edit</button>
							<button type="button" ng-click="ctrl.remove(ctrl.loginUser.id)" class="btn btn-danger custom-width">Remove</button>
						</td>

					</tr>
					</tbody>
				</table>
			</div>
		</div>
		<div class="panel panel-default" ng-show="registration">

			<div class="panel-heading">
				<span class="lead">Registration user </span>
			</div>
			<div class="formcontainer">
				<form ng-submit="ctrl.submit()" name="myForm" class="form-horizontal">
					<input type="hidden" ng-model="ctrl.user.id" />
					<div class="row">
						<div class="form-group col-md-12">
							<label class="col-md-2 control-lable" for="file">You register as</label>
							<div class="col-md-7">
								
								<label> <input type="radio" name="id_role" ng-model="ctrl.user.id_role" value="2" required> Tenant </label>
								<label> <input type="radio" name="id_role" ng-model="ctrl.user.id_role" value="3" required> Landlord </label>
								
								<input type="hidden" ng-model="ctrl.user.id_role" name="id_role" class="form-control input-sm" placeholder="Enter your Name" required />
							</div>
						</div>
					</div>
					<div class="row">
						<div class="form-group col-md-12">
							<label class="col-md-2 control-lable" for="file">Name</label>
							<div class="col-md-7">
								<input type="text" ng-model="ctrl.user.last_name" name="last_name" class="form-control input-sm" placeholder="Enter your Name" required />
							</div>
						</div>
					</div>
					<div class="row">
						<div class="form-group col-md-12">
							<label class="col-md-2 control-lable" for="file">First 	name</label>
							<div class="col-md-7">
								<input type="text" ng-model="ctrl.user.first_name" name="first_name" class="form-control input-sm" placeholder="Enter your First name" required />
							</div>
						</div>
					</div>
					
					<div class="row">
						<div class="form-group col-md-12">
							<label class="col-md-2 control-lable" for="file">Series passport</label>
							<div class="col-md-7">
								<input type="text" ng-model="ctrl.user.series_passport" name="series_passport" placeholder="max: 3" ng-maxlength="3" class="form-control input-sm" placeholder="Enter your Series passport" required />
							</div>
						</div>
					</div>
					<div class="row">
						<div class="form-group col-md-12">
							<label class="col-md-2 control-lable" for="file">Number	passport</label>
							<div class="col-md-7">
								<input type="number"  placeholder="Min: 100000, max: 999999" min="100000" max="999999" ng-model="ctrl.user.number_passport"	name="number_passport"  class="form-control input-sm" placeholder="Enter your number passport" required  only-numbers/>
							</div>
						</div>
					</div>
					
					<div class="row">
						<div class="form-group col-md-12">
							<label class="col-md-2 control-lable" for="file">Email</label>
							<div class="col-md-7">
								<input type="email" ng-model="ctrl.user.email" name="email" class="email form-control input-sm" placeholder="Enter your Email" required />
							</div>
						</div>
					</div>

					<div class="row">
						<div class="form-actions floatRight">

							<input type="submit" value="Registration" class="btn btn-primary btn-sm" ng-disabled="myForm.$invalid">
							<button type="button" ng-click="ctrl.reset()" class="btn btn-warning btn-sm" ng-disabled="myForm.$pristine">Reset Form</button>


						</div>
					</div>
				</form>
			</div>
		</div>

		<div ng-repeat="a in ctrl.newUser" ng-show="newUser" >
			<div class="panel panel-default" >	
				<div class="panel-heading">
					<span class="lead" ng-bind="a[2]"></span>
					<span class="lead" ng-bind="a[1]"></span>
				</div>
				<div class="formcontainer"  >
					<table border="1" width="80%">
						<tr>
							<td rowspan="16" width="40%">
								<img ng-src="{{a[16]}}" width="100" height="100px" />
							</td>
							<th width="40%">Series passport</th>
							<td width="40%"><span ng-bind="a[4]"></span></td>
						</tr>
						<tr>
							<th>Number passport</th>
							<td><span ng-bind="a[5]"></span></td>
						</tr>
						<tr>
							<th>Issued by passport</th>
							<td><span ng-bind="a[6]"></span></td>
						</tr>
	
						<tr>
							<th>Issued passport</th>
							<td><span ng-bind="a[7]"></span></td>
						</tr>
	
						<tr>
							<th>Date birthday</th>
							<td><span ng-bind="a[8]"></span></td>
						</tr>
	
						<tr>
							<th>Location birthday</th>
							<td><span ng-bind="a[9]"></span></td>
						</tr>
	
						<tr>
							<th>Series_license</th>
							<td><span ng-bind="a[10]"></span></td>
						</tr>
	
						<tr>
							<th>Number license</th>
							<td><span ng-bind="a[11]"></span></td>
						</tr>
	
						<tr>
							<th>Issued by license</th>
							<td><span ng-bind="a[12]"></span></td>
						</tr>
	
						<tr>
							<th>Valid license</th>
							<td><span ng-bind="a[13]"></span></td>
						</tr>
						<tr>
							<th>Category</th>
							<td><span ng-bind="a[15]"></span></td>
						</tr>

						<tr>
							<th>Phone</th>
							<td><span ng-bind="a[17]"></span></td>
						</tr>

						<tr>
							<th>Email</th>
							<td><span ng-bind="a[18]"></span></td>
						</tr>

						<tr>
							<th>Date registration</th>
							<td><span ng-bind="a[19]"></span></td>
						</tr>

						<tr>
							<th>Role</th>
							<td><span ng-bind="a[21]"></span></td>
						</tr>


					</table>
						<input type="hidden" ng-model="a[0]" />
						<div class="row">
							<div class="form-actions floatRight">
								<button type="button" ng-click="ctrl.activeUser(a[0])" class="btn btn-success btn-lg btn-block" >Active</button>
								<button type="button" ng-click="ctrl.ignoreUser(a[0])" class="btn btn-danger btn-lg btn-block" >Ignore</button>
							</div>
						</div>
				</div>
			</div>
		</div>
		<div ng-repeat="a in ctrl.newAdvert" ng-show="newAdvert" >
			<div class="panel panel-default" >	
				<div class="panel-heading">
					<span class="lead" ng-bind="a[2]"></span>
					<span class="lead" ng-bind="a[4]"></span>
				</div>
				<div class="formcontainer"  >
					<table border="1" width="80%">
						<tr>
							<td rowspan="17" width="40%">
							<span ng-repeat="p in ctrl.allPhoto" ng-if="p[1] == a[0]">
								<img ng-src="{{p[2]}}" width="100" height="100px" />
							</span>
							</td>
							<th width="40%">Year of issue</th>
							<td width="40%"><span ng-bind="a[5]"></span></td>
						</tr>
						<tr>
							<th>Gov number</th>
							<td><span ng-bind="a[6]"></span></td>
						</tr>
						<tr>
							<th>Mileage</th>
							<td><span ng-bind="a[7]"></span></td>
						</tr>
	
						<tr>
							<th>Seats</th>
							<td><span ng-bind="a[8]"></span></td>
						</tr>
	
						<tr>
							<th>Location</th>
							<td><span ng-bind="a[9]"></span></td>
						</tr>
	
						<tr>
							<th>Transmission</th>
							<td><span ng-bind="a[11]"></span></td>
						</tr>
	
						<tr>
							<th>Body</th>
							<td><span ng-bind="a[13]"></span></td>
						</tr>
	
						<tr>
							<th>Drive</th>
							<td><span ng-bind="a[15]"></span></td>
						</tr>
	
						<tr>
							<th>Engine</th>
							<td><span ng-bind="a[17]"></span></td>
						</tr>
	
						<tr>
							<th>Fuel</th>
							<td><span ng-bind="a[19]"></span></td>
						</tr>
						<tr>
							<th>Consumption</th>
							<td><span ng-bind="a[20]"></span></td>
						</tr>

						<tr>
							<th>Demage</th>
							<td><span ng-bind="a[21]"></span></td>
						</tr>

						<tr>
							<th>Accessory</th>
							<td><span ng-bind="a[22]"></span></td>
						</tr>

						<tr>
							<th>Insurance</th>
							<td><span ng-bind="a[23]"></span></td>
						</tr>

						<tr>
							<th>Cena</th>
							<td><span ng-bind="a[24]"></span></td>
						</tr>

						<tr>
							<th>Text</th>
							<td><span ng-bind="a[25]"></span></td>
						</tr>

						<tr>
							<th>Date registration</th>
							<td><span ng-bind="a[26]"></span></td>
						</tr>

					</table>
						<input type="hidden" ng-model="a[0]" />
						<div class="row">
							<div class="form-actions floatRight">
								<button type="button" ng-click="ctrl.activeAdvert(a[0])" class="btn btn-success btn-lg btn-block" >Active</button>
								<button type="button" ng-click="ctrl.ignoreAdvert(a[0])" class="btn btn-danger btn-lg btn-block" >Ignore</button>
							</div>
						</div>
				</div>
			</div>
		</div>
		
		
		<div class="panel panel-default" ng-show="createAdvert">
			<div class="panel-heading">
				<span class="lead">Create advert</span>
			</div>
			<div class="formcontainer">
				<form ng-submit="ctrl.submit()" name="advertForm" class="form-horizontal">		
					<div class="row">
						<div class="form-group col-md-12">
							<label class="col-md-2 control-lable" for="file">Marka *</label>
							<div class="col-md-7">
								<select name="marka" ng-model="ctrl.adv.id_marka" >
									<option value="{{ma.id}}" ng-repeat="ma in ctrl.allMarka" class="form-control input-sm" required >
										{{ma.marka}}
									</option>
								</select> 
							</div>
						</div>
					</div>
					<div class="row">
						<div class="form-group col-md-12">
							<label class="col-md-2 control-lable" for="file">Model *</label>
							<div class="col-md-7">						
								<select name="model" ng-model="ctrl.adv.id_model">
									
										<option value="{{mo.id}}" ng-repeat="mo in ctrl.allModel" class="form-control input-sm" ng-selected="ctrl.select_marka == mo.id_marka" required >
									
											{{mo.model}}
											
										</option>
									</samp>
								</select> 
								
							</div>
						</div>
					</div>
					<div class="row">
						<div class="form-group col-md-12">
							<label class="col-md-2 control-lable" for="file">Year of issue *</label>
							<div class="col-md-7">
								<input type="text" ng-model="ctrl.adv.year_of_issue" class="form-control input-sm"	placeholder="Enter your Year of issue" required />
							</div>
						</div>
					</div>
					<div class="row">
						<div class="form-group col-md-12">
							<label class="col-md-2 control-lable" for="file">Gov number *</label>
							<div class="col-md-7">
								<input type="text" ng-model="ctrl.adv.gov_number" class="form-control input-sm"	placeholder="Enter your Gov number" required />
							</div>
						</div>
					</div>
					<div class="row">
						<div class="form-group col-md-12">
							<label class="col-md-2 control-lable" for="file">Mileage</label>
							<div class="col-md-7">
								<input type="text" ng-model="ctrl.adv.mileage" class="form-control input-sm"/>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="form-group col-md-12">
							<label class="col-md-2 control-lable" for="file">Seats</label>
							<div class="col-md-7">
								<input type="text" ng-model="ctrl.adv.seats" class="form-control input-sm" />
							</div>
						</div>
					</div>
					<div class="row">
						<div class="form-group col-md-12">
							<label class="col-md-2 control-lable" for="file">Location</label>
							<div class="col-md-7">
								<input type="text" ng-model="ctrl.adv.location" class="form-control input-sm" />
							</div>
						</div>
					</div>
					
					<div class="row">
						<div class="form-group col-md-12">
							<label class="col-md-2 control-lable" for="file">Photo</label>
							<div class="col-md-7">
								<input type="text" ng-model="ctrl.adv.photo" class="form-control input-sm" />
							</div>
						</div>
					</div>
					
					<div class="row">
						<div class="form-group col-md-12">
							<label class="col-md-2 control-lable" for="file">Transmission</label>
							<div class="col-md-7">
								<select name="transmission" ng-model="ctrl.adv.id_transmission">
									<option value="{{t.id}}" ng-repeat="t in ctrl.allTransmission" class="form-control input-sm"   >
										{{t.transmission}}
									</option>
								</select> 
							</div>
						</div>
					</div>
					
					<div class="row">
						<div class="form-group col-md-12">
							<label class="col-md-2 control-lable" for="file">Body</label>
							<div class="col-md-7">
								<select name="body" ng-model="ctrl.adv.id_body">
									<option value="{{b.id}}" ng-repeat="b in ctrl.allBody" class="form-control input-sm"   >
										{{b.body}}
									</option>
								</select> 
							</div>
						</div>
					</div>
					
					<div class="row">
						<div class="form-group col-md-12">
							<label class="col-md-2 control-lable" for="file">Drive</label>
							<div class="col-md-7">
								<select name="drive" ng-model="ctrl.adv.id_drive">
									<option value="{{d.id}}" ng-repeat="d in ctrl.allDrive" class="form-control input-sm"   >
										{{d.drive}}
									</option>
								</select> 
							</div>
						</div>
					</div>
					
					<div class="row">
						<div class="form-group col-md-12">
							<label class="col-md-2 control-lable" for="file">Engine *</label>
							<div class="col-md-7">
								<select name="engine" ng-model="ctrl.adv.id_engine">
									<option value="{{e.id}}" ng-repeat="e in ctrl.allEngine" class="form-control input-sm" required  >
										{{e.engine}}
									</option>
								</select> 
							</div>
						</div>
					</div>

					<div class="row">
						<div class="form-group col-md-12">
							<label class="col-md-2 control-lable" for="file">Fuel *</label>
							<div class="col-md-7">
								<select name="fuel" ng-model="ctrl.adv.id_fuel">
									<option value="{{f.id}}" ng-repeat="f in ctrl.allFuel" class="form-control input-sm" required  >
										{{f.fuel}}
									</option>
								</select> 
							</div>
						</div>
					</div>

					<div class="row">
						<div class="form-group col-md-12">
							<label class="col-md-2 control-lable" for="file">Consumption</label>
							<div class="col-md-7">
								<input type="text" ng-model="ctrl.adv.consumption" class="form-control input-sm" />
							</div>
						</div>
					</div>
					
					<div class="row">
						<div class="form-group col-md-12">
							<label class="col-md-2 control-lable" for="file">Demage</label>
							<div class="col-md-7">
								<input type="text" ng-model="ctrl.adv.demage" class="form-control input-sm" />
							</div>
						</div>
					</div>
					
					<div class="row">
						<div class="form-group col-md-12">
							<label class="col-md-2 control-lable" for="file">Accessory</label>
							<div class="col-md-7">
								<input type="text" ng-model="ctrl.adv.accessory" class="form-control input-sm" />
							</div>
						</div>
					</div>
					
					<div class="row">
						<div class="form-group col-md-12">
							<label class="col-md-2 control-lable" for="file">Insurance</label>
							<div class="col-md-7">
								<input type="text" ng-model="ctrl.adv.insurance" class="form-control input-sm" />
							</div>
						</div>
					</div>

					<div class="row">
						<div class="form-group col-md-12">
							<label class="col-md-2 control-lable" for="file">Cena *</label>
							<div class="col-md-7">
								<input type="text" ng-model="ctrl.adv.cena" class="form-control input-sm" required />
							</div>
						</div>
					</div>
					
					<div class="row">
						<div class="form-group col-md-12">
							<label class="col-md-2 control-lable" for="file">Text *</label>
							<div class="col-md-7">
								<input type="text" ng-model="ctrl.adv.text" class="form-control input-sm" required />
							</div>
						</div>
					</div>
					
					
					
					<div class="row">
						<div class="form-group col-md-12">
							<label class="col-md-2 control-lable" for="file">Calendar *</label>
							<div class="col-md-7">							
								<input id="datepicker" type="text" placeholder="yy-MM-dd" ng-model="ctrl.adv.calendar"	name="calendar" class="form-control input-sm"	placeholder="Enter your Issued passport" required />
							</div>
						</div>
					</div>
					<div class="row">
						<div class="form-group col-md-12">
							<label class="col-md-2 control-lable" for="file"></label>
							<div class="col-md-7">	
								<input type="checkbox" ng-model="ctrl.adv.id_user" class="form-control input-sm" required >	I accept the terms of the user agreement, for Carriage </input>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="form-actions floatRight">
							<button type="button" ng-click="ctrl.saveAdvert(ctrl.loginUser.id)" class="btn btn-primary btn-sm" ng-disabled="advertForm.$invalid">Insert advert</button>
							
							<button type="button" ng-click="ctrl.insertAdvert(ctrl.select_model, ctrl.select_marka, ctrl.year_of_issue, ctrl.gov_number, ctrl.miliage, ctrl.seats, ctrl.location, ctrl.transmission, ctrl.body, ctrl.drive, ctrl.engine, ctrl.fuel, ctrl.consumption, ctrl.demage, ctrl.accessory, ctrl.insurance, ctrl.cena, ctrl.text )" class="btn btn-primary btn-sm" ng-disabled="advertForm.$invalid">Insert advert</button>
							<button type="button" ng-click="ctrl.resetAdvert()" class="btn btn-warning btn-sm" ng-disabled="advertForm.$pristine">Reset Form</button>
						</div>
					</div>
				</form>
			</div>
		</div>
		
		
		<div ng-repeat="a in ctrl.advert" ng-show="yourAdvert" >
		<samp ng-if="a[28] == ctrl.loginUser.id">
			<div class="panel panel-default">
				<div class="panel-heading">
					<span class="lead" ng-bind="a[2]"></span>
						<span class="lead" ng-bind="a[4]"></span>
				</div>
				<div class="formcontainer" >
					<table border="1" width="80%">
						<tr>
							<td rowspan="10" width="40%">
								<span ng-repeat="p in ctrl.allPhoto" ng-if="p[1] == a[0]">
									 
									<img ng-src="{{p[2]}}"  width="100" height="100px" />
								</span>
							</td>
							<th width="40%">Year of issue</th>
							<td width="40%"><span ng-bind="a[5]"></span></td>
						</tr>
						<tr>
							<th>Miliage</th>
							<td><span ng-bind="a[7]"></span></td>
						</tr>
						<tr>
							<th>Seats</th>
							<td><span ng-bind="a[8]"></span></td>
						</tr>
	
						<tr>
							<th>Transmission</th>
							<td><span ng-bind="a[11]"></span></td>
						</tr>
	
						<tr>
							<th>Body</th>
							<td><span ng-bind="a[13]"></span></td>
						</tr>
	
						<tr>
							<th>Drive</th>
							<td><span ng-bind="a[15]"></span></td>
						</tr>
	
						<tr>
							<th>Engine</th>
							<td><span ng-bind="a[17]"></span></td>
						</tr>
	
						<tr>
							<th>Fuel</th>
							<td><span ng-bind="a[19]"></span></td>
						</tr>
	
						<tr>
							<th>Cena</th>
							<td><span ng-bind="a[24]"></span></td>
						</tr>
					</table>
						<input type="hidden" ng-model="a[0]" />
						<div class="row">
							<div class="form-actions floatRight">
								<button type="button" ng-click="ctrl.editYourAdvert(a[0])" class="btn btn-success custom-width">Edit</button>
								<button type="button" ng-click="ctrl.removeYourAdvert(a[0])" class="btn btn-danger custom-width">Remove</button>
								
							</div>
						</div>
				</div>
			</div>
		</span>
		</div>
		
		
		
		
		
		<div>
  			<input type="file"  id="myFile"/>
			<button type="button" ng-click="ctrl.uploadFile()" class="btn btn-warning btn-sm" >Upload</button>
  		</div>
  		
  		
  		



	</div>

<script type="text/javascript">
$( function() {
    $( "#datepicker" ).datepicker();
    $( "#datepicker" ).datepicker("option", "dateFormat", "yy-mm-dd");
  } );
  
	

</script>
  
  
  

	<script	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.4/angular.js"></script>
		  
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

	<script src="<c:url value='/static/js/app.js' />"></script>
	<script src="<c:url value='/static/js/datepicker.js' />"></script>

	<script src="<c:url value='/static/js/service/service.js' />"></script>
	<script	src="<c:url value='/static/js/controller/controller.js' />"></script>
</body>
</html>