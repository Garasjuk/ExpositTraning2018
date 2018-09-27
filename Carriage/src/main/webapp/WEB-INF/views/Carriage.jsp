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
<link rel="stylesheet"	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<link href="<c:url value='/static/css/app.css' />" rel="stylesheet"></link>
<link href="<c:url value='/static/css/calendar.css' />" rel="stylesheet"></link>

  <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
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
				<button type="button" ng-click="ctrl.contact()" class="btn btn-default btn-sm">Contact</button>

				<button type="button" ng-click="ctrl.newAdvertForm()" class="btn btn-default btn-sm" ng-show = "admin">New Advert {{ctrl.countNewAdvert}}</button>
				<button type="button" ng-click="ctrl.newUserForm()" class="btn btn-default btn-sm" ng-show = "admin">New User {{ctrl.countNewUser}}</button>
				<button type="button" ng-click="ctrl.setingsForm()" class="btn btn-default btn-sm" ng-show = "admin">Setings</button>
				
				<button type="button" ng-click="ctrl.orderWeating()" class="btn btn-default btn-sm" ng-show = "tenant">Your order</button>
				
				<button type="button" ng-click="ctrl.createAdvert()" class="btn btn-default btn-sm" ng-show = "landlord">Create advert</button>
				<button type="button" ng-click="ctrl.yourAdvert()" class="btn btn-default btn-sm" ng-show = "landlord">Your advert</button>
				<button type="button" ng-click="ctrl.orderConfirmation()" class="btn btn-default btn-sm" ng-show = "landlord">Order {{ctrl.countNewOrder}}</button>
				

			</div>
		</div>

		<div class="panel panel-default" ng-show="search">
			<div class="panel-search">
				<div class="formcontainer">
				
					<div class="row">
						<div class="form-group col-md-10">
							<label class="col-md-1 control-lable" for="file">Marka</label>	
							<div class="col-md-2">	
								<select name="marka" class="form-control" ng-model="ctrl.search.id_marka" >
									<option selected="selected" ></option>
									<option value="{{ma.id}}" ng-repeat="ma in ctrl.allMarka" class="form-control input-sm"  >
										{{ma.marka}}
									</option>
								</select> 
							</div>
							<label class="col-md-1 control-lable" for="file">Model</label>	
							<div class="col-md-2">	
								<select name="model" class="form-control" ng-model="ctrl.search.id_model">
									<option selected="selected" ></option>
									<option value="{{mo.id}}" ng-repeat="mo in ctrl.allModel" class="form-control input-sm" ng-selected="ctrl.select_marka == mo.id_marka"  >
										{{mo.model}}
									</option>
								</select> 
							</div>
						</div>
						<div class="form-group col-md-10">
							<label class="col-md-1">Year of issue</label>
								<div class="box">
									<div class="col-md-2 container">	
										<select name="year_of_issueStart" class="form-control" ng-model="ctrl.search.year_of_issueStart">
												<option selected="selected" ></option>
												<option> 1990 </option>
												<option> 1991 </option>
												<option> 1992 </option>
												<option> 1993 </option>
												<option> 1994 </option>
												<option> 1995 </option>
												<option> 1996 </option>
												<option> 1997 </option>
												<option> 1998 </option>
												<option> 1999 </option>
												<option> 2000 </option>
												<option> 2001 </option>
												<option> 2002 </option>
												<option> 2003 </option>
												<option> 2004 </option>
												<option> 2005 </option>
												<option> 2006 </option>
												<option> 2007 </option>
												<option> 2008 </option>
												<option> 2009 </option>
												<option> 2010 </option>
												<option> 2011 </option>
												<option> 2012 </option>
												<option> 2013 </option>
												<option> 2014 </option>
												<option> 2015 </option>
												<option> 2016 </option>
												<option> 2017 </option>
												<option> 2018 </option>
											</select>
										</div> 
										<div class="col-md-2 container">
											<select name="year_of_issueFinish" class="form-control" ng-model="ctrl.search.year_of_issueFinish" >
												<option selected="selected" ></option>
												<option> 1990 </option>
												<option> 1991 </option>
												<option> 1992 </option>
												<option> 1993 </option>
												<option> 1994 </option>
												<option> 1995 </option>
												<option> 1996 </option>
												<option> 1997 </option>
												<option> 1998 </option>
												<option> 1999 </option>
												<option> 2000 </option>
												<option> 2001 </option>
												<option> 2002 </option>
												<option> 2003 </option>
												<option> 2004 </option>
												<option> 2005 </option>
												<option> 2006 </option>
												<option> 2007 </option>
												<option> 2008 </option>
												<option> 2009 </option>
												<option> 2010 </option>
												<option> 2011 </option>
												<option> 2012 </option>
												<option> 2013 </option>
												<option> 2014 </option>
												<option> 2015 </option>
												<option> 2016 </option>
												<option> 2017 </option>
												<option> 2018 </option>
											</select>
										</div> 
									</div> 
							</div>
						<div class="form-group col-md-10">
							<label class="col-md-1 control-lable">Mileage</label>
							<div class="box">
								<div class="col-md-6">	
									<select name="mileageStart" class="form-control" ng-model="ctrl.search.mileageStart">
												<option selected="selected" ></option>
												<option> 1 </option>
												<option> 100000 </option>
												<option> 200000 </option>
												<option> 300000 </option>
												<option> 400000 </option>
												<option> 500000 </option>
												<option> 600000 </option>
												<option> 700000 </option>
												<option> 800000 </option>
												<option> 900000 </option>
												<option> 1000000 </option>
									</select>
								</div>
								<div class="col-md-6">	
									<select name="mileageFinish" class="form-control" ng-model="ctrl.search.mileageFinish">
											<option selected="selected" ></option>
											<option> 1 </option>
											<option> 100000 </option>
											<option> 200000 </option>
											<option> 300000 </option>
											<option> 400000 </option>
											<option> 500000 </option>
											<option> 600000 </option>
											<option> 700000 </option>
											<option> 800000 </option>
											<option> 900000 </option>
											<option> 1000000 </option>
									</select>
								</div>
							</div>
						</div>
						<div class="form-group col-md-10">
							<label class="col-md-1 control-lable">Seats</label>
							<div class="box">
								<div class="col-md-6">
									<select name="seatsStart" class="form-control" ng-model="ctrl.search.seatsStart">
												<option selected="selected" ></option>
												<option> 1 </option>
												<option> 2 </option>
												<option> 5 </option>
												<option> 8 </option>
												<option> 15 </option>
												<option> 30 </option>
												<option> 45 </option>
												<option> 60 </option>
												<option> 80 </option>
												<option> 100 </option>
									</select>
								</div>
								
								<div class="col-md-6">
										<select name="seatsFinish" class="form-control" ng-model="ctrl.search.seatsFinish">
												<option selected="selected" ></option>
												<option> 1 </option>
												<option> 2 </option>
												<option> 5 </option>
												<option> 8 </option>
												<option> 15 </option>
												<option> 30 </option>
												<option> 45 </option>
												<option> 60 </option>
												<option> 80 </option>
												<option> 100 </option>
										</select>
								</div>
							</div>
						</div>
						<div class="form-group col-md-10">	
							<label class="col-md-1 control-lable" for="file">Transmission</label>	
							<div class="col-md-2">	
								<select name="transmission" class="form-control" ng-model="ctrl.search.id_transmission">
									<option selected="selected" ></option>
									<option value="{{t.id}}" ng-repeat="t in ctrl.allTransmission" class="form-control input-sm"    >
										{{t.transmission}}
									</option>
								</select> 
							</div>
							
							<label class="col-md-1 control-lable" for="file">Body</label>	
							<div class="col-md-2">		
								<select name="body" class="form-control" ng-model="ctrl.search.id_body" >
									<option selected="selected" ></option>
									<option value="{{b.id}}" ng-repeat="b in ctrl.allBody" ng-selected="ctrl.adv.id_body == b.id" >
									{{b.body}}
									</option>
								</select> 
							</div>
					
							<label class="col-md-1 control-lable" for="file">Drive</label>	
							<div class="col-md-2">	
								<select name="drive" class="form-control" ng-model="ctrl.search.id_drive">
									<option selected="selected" ></option>
									<option value="{{d.id}}" ng-repeat="d in ctrl.allDrive" class="form-control input-sm"    >
										{{d.drive}}
									</option>
								</select> 
							</div>
						</div>	
						<div class="form-group col-md-10">			
							<label class="col-md-1 control-lable" for="file">Engine</label>	
							<div class="col-md-2">		
								<select name="engine" class="form-control" ng-model="ctrl.search.id_engine">
									<option selected="selected" ></option>
									<option value="{{e.id}}" ng-repeat="e in ctrl.allEngine" class="form-control input-sm"   >
										{{e.engine}}
									</option>
								</select> 
							</div>
							
							<label class="col-md-1 control-lable" for="file">Fuel</label>	
							<div class="col-md-2">	
								<select name="fuel" class="form-control" ng-model="ctrl.search.id_fuel">
									<option selected="selected" ></option>
									<option value="{{f.id}}" ng-repeat="f in ctrl.allFuel" class="form-control input-sm"   >
										{{f.fuel}}
									</option>
								</select> 
							</div>
						</div>						
						<div class="form-group col-md-10">
							<label class="col-md-1 control-lable" for="file">Cena</label>
							<div class="box">
								<div class="col-md-6">
									<select name="cenaStart" class="form-control" ng-model="ctrl.search.cenaStart">
										<option selected="selected"></option>
										<option> 1 </option>
										<option> 10 </option>
										<option> 20 </option>
										<option> 50 </option>
										<option> 100 </option>
										<option> 200 </option>
										<option> 500 </option>
									 	<option> 1000 </option>
										<option> 2000 </option>
										<option> 5000 </option>
									</select>
								</div>
								<div class="col-md-6">
									<select name="cenaFinish" class="form-control" ng-model="ctrl.search.cenaFinish">
										<option selected="selected" ></option>
										<option> 1 </option>
										<option> 10 </option>
										<option> 20 </option>
										<option> 50 </option>
										<option> 100 </option>
										<option> 200 </option>
										<option> 500 </option>
										<option> 1000 </option>
										<option> 2000 </option>
										<option> 5000 </option>
									</select>
								</div>
							</div>
						</div>
						<div class="form-group col-md-12">
							<button class="btn btn-primary btn-sm"  ng-click="searchFunction()">Search</button>
							<button class="btn btn btn-sm"  ng-click="searchClean()" >Clean</button>
						</div>
					</div>
			</div>
			</div>
		</div>
		
		<div class="panel panel-default" ng-show="home">
			<div class="panel-heading-main">
			<center>
				<span class="lead-main">Carriage</span>
			</center>
			</div>
			<div class="formcontainer">
				<form ng-submit="ctrl.submit()" name="myForm" class="form-horizontal">
					<input type="hidden" ng-model="ctrl.advert[0]" />
					<div class="row">
						<div class="form-group col-md-12">
							<label class="col-md-2 control-lable" for="file">We offer</label>
							<div class="col-md-7">
								<label class="text-main"  for="file">{{ctrl.allAbout.we_offer}}</label>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
		
		<div ng-show="about">
				<div ng-repeat="a in ctrl.advert | startFrom: startingItem() | limitTo: itemsPerPage"  >
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
				</samp>
				</div>

  			<div class="panel panel-default">
				<div class="panel-heading">
				    <div id="pagination" class="row">
				    <center>
				      <button class=" btn btn-primary btn-sm" ng-disabled="ctrl.firstPage()" ng-click="pageBack()">Back</button>
				   	  <span>{{currentPage+1}} of {{numberOfPages()}}</span>
				      <button class="  btn btn-primary btn-sm" ng-disabled="ctrl.lastPage()" ng-click="pageForward()">Next</button>
				      </center>
				    </div>
				</div>
			</div>
				
		</div>
		<div ng-repeat="a in ctrl.advert" ng-show="model" >
		<span ng-if="a[0] == modelById">
			<div class="panel panel-default">
				<div class="panel-heading">
					<span class="lead" ng-bind="a[2]"></span>
						<span class="lead" ng-bind="a[4]"></span>
				</div>
				<div class="formcontainer"  >
					<button type="button" id="destroyMap" ng-click="ctrl.backAdvert()" class="btn btn-outline-dark btn-lg" ><--  Back</button>
					<br/>
						<span ng-repeat="p in ctrl.allPhoto" ng-if="p[1] == a[0]">
							<img ng-src="{{p[2]}}" width="100" height="100px" />
						</span>
						<input type="hidden" ng-model="a[0]" />

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
							  <div id="carHere" style="width: 600px; height: 400px"></div>	
							  
							  <input type="hidden" id="lat" ng-model="lat" />
							  <input type="hidden" id="lon" ng-model="lon" />
							  <button onclick="showMap()">Show</button>
							  {{lat}} ,{{lon}}
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
								<label class="col-md-2 control-lable" for="file">Damage</label>
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
						
						<div class="row">
							<div class="class="form-actions-model">
								<button type="button" ng-click="ctrl.orderCar(a[0], ctrl.loginUser.id)" class="btn btn-primary btn-lg btn-block" >Order...</button>
							</div>
						</div>
				</div>
			</div>
		</span>
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
							<button type="button" ng-click="ctrl.registration()" class="btn btn-primary">Registration</button>
							<button type="button" ng-click="ctrl.authorization(email,pass)" class="btn btn-warning ">Log in</button>

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
							<label class="col-md-2 control-lable" for="file">First	name</label>
							<div class="col-md-7">
								<input type="text" ng-model="ctrl.user.first_name"	name="first_name" class="form-control input-sm"	placeholder="Enter your First name" required />
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
							<label class="col-md-2 control-lable" for="file">Issued passport</label>
							<div class="col-md-7">
								<input class="date-picker" id="issued_passport" ng-model="ctrl.user.issued_passport | date: 'yyyy-MM-dd'" type="text" class="form-control input-sm" placeholder="Enter your Issued passport" required readonly="readonly"  />
							</div>
						</div>
					</div>
					<div class="row">
						<div class="form-group col-md-12">
							<label class="col-md-2 control-lable" for="file">Date birthday</label>
							<div class="col-md-7">
								<input class="date-picker" id="date_birthday" ng-model="ctrl.user.date_birthday | date: 'yyyy-MM-dd'" type="text" class="form-control input-sm" placeholder="Enter your Issued passport" required readonly="readonly"  />							
							</div>
						</div>
					</div>
					<div class="row">
						<div class="form-group col-md-12">
							<label class="col-md-2 control-lable" for="file">Location	birthday</label>
							<div class="col-md-7">
								<input type="text" ng-model="ctrl.user.location_birthday"	name="location_birthday" class="form-control input-sm" placeholder="Enter your location birthday" required />
							</div>
						</div>
					</div>
					<div class="row">
						<div class="form-group col-md-12">
							<label class="col-md-2 control-lable" for="file">Series license</label>
							<div class="col-md-7">
								<input type="text" id="input-field" onkeyup="validate();" ng-model="ctrl.user.series_license" name="series_license" class="form-control input-sm" placeholder="Enter your Series License" required />
							</div>
						</div>
					</div>
					<div class="row">
						<div class="form-group col-md-12">
							<label class="col-md-2 control-lable" for="file">Number license</label>
							<div class="col-md-7">
								<input type="text" ng-model="ctrl.user.number_license" name="number_license" class="form-control input-sm" placeholder="Enter your Number License" required />
							</div>
						</div>
					</div>
					<div class="row">
						<div class="form-group col-md-12">
							<label class="col-md-2 control-lable" for="file">Issued by license</label>
							<div class="col-md-7">
								<input type="text" ng-model="ctrl.user.issued_by_license" name="issued_by_license" class="form-control input-sm" placeholder="Enter your Issued by License" required />
							</div>
						</div>
					</div>
					<div class="row">
						<div class="form-group col-md-12">
							<label class="col-md-2 control-lable" for="file">Issued
								license</label>
							<div class="col-md-7">
							<input class="date-picker" id="issued_license" ng-model="ctrl.user.issued_license | date: 'yyyy-MM-dd'" type="text" class="form-control input-sm" placeholder="Enter your Issued passport" required readonly="readonly"  />
							</div>
						</div>
					</div>
					<div class="row">
						<div class="form-group col-md-12">
							<label class="col-md-2 control-lable" for="file">Valid license</label>
							<div class="col-md-7">
								<input class="date-picker" id="valid_license" ng-model="ctrl.user.valid_license | date: 'yyyy-MM-dd'" type="text" class="form-control input-sm" placeholder="Enter your Issued passport" required readonly="readonly"  />
							</div>
						</div>
					</div>
					<div class="row">
						<div class="form-group col-md-12">
							<label class="col-md-2 control-lable" for="file">Id	category</label>
							<div class="col-md-7">
								<select name="category" ng-model="ctrl.user.id_category" >
									<option value="{{c.id}}" ng-repeat="c in ctrl.category" ng-selected="ctrl.user.id_category == c.id">
										{{c.category}}
									</option>
								</select> 
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
							<input type="submit" value="{{!ctrl.user.id ? 'Add' : 'Update'}}"	class="btn btn-primary btn-sm" ng-disabled="myForm.$invalid">
							<button type="button" ng-click="ctrl.reset()"	class="btn btn-warning btn-sm" ng-disabled="myForm.$pristine">Reset	Form</button>
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
							<button type="button" ng-click="ctrl.changePass(ctrl.loginUser.id)" class="btn btn-primary ">Change password</button>
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
								<input type="text" id="inputSeriesPassport" onkeyup="validateSeriesPassport();" ng-model="ctrl.user.series_passport" name="series_passport" placeholder="max: 3" ng-maxlength="3" class="form-control input-sm" placeholder="Enter your Series passport" required />
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
								<span ng-show="errorEmail">E-mail already in use </span>
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
							<th>Damage</th>
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
								<input type="text" ng-model="ctrl.adv.seats" class="form-control input-sm" required />
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
									<option value="{{t.id}}" ng-repeat="t in ctrl.allTransmission" class="form-control input-sm" required   >
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
									<option value="{{b.id}}" ng-repeat="b in ctrl.allBody" class="form-control input-sm" required   >
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
									<option value="{{d.id}}" ng-repeat="d in ctrl.allDrive" class="form-control input-sm"  required  >
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
							<label class="col-md-2 control-lable" for="file">Damage</label>
							<div class="col-md-7">
								<input type="text" ng-model="ctrl.adv.damage" class="form-control input-sm" />
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
								<input class="date-picker" id="newAdvertDate" ng-model="ctrl.adv.calenda" type="text" readonly="readonly"  />
							</div>
						</div>
					</div>
					<div class="row">
						<div class="form-group col-md-12">
							<label class="col-md-2 control-lable" for="file"></label>
							<div class="col-md-7">	
								<input type="checkbox" ng-model="ctrl.adv.id_u" class="form-control input-sm" required >	I accept the terms of the user agreement, for Carriage </input>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="form-actions floatRight">
							<button type="button" ng-click="ctrl.saveAdvert(ctrl.loginUser.id)" class="btn btn-primary btn-sm" ng-disabled="advertForm.$invalid">Insert advert</button>
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
		</samp>
		</div>
		
		<div class="panel panel-default" ng-show="editAdvert">
			<div class="panel-heading">
				<span class="lead">Edit advert</span>
			</div>
			<div class="formcontainer" >
					<form ng-submit="ctrl.submit()" name="editAdvertForm" class="form-horizontal">		
						<input type="hidden" ng-model="a.id" />
						<div class="row">
							<div class="form-group col-md-12">
								<label class="col-md-2 control-lable" for="file">Marka *</label>
								<div class="col-md-7">
									
								<select name="marka" ng-model="ctrl.adv.id_marka" >
									<option value="{{amar.id}}" ng-repeat="amar in ctrl.allMarka" ng-selected="ctrl.adv.id_model == amar.id" required>
										{{amar.marka}}
									</option>
								</select> 
								</div>
							</div>
						</div>
						<div class="row">
							<div class="form-group col-md-12">
								<label class="col-md-2 control-lable" for="file">Model *</label>
								<div class="col-md-7">		
									<select name="model" ng-model="ctrl.adv.id_model" >
										<option value="{{amod.id}}" ng-repeat="amod in ctrl.allModel" ng-selected="ctrl.adv.id_model == amod.id" required>
											{{amod.model}}
										</option>
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
								<label class="col-md-2 control-lable" for="file">Seats *</label>
								<div class="col-md-7">
									<input type="text" ng-model="ctrl.adv.seats" class="form-control input-sm" required />
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
								<label class="col-md-2 control-lable" for="file">Transmission *</label>
								<div class="col-md-7">
									<select name="transmission" ng-model="ctrl.adv.id_transmission" >
										<option value="{{t.id}}" ng-repeat="t in ctrl.allTransmission" ng-selected="ctrl.adv.id_transmission == t.id" required>
											{{t.transmission}}
										</option>
									</select> 
								</div>
							</div>
						</div>
						
						<div class="row">
							<div class="form-group col-md-12">
								<label class="col-md-2 control-lable" for="file">Body *</label>
								<div class="col-md-7">
									<select name="body" ng-model="ctrl.adv.id_body" >
										<option value="{{b.id}}" ng-repeat="b in ctrl.allBody" ng-selected="ctrl.adv.id_body == b.id" required>
											{{b.body}}
										</option>
									</select> 

								</div>
							</div>
						</div>
						
						<div class="row">
							<div class="form-group col-md-12">
								<label class="col-md-2 control-lable" for="file">Drive *</label>
								<div class="col-md-7">
									<select name="drive" ng-model="ctrl.adv.id_drive">
										<option value="{{d.id}}" ng-repeat="d in ctrl.allDrive" ng-selected="ctrl.adv.id_drive == d.id" class="form-control input-sm"  required  >
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
										<option value="{{e.id}}" ng-repeat="e in ctrl.allEngine" ng-selected="ctrl.adv.id_engine == e.id" class="form-control input-sm" required  >
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
										<option value="{{f.id}}" ng-repeat="f in ctrl.allFuel" ng-selected="ctrl.adv.id_fuel == f.id" class="form-control input-sm" required  >
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
								<label class="col-md-2 control-lable" for="file">Damage</label>
								<div class="col-md-7">
									<input type="text" ng-model="ctrl.adv.damage" class="form-control input-sm" />
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
							<div class="form-actions floatRight">
								<button type="button" ng-click="ctrl.updateAdvert()" class="btn btn-primary btn-sm" ng-disabled="editAdvertForm.$invalid">Update advert</button>
								
							</div>
						</div>
					</form>
			</div>
		</div>
		
		<div class="panel panel-default" ng-show="orderSubmit">
			<div class="panel-heading">
				<span class="lead">Order ...</span>
			</div>
			<div class="formcontainer" >
					<form name="arderForm" class="form-horizontal">		
						
						<div class="row">
							<div class="form-group col-md-12">
								<span ng-repeat="amar in ctrl.allMarka" ng-if="ctrl.adv.id_marka == amar.id" >
									<label class="col-md-2 control-lable" for="file">{{amar.marka}}</label>							
								</span>
								<span ng-repeat="amod in ctrl.allModel" ng-if="ctrl.adv.id_model == amod.id" >
									<label class="col-md-2 control-lable" for="file">{{amod.model}}</label>							
								</span>
							</div>
						</div>
						<div class="row">
							<div class="form-group col-md-12">
								<label class="col-md-2 control-lable" for="file">Calendar *</label>
									<input class="date-picker" id="orderDate" ng-model="ctrl.orderDate" type="text" readonly="readonly"  />
							</div>
						</div>
						<div class="row">
							<div class="form-actions floatRight">
								<button type="button" ng-click="ctrl.setOrder()" class="btn btn-primary btn-sm" ng-disabled="arderForm.$invalid">Order...</button>
							</div>
						</div>
					</form>
			</div>
		</div>

		<div class="panel panel-default" ng-show="orderConfirmation">
			<div class="panel-heading">
				<span class="lead">Order confirmation </span>
			</div>
			<div class="formcontainer" >
					<form name="confirmationForm" class="form-horizontal">		
						<div class="row">
							<div class="form-group col-md-12">
								<label class="col-md-2 control-lable-order-head" for="file">Marka</label>							
								<label class="col-md-2 control-lable-order-head" for="file">Model</label>							
								<label class="col-md-2 control-lable-order-head" for="file">Date order</label>							
								<label class="col-md-2 control-lable-order-head" for="file">Date create</label>							
								<label class="col-md-2 control-lable-order-head" for="file">User</label>							
							</div>
						</div>
						<span ng-repeat="a in ctrl.allAdvert">
							<samp ng-if="a.id_user == ctrl.loginUser.id">
								<div class="row">
									<div class="form-group col-md-12">
										<span ng-repeat="aord in ctrl.allOrder" >
											<samp ng-if="a.id == aord.id_advert">
												<samp ng-if="aord.active == 0">
													<span ng-repeat="amar in ctrl.allMarka" ng-if="a.id_marka == amar.id" >
														<label class="col-md-2 control-lable-order-body" for="file">{{amar.marka}}</label>							
													</span>	
													<span ng-repeat="amod in ctrl.allModel" ng-if="a.id_model == amod.id" >
														<label class="col-md-2 control-lable-order-body" for="file">{{amod.model}}</label>							
													</span>
														<span class="col-md-2 control-lable-order-body" ng-bind="aord.date_order | date: 'yyyy-MM-dd'"></span>
														<span class="col-md-2 control-lable-order-body" ng-bind="aord.date_registration | date: 'yyyy-MM-dd'"></span>	
													<span ng-repeat="ausr in ctrl.users" ng-if="ausr.id == aord.id_user" >
														<button type="button" ng-click="ctrl.showUser(ausr.id)" class="btn btn-link">{{ausr.first_name}} {{ausr.last_name}}</button>	
													</span>
													<div class="row">
														<div class="form-actions floatRight">
														<button type="button" ng-click="ctrl.activeOrder(aord.id, aord.id_user)" class="btn btn-success btn-sm btn-block" >Active</button>
														<button type="button" ng-click="ctrl.ignoreOrder(aord.id, aord.id_user)" class="btn btn-danger btn-sm btn-block" >Ignore</button>
														</div>
													</div>
												</samp>
											</samp>
										</span>
																			
									</div>
								</div>
							</samp>
						</span>
						<div class="row">
							<div class="error">
								<span ng-show="invalidPrice">This price must be a number </span>
							</div>
						</div>
					</form>
			</div>
		</div>

		<div class="panel panel-default" ng-show="orderWeating">
			<div class="panel-heading">
				<span class="lead">Order weating </span>
			</div>
			<div class="formcontainer" >
					<form name="confirmationForm" class="form-horizontal">		
						<div class="row">
							<div class="form-group col-md-12">
								<label class="col-md-2 control-lable-order-head" for="file">Marka</label>							
								<label class="col-md-2 control-lable-order-head" for="file">Model</label>							
								<label class="col-md-2 control-lable-order-head" for="file">Date order</label>							
								<label class="col-md-2 control-lable-order-head" for="file">Cena</label>							
								<label class="col-md-2 control-lable-order-head" for="file">Status</label>							
							</div>
						</div>
						<span ng-repeat="o in ctrl.allOrder">
							<samp ng-if="o.id_user == ctrl.loginUser.id">
								<div class="row">
									<div class="form-group col-md-12">
										<span ng-repeat="a in ctrl.allAdvert" >
											<samp ng-if="a.id == o.id_advert">
												<span ng-repeat="amar in ctrl.allMarka" ng-if="a.id_marka == amar.id" >
													<label class="col-md-2 control-lable-order-body" for="file">{{amar.marka}}</label>							
												</span>	
												<span ng-repeat="amod in ctrl.allModel" ng-if="a.id_model == amod.id" >
													<label class="col-md-2 control-lable-order-body" for="file">{{amod.model}}</label>							
												</span>
													<span class="col-md-2 control-lable-order-body" ng-bind="o.date_order | date: 'yyyy-MM-dd'"></span>																									
													<span class="col-md-2 control-lable-order-body" ng-bind="o.cena"></span>	

													<ANY ng-switch="o.active">
													  <ANY ng-switch-when="-2">Delete</ANY>
													  <ANY ng-switch-when="-1">Denide</ANY>
													  <ANY ng-switch-when="0">Wait...
														  <button type="button" ng-click="ctrl.deleteOrderWait(o.id)" class="btn btn-danger btn-sm" >Delete</button>
													  </ANY>
													  <ANY ng-switch-when="1">Success</ANY>
													  <ANY ng-switch-when="2">Expect....
														  <button type="button" ng-click="ctrl.okOrderWait(o.id)" class="btn btn-success btn-sm" >Ok</button>
														  <button type="button" ng-click="ctrl.deleteOrderWait(o.id)" class="btn btn-danger btn-sm" >Delete</button>
													  </ANY>
													  <ANY ng-switch-default>...</ANY>
													</ANY>
											</samp>
										</span>
									</div>
								</div>
							</samp>
						</span>
					</form>
			</div>
		</div>		
		
		<div class="panel panel-default" ng-show="setings">

			<div class="panel-heading">
				<span class="lead">Setings </span>
			</div>
			<div class="formcontainer">
				<form ng-submit="ctrl.submit()" name="setingsForm"	class="form-horizontal">
					<input type="hidden" ng-model="ctrl.allAbout.id" />

					<div class="row">
						<div class="form-group col-md-12">
							<label class="col-md-2 control-lable" for="file">We offer</label>
							<div class="col-md-7">
								<input type="text" ng-model="ctrl.allAbout.we_offer"	name="last_name" class="form-control input-sm"	placeholder="Enter your offer" required />
							</div>
						</div>
					</div>
					<div class="row">
						<div class="form-group col-md-12">
							<label class="col-md-2 control-lable" for="file">Contact</label>
							<div class="col-md-7">
								<input type="text" ng-model="ctrl.allAbout.contact" name="first_name" class="form-control input-sm"	placeholder="Enter your contact" required />
							</div>
						</div>
					</div>
					
					<div class="row">
						<div class="form-actions floatRight">
							<button type="button" ng-click="ctrl.saveSetings()" class="btn btn-warning btn-sm" ng-disabled="setingsForm.$invalid">Save</button>
						</div>
					</div>
				</form>
			</div>
		</div>
		
		<div class="panel panel-default" ng-show="showUser">

			<div class="panel-heading">
				<span class="lead">User order information </span>
			</div>
			<div class="formcontainer">
				<button type="button" ng-click="ctrl.backConfirmation()" class="btn btn-outline-dark btn-lg" ><--  Back</button>
			
				<form ng-submit="ctrl.submit()" name="myForm" class="form-horizontal">
					<span ng-repeat="u in ctrl.users">
						<samp ng-if="u.id == showUserID">
							
							<div class="row">
								<div class="form-group col-md-12">
									<label class="col-md-2 control-lable" for="file">Name</label>
									<div class="col-md-7">
										<label class="col-md-2 control-lable-order-body" for="file">{{u.last_name}} {{u.first_name}}</label>	
									</div>
								</div>
							</div>
							
							<div class="row">
								<div class="form-group col-md-12">
									<label class="col-md-2 control-lable" for="file">Passport</label>
									<div class="col-md-7">
										<label class="col-md-2 control-lable-order-body" for="file">{{u.series_passport}} {{u.number_passport}} {{u.issued_by_passport}} {{u.issued_passport}} </label>	
									</div>
								</div>
							</div>
							<div class="row">
								<div class="form-group col-md-12">
									<label class="col-md-2 control-lable" for="file">Birthday</label>
									<div class="col-md-7">
										<span class="col-md-2 control-lable-order-body" ng-bind="u.date_birthday | date: 'yyyy-MM-dd'"></span>
									</div>
								</div>
							</div>
							
							<div class="row">
								<div class="form-group col-md-12">
									<label class="col-md-2 control-lable" for="file">Phone</label>
									<div class="col-md-7">
										<label class="col-md-2 control-lable-order-body" for="file">{{u.phone}} </label>										
									</div>
								</div>
							</div>
							
							<div class="row">
								<div class="form-group col-md-12">
									<label class="col-md-2 control-lable" for="file">Category</label>
									<div class="col-md-7">
										<span ng-repeat="c in ctrl.category" ng-if="u.id_category == c.id" >
												<label class="col-md-2 control-lable-order-body" for="file">{{c.category}}</label>							
										</span>	
									</div>
								</div>
							</div>
						</samp>
					</span>	
				</form>
			</div>
		</div>
		
		<div class="panel panel-default" ng-show="changePass">
			<div class="panel-heading">
				<span class="lead">Change password</span>
			</div>
			<div class="formcontainer" >
					<form name="arderForm" class="form-horizontal">		
						<div class="row">
							<div class="form-group col-md-12">
								<div class="col-md-7">
									<input type="password" class="form-control input-sm" placeholder="password"  id="pass1" onkeyup="checkPass(); return false;" />
									<input type="password" class="form-control input-sm" placeholder="confirm password" id="pass2" onkeyup="checkPass(); return false;" />
									<div class="changePass" id="error-nwl" ></div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="form-group col-md-12">
								<div class="col-md-7">
									
								</div>
							</div>
						</div>
						<div class="row">
							<div class="form-actions floatRight">
								<button type="button" ng-click="ctrl.savePass(ctrl.loginUser.id)" class="btn btn-primary btn-sm" >Change</button>
							</div>
						</div>
					</form>
			</div>
		</div>

		<div class="panel panel-default" ng-show="contact">
			<div class="panel-heading">
				<span class="lead">Contact</span>
			</div>
			<div class="formcontainer" >
				<form name="contactForm" class="form-horizontal">	
					<div id="map" style="width: 600px; height: 400px"></div>
				
				

					<div class="row">
						<div class="form-group col-md-12">
							<label class="col-md-2 control-lable" for="file">Contact</label>
							<div class="col-md-7">
								<label class="text-main" for="file">{{ctrl.allAbout.contact}} </label>										
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>


	</div>
  
