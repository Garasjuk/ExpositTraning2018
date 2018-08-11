'use strict';

angular.module('myApp').controller('Controller', ['$scope',  'Service',
				function($scope, Service, $sessionStorage, $mdToast) {
					var self = this;
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
							location : ' ', 
							id_transmission : ' ', 
							id_body : ' ', 
							id_drive : ' ', 
							id_engine : ' ', 
							id_fuel : ' ', 
							consumption : ' ', 
							demage : ' ', 
							accessory : ' ', 
							insurance : ' ', 
							cena : ' ', 
							text : ' ',
							date_registration: ' ',
							active : ' ',
							id_user : ' '
							
					};
					
					
					
					
					
					self.users = [];
					self.category = [];
					self.loginUser = '';
					self.emailUser = '';
					self.modelById = []; 
					
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
					self.createAdvert = createAdvert;
					self.insertAdvert = insertAdvert;
					self.saveAdvert = saveAdvert;
					self.yourAdvert = yourAdvert;
					self.editYourAdvert = editYourAdvert;
					self.removeYourAdvert = removeYourAdvert;
					
					
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
					
					
					
					
					
					
					function editYourAdvert(id){
						console.log('id to be edited', id);
						for (var i = 0; i < self.adv.length; i++) {
							if (self.adv[i].id === id) {
								self.advert = angular.copy(self.adv[i]);
								break;
							}
						}
						$scope.profileEdit = true;
					} 

					function removeYourAdvert(id){
						console.log('id to be deleted', id);
						if (self.advert.id === id) {
							reset();
						}
						deleteAdvert(id);
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
					
					
					
//					function insertAdvert(id_model, id_marka, year_of_issue, gov_number, miliage, seats, location, transmission, body, drive, engine, fuel, consumption, demage, accessory, insurance, cena, text){
					function insertAdvert(advert, id_user){
						
//						alert('insertAdvert ' + advert.id_model  +' '+ advert.id_marka +' '+ advert.year_of_issue + ' '+ advert.gov_number + ' '+ advert.miliage + ' '+ advert.seats + ' '+ advert.location + ' '+  advert.id_transmission + ' '+ advert.id_body + ' '+  advert.id_drive + ' '+ advert.id_engine + ' '+ advert.id_fuel + ' '+ consumption + ' '+ demage + ' '+ accessory + ' '+ insurance + ' '+ cena + ' '+ text);
//						alert('insertAdvert ' + id_model  +' '+ id_marka +' '+ year_of_issue + ' '+ gov_number + ' '+ miliage + ' '+ seats + ''+ location + ' '+  transmission + ' '+ body + ' '+  drive + ' '+ engine + ' '+ fuel + ' '+ consumption + ' '+ demage + ' '+ accessory + ' '+ insurance + ' '+ cena + ' '+ text);
//						Service.insertAdvert(id_model, id_marka, year_of_issue, gov_number, miliage, seats, location, transmission, body, drive, engine, fuel, consumption, demage, accessory, insurance, cena, text).then(function(d) {
						Service.insertAdvert(advert, id_user).then(function(d) {
//							self.allTransmission = d;
						}, function(errResponse) {
							console.error('Error while fetching Transmission');
						});	
						resetAdvert();
						falseBlock();
						$scope.home = true;
					}

					function saveAdvert (id_user){
						insertAdvert(self.adv, id_user);
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
//						alert('create Advert');
						falseBlock();
						$scope.createAdvert = true;
//						Service.createAdvert().then(function(d) {
////							self.allPhoto = d;
//						}, function(errResponse) {
//							console.error('Error while fetching Advert');
//						});	
					}
					
					function getAllPhoto(){
						Service.getAllPhoto().then(function(d) {
							self.allPhoto = d;
						}, function(errResponse) {
							console.error('Error while fetching Photo');
						});	
					}
					
					function activeAdvert(id){
//						alert(id);
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
//						alert();
						Service.updateActiveUser(id).then(function(d) {
						}, function(errResponse) {
							console.error('Error while fetching User');
						});	
						falseBlock();
						countNewUser();									
						countNewAdvert();
						newUserForm();
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
//						alert('New Advert Form');
						Service.getNewAdvert().then(function(d) {
							self.newAdvert = d;
						}, function(errResponse) {
							console.error('Error while fetching Advert');
						});	
						falseBlock();
						$scope.newAdvert = true;
					}

					function modelById(id){
//						alert(id);
//						Service.modelById(id).then(function(d) {
//							self.modelById = d;
//						}, function(errResponse) {
//							console.error('Error while fetching Advert');
//						});
						$scope.modelById = id;
						falseBlock();
						$scope.model = true;
						$scope.myForm.$setPristine();
					}
					
					
					function uploadFile() {
//						alert ('uploadFile');
						
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
						
//						Service.profile(id).then(function(d) {
//							self.users = d;
//						}, function(errResponse) {
//							console.error('Error while fetching Users');
//						});
						
						
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
						Service.createUser(user).then(fetchAllUsers,
								function(errResponse) {
									console.error('Error while creating User');
								});
					}

					function updateUser(user, id) {
					
						Service.updateUser(user, id).then(function (d){
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
						deleteUser(id);
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
								location : '', 
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
						$scope.myForm.$setPristine(); // about Form
					}

					function advert() {
						alert('Advert');		
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
//								$sessionStorage.loginUser = d;
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
						
						 // about Form
					}

				} ]);
