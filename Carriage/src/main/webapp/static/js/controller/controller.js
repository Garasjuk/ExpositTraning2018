'use strict';

angular.module('myApp').filter('startFrom', function(){
	  return function(input, start){
		    start = +start;
		    return input.slice(start);
		  }
		}).controller('Controller', ['$scope', 'Service',
				function($scope, Service, $sessionStorage) {
					var self = this;
					
					self.allAbout = {
							id : null,  
							we_ofeer : ' ',
							contact : ' '
					};
					
					self.user = {
						id : null,  last_name : ' ',
						 first_name : ' ',
						 midle_name : ' ',
						 series_passport : ' ',
						 number_passport : ' ',
						 issued_by_passport : ' ',
						 issued_passport : ' ',
						 date_birthday : ' ',
						 location_birthday : ' ',
						 series_license : ' ',
						 number_license : ' ',
						 issued_by_license : ' ',
						 issued_license : ' ',
						 valid_license : ' ',
						 id_category : ' ',
						 photo : ' ',
						 phone : ' ',
						 email : ' ',
						 pass : ' ',
						 date_registration : ' ',
						 active : ' ',
						 id_role : ' '
					};
					
					self.adv = {
							id : null,  
							id_model : ' ', 
							id_marka : ' ', 
							year_of_issue : ' ', 
							gov_number : ' ', 
							mileage : ' ', 
							seats : ' ', 
							latitude : ' ',
							longitude : ' ',
							id_transmission : ' ', 
							id_body : ' ', 
							id_drive : ' ', 
							id_engine : ' ', 
							id_fuel : ' ', 
							consumption : ' ', 
							damage : ' ', 
							accessory : ' ', 
							insurance : ' ', 
							cena : ' ', 
							text : ' ',
							date_registration: ' ',
							active : ' ',
							id_user : ' '
					};

					self.search = {
							id : null,  
							id_model : ' ', 
							id_marka : ' ', 
							year_of_issueStart : ' ', 
							year_of_issueFinish : ' ', 
							mileageStart : ' ', 
							mileageFinish : ' ', 
							seatsStart : ' ', 
							seatsFinish : ' ', 
							id_transmission : ' ', 
							id_body : ' ', 
							id_drive : ' ', 
							id_engine : ' ', 
							id_fuel : ' ', 
							cenaStart : ' ', 
							cenaFinish : ' ', 
					};
					
					
					
					
					
					self.users = [];
					self.advert = [];
					self.allAdvert = [];
					self.category = [];
					self.loginUser = '';
					self.emailUser = '';
					self.modelById = []; 
					self.orderAdvert = 0; 
					self.orderUser = 0; 
					
					self.submit = submit;
					self.edit = edit;
					self.remove = remove;
					self.reset = reset;
					self.about = about;
					self.advert = advert;
					self.login = login;
					self.logout = logout;
					self.home = home;
					self.authorization = authorization;
					self.profile = profile;
					self.afterUpdataAllUsers = afterUpdataAllUsers;
					self.fetchAllCategory = fetchAllCategory;
					self.registration = registration;
					self.getUserById = getUserById;
					self.uploadFile = uploadFile;
					self.modelById = modelById;
					self.newAdvertForm = newAdvertForm;
					self.newUserForm = newUserForm;
					self.activeAdvert = activeAdvert;
					self.activeUser = activeUser;
					self.ignoreUser = ignoreUser;
					self.createAdvert = createAdvert;
					self.insertAdvert = insertAdvert;
					self.saveAdvert = saveAdvert;
					self.yourAdvert = yourAdvert;
					self.editYourAdvert = editYourAdvert;
					self.removeYourAdvert = removeYourAdvert;
					self.updateAdvert = updateAdvert;
					self.orderCar = orderCar;	
					self.setOrder = setOrder;	
					self.orderConfirmation = orderConfirmation;
					self.showUser = showUser;
					self.activeOrder = activeOrder;
					self.ignoreOrder = ignoreOrder;
					self.orderWeating = orderWeating;
					self.deleteOrderWait = deleteOrderWait;
					self.saveSetings = saveSetings;
					self.setingsForm = setingsForm;
					self.backConfirmation = backConfirmation;
					self.backAdvert = backAdvert;
					self.changePass = changePass;
					self.savePass = savePass;
					self.okOrderWait = okOrderWait;
					self.contact = contact;
					
					
					$scope.login = false;
					$scope.home = true;
					$scope.about = false;
					$scope.advert = false;
					$scope.errorLogin = false;
					$scope.buttonLogin = true;
					$scope.buttonLogout = false;
					$scope.profile = false;
					$scope.profileEdit = false;
					$scope.registration = false;
					$scope.model = false;
					$scope.admin = false;
					$scope.tenant = false;
					$scope.landlord = false;
					$scope.newAdvert = false;
					$scope.newUser = false;
					$scope.createAdvert = false;
					$scope.yourAdvert = false;
					$scope.orderSubmit = false;
					$scope.orderConfirmation = false;
					$scope.orderWeating = false;
					$scope.setings = false;
					$scope.search = false;
					$scope.changePass = false;
					$scope.calculateOrder = false;
					$scope.invalidPrice = false;
					$scope.contact = false;
				
					
					fetchAllUsers();
					fetchAllCategory();
					fetchAllAdvert();
					getAllPhoto();
					getAllTransmission();
					getAllRole();
					getAllModel();
					getAllMarka();
					getAllFuel();
					getAllEngine();
					getAllDrive();
					getAllBody();
					getAllAdvert();
					getAllOrder();
					getAllAbout();
					
//------------------Search-----------------------------------
					$scope.searchFunction = function() {
						  Service.getSearch(self.search).then(function(d) {
							  self.advert = d;
						  }, function(errResponse) {
							  console.error('Error while fetching getSearch');
						  });
					}

					$scope.searchClean = function() {
						Service.fetchAllAdvert().then(function(d) {
							self.advert = d;
						}, function(errResponse) {
							console.error('Error while fetching getSearch');
						});
					}
					
//-----------------------------------------------------------
					
//------------------Map--------------------------------------
					
//-----------------------------------------------------------					
					
					
					
//	-----------------Pagination--------------------------------
					$scope.currentPage = 0;
					  $scope.itemsPerPage = 5;
					  
					  
					  $scope.firstPage = function() {
						  alert('firstPage ' + $scope.currentPage);  
					    return $scope.currentPage == 0;
					  }
					  $scope.lastPage = function() {
					    var lastPageNum = Math.ceil(self.advert.length / $scope.itemsPerPage - 1);
					    return $scope.currentPage == lastPageNum;
					  }
					  $scope.numberOfPages = function(){
					    return Math.ceil(self.advert.length / $scope.itemsPerPage);
					  }
					  $scope.startingItem = function() {
						  return $scope.currentPage * $scope.itemsPerPage;
					  }
					  $scope.pageBack = function() {
						  if($scope.currentPage > 0){
							  $scope.currentPage = $scope.currentPage - 1;
						  }else {
							  $scope.currentPage;
						  }
					  }
					  $scope.pageForward = function() {
						  if (($scope.currentPage +1 ) < Math.ceil(self.advert.length / $scope.itemsPerPage) ){
							  $scope.currentPage = $scope.currentPage + 1;
						  }else {
							  $scope.currentPage;
						  }
					  }
					          					
//	-----------------------------------------------------------------------------------------------------			

					  function contact (){
						  falseBlock();
						  $scope.contact = true;
					  }

					  function changePass (){
						  falseBlock();
						  $scope.changePass = true;
					  }
					  
					  function savePass (id){
						  var pass = document.getElementById('pass1').value;
						  Service.savePass(id, pass).then(function(d) {
						  }, function(errResponse) {
							  console.error('Error while fetching savePass');
						  });
						  getAllAbout();
						  profile(0);						  
					  }
					  
					  function backAdvert(){
						  falseBlock();
						  about();
					  }

					  function backConfirmation(){
						  falseBlock();
						  orderConfirmation();
					  }
					  
					  function setingsForm(){
						  falseBlock();
						  $scope.setings = true;	
					  }

					  function saveSetings(){
							  Service.saveSetings(self.allAbout).then(function(d) {
							  }, function(errResponse) {
								  console.error('Error while fetching allAbout');
							  });
							  getAllAbout();
							  falseBlock();
							  $scope.home = true;	
					  }
					  
					  function okOrderWait(id){
							if(confirm("Are you shure ?")){
								Service.updateOkOrderWait(id).then(function(d) {
								}, function(errResponse) {
									console.error('Error while fetching okOrderWait');
								});
								falseBlock();
								getAllOrder();
								$scope.orderWeating = true;	
							}else{
								
							}
					  }
					  
					function deleteOrderWait(id){
						if(confirm("Are you shure ?")){
							Service.deleteOrderWait(id).then(function(d) {
							}, function(errResponse) {
								console.error('Error while fetching ignoreOrder');
							});
							falseBlock();
							getAllOrder();
							$scope.orderWeating = true;	
						}else{
							
						}
					}
					
					function orderWeating(){
						falseBlock();
						getAllOrder();
						$scope.orderWeating = true;
						
					}
					
					function activeOrder(id_order, id_user){	
							var price = prompt("Enter the price : ", "the price write here");
							if (price != null){
								if (price % 1 === 0){
									Service.activeOrder(id_order, id_user, price).then(function(d) {
									}, function(errResponse) {
										console.error('Error while fetching ignoreOrder');
									});
									falseBlock();
									getAllOrder();
									$scope.orderConfirmation = true;
								}else{
									$scope.invalidPrice = true;
								}
							}
					} 
					
					function ignoreOrder(id_order, id_user){
						var retVal = prompt("Enter reason for refusal : ", "reason for refusal here");
						Service.ignoreOrder(id_order, id_user, retVal).then(function(d) {
						}, function(errResponse) {
							console.error('Error while fetching ignoreOrder');
						});	
						falseBlock();
						getAllOrder();
						$scope.orderConfirmation = true;
					} 
					
					function showUser(id){	
						falseBlock();
						$scope.showUserID = id;
						$scope.showUser = true;
					} 

					function orderConfirmation(){	
						falseBlock();
						$scope.orderConfirmation = true;
					} 
					
					function setOrder(){	
						var orderDate = document.getElementById('orderDate').value;
						Service.orderAdvert(self.orderAdvert, self.orderUser, orderDate ).then(
								function(errResponse) {
									console.error('Error while deleting Order');
								});
						falseBlock();
						about();
					} 
					
					function orderCar(id_advert, id_user){
						if (id_user == null) {
							if(confirm("You should be register!")){
								falseBlock();
								$scope.login = true;	
							}
						}else{
							for (var i = 0; i < self.allAdvert.length; i++) {
								if (self.allAdvert[i].id === id_advert) {
									self.adv = angular.copy(self.allAdvert[i]);
									break;
								}
							}
							self.orderAdvert = id_advert;
							self.orderUser = id_user;
							falseBlock();
							$scope.orderSubmit = true;
						}
					} 
					
					function editYourAdvert(id){
						for (var i = 0; i < self.allAdvert.length; i++) {
							if (self.allAdvert[i].id === id) {
								self.adv = angular.copy(self.allAdvert[i]);
								break;
							}
						}
						falseBlock();
						$scope.editAdvert = true;
						$scope.editAdvertId = id;
					} 

					function removeYourAdvert(id){
						if(confirm("Are you shure ?")){
							deleteAdvert(id);
							fetchAllAdvert();
							yourAdvert();
						}
						
					} 
					
					function deleteAdvert(id) {
						Service.deleteAdvert(id).then(
							function(errResponse) {
								console.error('Error while deleting User');
							});
					}
					
					function yourAdvert(){
						falseBlock();
						$scope.yourAdvert = true;
					}
					
					function insertAdvert(advert, id_user, newAdvertDate){
						Service.insertAdvert(advert, id_user, newAdvertDate).then(function(d) {
						}, function(errResponse) {
							console.error('Error while fetching Transmission');
						});	
						resetAdvert();
						falseBlock();
						$scope.home = true;
					}

					function saveAdvert (id_user){
						var newAdvertDate = document.getElementById('newAdvertDate').value;
						  var latNew = document.getElementById('latNew').value;
						  var lonNew = document.getElementById('lonNew').value;
						 // alert("latNew " + latNew + "; lonNew " + lonNew);
						  self.adv.latitude = latNew;
						  self.adv.longitude = lonNew;
						insertAdvert(self.adv, id_user,newAdvertDate );
					}
				
					function getAllAbout(){
						Service.getAllAbout().then(function(d) {
							self.allAbout = d;
						}, function(errResponse) {
							console.error('Error while fetching About');
						});	
					}
					
					function getAllOrder(){
						Service.getAllOrder().then(function(d) {
							self.allOrder = d;
						}, function(errResponse) {
							console.error('Error while fetching Order');
						});	
					}
					
					function getAllAdvert(){
						Service.getAllAdvert().then(function(d) {
							self.allAdvert = d;
						}, function(errResponse) {
							console.error('Error while fetching Advert');
						});	
					}
					
					function getAllTransmission(){
						Service.getAllTransmission().then(function(d) {
							self.allTransmission = d;
						}, function(errResponse) {
							console.error('Error while fetching Transmission');
						});	
					}
					
					function getAllRole(){
						Service.getAllRole().then(function(d) {
							self.allRole = d;
						}, function(errResponse) {
							console.error('Error while fetching Role');
						});	
					}
					
					function getAllModel(){
						Service.getAllModel().then(function(d) {
							self.allModel = d;
						}, function(errResponse) {
							console.error('Error while fetching Model');
						});	
					}
					
					function getAllMarka(){
						Service.getAllMarka().then(function(d) {
							self.allMarka = d;
						}, function(errResponse) {
							console.error('Error while fetching Marka');
						});	
					}
					
					function getAllFuel(){
						Service.getAllFuel().then(function(d) {
							self.allFuel = d;
						}, function(errResponse) {
							console.error('Error while fetching Fuel');
						});	
					}
					
					function getAllEngine(){
						Service.getAllEngine().then(function(d) {
							self.allEngine = d;
						}, function(errResponse) {
							console.error('Error while fetching Engine');
						});	
					}

					function getAllDrive(){
						Service.getAllDrive().then(function(d) {
							self.allDrive = d;
						}, function(errResponse) {
							console.error('Error while fetching Drive');
						});	
					}
					
					function getAllBody(){
						Service.getAllBody().then(function(d) {
							self.allBody = d;
						}, function(errResponse) {
							console.error('Error while fetching Body');
						});	
					}
					
					function createAdvert(){
						falseBlock();
						resetAdvert();
						$scope.createAdvert = true;
					}
					
					function getAllPhoto(){
						Service.getAllPhoto().then(function(d) {
							self.allPhoto = d;
						}, function(errResponse) {
							console.error('Error while fetching Photo');
						});	
					}
					
					function activeAdvert(id){
						Service.updateActiveAdvert(id).then(function(d) {
						}, function(errResponse) {
							console.error('Error while fetching Advert');
						});	
						falseBlock();
						countNewUser();									
						countNewAdvert();
						newAdvertForm();
					}

					function activeUser(id){
						Service.updateActiveUser(id).then(function(d) {
						}, function(errResponse) {
							console.error('Error while fetching User');
						});	
						falseBlock();
						countNewUser();									
						countNewAdvert();
						newUserForm();
					}
					
					function ignoreUser(id){
						if(confirm("Are you shure ?")){
							Service.deleteUser(id).then(function(d) {
							}, function(errResponse) {
								console.error('Error while fetching User');
							});	
							falseBlock();
							countNewUser();									
							countNewAdvert();
							newUserForm();
						}
					}
					
					function newUserForm(){
						Service.getNewUser().then(function(d) {
							self.newUser = d;
						}, function(errResponse) {
							console.error('Error while fetching Advert');
						});	
						falseBlock();
						$scope.newUser = true;
					}

					function newAdvertForm(){
						Service.getNewAdvert().then(function(d) {
							self.newAdvert = d;
						}, function(errResponse) {
							console.error('Error while fetching Advert');
						});	
						falseBlock();
						$scope.newAdvert = true;
					}

					function modelById(id){
						$scope.modelById = id;
						falseBlock();
						
						$scope.model = true;
						$scope.myForm.$setPristine();
					}
					
					
					function uploadFile() {
						
						var file = document.getElementById('myFile').files[0];
						var uploadUrl = "http://localhost:8080/Carriage/static/photo";
//						r = new FileReader();
//						var  f = $scope.myFile; 	
//						var file = photo.files[0];
						alert(file.name);
						
						Service.uploadFileToUrl(file, uploadUrl);
						alert('Ok');

//						 var fd=new FormData();
////					        console.log($scope.files);
//					        
//						 $scope.content = new FormData();
//						 $scope.content.append('fileUpload', event.files[0]); 
//						 $scope.$apply();
//						    
//						 $http({
//						        method: 'POST', 
//						        url: 'static/photo',
//						        headers: {'Content-Type': undefined },
//						        data: $scope.content,
//						    }).success(function(response) {
//						        // Uploading complete
//						        console.log('Request finished', response);
//						    });
						 
					       }
					
					function fetchAllAdvert() {
						Service.fetchAllAdvert().then(function(d) {
							self.advert = d;
						}, function(errResponse) {
							console.error('Error while fetching Advert');
						});
						falseBlock();
						$scope.home = true;
					}
					
					
					function fetchAllUsers() {
						Service.fetchAllUsers().then(function(d) {
							self.users = d;
						}, function(errResponse) {
							console.error('Error while fetching Users');
						});
						falseBlock();
						$scope.home = true;
					}

					function fetchAllCategory() {
						Service.fetchAllCategory().then(function(d) {
							self.category = d;
						}, function(errResponse) {
							console.error('Error while fetching Users');
						});
					}

					function afterUpdataAllUsers() {
						Service.byEmail(self.emailUser).then(function(d) {
							self.loginUser = d;
						}, function(errResponse) {
							console.error('Error while fetching Users');
						});
						falseBlock();
						$scope.profile = true;
						$scope.myForm.$setPristine();
					}
					
					function profile(id) {
						falseBlock();
						$scope.profile = true;
						$scope.myForm.$setPristine();
					}
					
					$scope.resetLoginForm = function() {
						$scope.email = '';
						$scope.pass = '';
					}

					function falseBlock() {
						$scope.login = false;
						$scope.home = false;
						$scope.about = false;
						$scope.errorLogin = false;
						$scope.profile = false;
						$scope.profileEdit = false;
						$scope.registration = false;
						$scope.model = false;
						$scope.newAdvert = false;
						$scope.newUser = false;
						$scope.advert = false;
						$scope.createAdvert = false;
						$scope.yourAdvert = false;
						$scope.editAdvert = false;
						$scope.orderSubmit = false;
						$scope.orderConfirmation = false;
						$scope.orderWeating = false;
						$scope.setings = false;
						$scope.showUser = false;
						$scope.search = false;
						$scope.changePass = false;
						$scope.calculateOrder = false;
						$scope.invalidPrice = false;
						$scope.contact = false;
						
					}
					
					function countNewOrder(id) {
						Service.countNewOrder(id).then(function(d) {
							self.countNewOrder = d;
						}, function(errResponse) {
							console.error('Error while fetching Users');
						});
						$scope.myForm.$setPristine();
					}

					function countNewUser() {
						Service.countNewUser().then(function(d) {
							self.countNewUser = d;
						}, function(errResponse) {
							console.error('Error while fetching Users');
						});
						$scope.myForm.$setPristine();
					}
					
					function countNewAdvert() {
						Service.countNewAdvert().then(function(d) {
							self.countNewAdvert = d;
						}, function(errResponse) {
							console.error('Error while fetching Users');
						});
						$scope.myForm.$setPristine();
					}
					
					function getUserById(id) {
						Service.profile(Number(id)).then(function(d) {
							self.loginUser = d;
						}, function(errResponse) {
							console.error('Error while fetching Users');
						});
						falseBlock();
						$scope.home = true;
					}
					
					function createUser(user) {
						
						Service.createUser(user).then(function(d){
						if (d === null){
							
							$scope.errorEmail = true;
						}else {
							
							fetchAllUsers();
						}
						},
							function(errResponse) {
								console.error('Error while creating User');
								});
					}
					
					function updateAdvert() {
						var latEdit = document.getElementById('latEdit').value;
						var lonEdit = document.getElementById('lonEdit').value;
						self.adv.latitude = latEdit;
						self.adv.longitude = lonEdit;
						Service.updateAdvert(self.adv).then(fetchAllAdvert,
						function(errResponse) {
							console.error('Error while updating Advert');
						});
						yourAdvert();
					}

					function updateUser(user, id) {
						
						var issued_passport = document.getElementById('issued_passport').value;
						var date_birthday = document.getElementById('date_birthday').value;
						var issued_license = document.getElementById('issued_license').value;
						var valid_license = document.getElementById('valid_license').value;
						
						Service.updateUser(user, id, issued_passport, date_birthday, issued_license, valid_license ).then(function (d){
								self.loginUser = d;	
					},function(errResponse) {
									console.error('Error while updating User');
								});
						profile();
					}

					function deleteUser(id) {
						Service.deleteUser(id).then(fetchAllUsers,
								function(errResponse) {
									console.error('Error while deleting User');
								});
					}

					function submit() {
						if (self.user.id === null) {
							console.log('Saving New User', self.user);
							createUser(self.user);
						} else {
							updateUser(self.user, self.user.id);
							console.log('User updated with id ', self.user.id);
						}
						reset();
					}

					function edit(id) {
						console.log('id to be edited', id);
						for (var i = 0; i < self.users.length; i++) {
							if (self.users[i].id === id) {
								self.user = angular.copy(self.users[i]);
								break;
							}
						}
						$scope.profileEdit = true;
					}

					function remove(id) {
						console.log('id to be deleted', id);
						if (self.user.id === id) {// clean form if the user to
													// be deleted is shown
													// there.
							reset();
						}
						if(confirm("Are you shure ?")){
							deleteUser(id);
							logout();
						}
					}

					function resetAdvert() {
						self.adv = {
								id : null,
								id_model : '', 
								id_marka : '', 
								year_of_issue : '', 
								gov_number : '', 
								mileage : '', 
								seats : '', 
								latitude : ' ',
								longitude : ' ',
								id_transmission : '', 
								id_body : '', 
								id_drive : '', 
								id_engine : '', 
								id_fuel : '', 
								consumption : '', 
								demage : '', 
								accessory : '', 
								insurance : '', 
								cena : '', 
								text : '',
								date_registration: '',
								active : '',
								id_user : ''
						};
						$scope.advertForm.$setPristine(); // reset Form
					}
					
					function reset() {
						self.user = {
							id : null,
							last_name : '',
							 first_name : '',
							 midle_name : '',
							 series_passport : '',
							 number_passport : '',
							 issued_by_passport : '',
							 issued_passport : '',
							 date_birthday : '',
							 location_birthday : '',
							 series_license : '',
							 number_license : '',
							 issued_by_license : '',
							 issued_license : '',
							 valid_license : '',
							 id_category : '',
							 photo : '',
							 phone : '',
							 email : '',
							 pass : '',
							 date_registration : '',
							 active : '',
							 id_role : ''
						};
						$scope.myForm.$setPristine(); // reset Form
					}

					function about() {
						falseBlock();
						$scope.about = true;
						$scope.search = true;
						$scope.myForm.$setPristine(); // about Form
					}

					function advert() {
						falseBlock();
						$scope.advert = true;
						$scope.myForm.$setPristine(); // advert Form
					}

					function login() {
						falseBlock();
						$scope.login = true;
						$scope.myForm.$setPristine(); // login Form
					}

					function logout() {
						falseBlock();
						$scope.home = true;
						$scope.buttonLogin = true;
						$scope.buttonLogout = false;
						$scope.admin = false;
						$scope.tenant = false;
						$scope.landlord = false;
						$scope.loginUser = '';
						location.reload();
						$scope.myForm.$setPristine(); // logout Form
						
					}

					function home() {
						falseBlock();
						$scope.home = true;
						$scope.myForm.$setPristine(); // home Form
					}

					function createUser(user) {
						Service.createUser(user).then(fetchAllUsers,
								function(errResponse) {
									console.error('Error while creating User');
								});
					}
					
					function registration() {
						falseBlock();
						$scope.registration = true;
						$scope.myForm.$setPristine(); // registration Form
					}
					
					function authorization(email, pass) {
						$scope.emailUser = email;
						self.emailUser =$scope.emailUser; 
						Service.loginUser(email, pass)
						.then(function(d) {
							if (d){
								if (d.active == 1){
								$scope.resetLoginForm();
								falseBlock();
								$scope.home = true;	
								self.loginUser = d;
								$scope.buttonLogin = false;
								$scope.buttonLogout = true;
										if (d.id_role == 1){
											$scope.admin = true;
											countNewUser();									
											countNewAdvert();									
										}
										if (d.id_role == 2){
											$scope.tenant = true;
										}
										if (d.id_role == 3){
											countNewOrder(d.id);
											$scope.landlord = true;
										}
									$scope.myForm.$setPristine();
								}
								else{
									$scope.errorActive = true;
								}
							}else{
								$scope.errorLogin = true;
								$scope.myForm.$setPristine();
							}
						}, function(errResponse) {
							console.error('Error while creating User');
						});
					}
				} ]);