<script>
function checkPass()
{
    var pass1 = document.getElementById('pass1');
    var pass2 = document.getElementById('pass2');
    var message = document.getElementById('error-nwl');
    var goodColor = "#66cc66";
    var badColor = "#ff6666";
 	
    if(pass1.value.length > 5)
    {
        pass1.style.backgroundColor = goodColor;
        message.style.color = goodColor;
        message.innerHTML = "character number ok!"
    }
    else
    {
        pass1.style.backgroundColor = badColor;
        message.style.color = badColor;
        message.innerHTML = " you have to enter at least 6 digit!"
        return;
    }
  
    if(pass1.value == pass2.value)
    {
        pass2.style.backgroundColor = goodColor;
        message.style.color = goodColor;
        message.innerHTML = "ok!"
    }
	else
    {
        pass2.style.backgroundColor = badColor;
        message.style.color = badColor;
        message.innerHTML = " These passwords don't match"
    }
} 
</script>

<script type="text/javascript">
function showMap(){
	 var lat = document.getElementById('lat').value;
	 var lon = document.getElementById('lon').value;
	alert ("lat " + lat + " lon " + lon);
    var myCar = new ymaps.Map("carHere", {center: [lat, lon ], zoom: 16}); 
        
    var myPlacemarkCar = new ymaps.Placemark([lat, lon]);
    myCar.geoObjects.add(myPlacemarkCar);
    
    document.getElementById('destroyMap').onclick = function () {
        myCar.destroy();
    };
}
</script>

 <script>
 ymaps.ready(init);
 
 function init(){ 
     var myMap = new ymaps.Map("map", {center: [53.703482, 23.818370 ], zoom: 16}); 
     
     var myPlacemark = new ymaps.Placemark([53.703482, 23.818370], {
         hintContent: 'We are here!',
         balloonContent: 'We are here.'
     });
     myMap.geoObjects.add(myPlacemark);
 }
 
 function validate() {
	  var element = document.getElementById('input-field');
	  element.value = element.value.replace(/[^A-Z@]+/, '');
	};
function validateSeriesPassport() {
	var element = document.getElementById('inputSeriesPassport');
	element.value = element.value.replace(/[^A-Z@]+/, '');
};
 
</script>

 	<script src="https://api-maps.yandex.ru/2.1/?lang=ru_RU&onload=init" type="text/javascript"></script>
	<script src="https://catatron.com/angular-ymaps/angular-ymaps.js"></script>

	<script	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.4/angular.js"></script>
	
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

	<script src="<c:url value='/static/js/app.js' />"></script>
	<script src="<c:url value='/static/js/pagination.js' />"></script>
	<script src="<c:url value='/static/js/calendar.js' />"></script>

	<script src="<c:url value='/static/js/service/service.js' />"></script>
	<script	src="<c:url value='/static/js/controller/controller.js' />"></script>
</body>
</html>