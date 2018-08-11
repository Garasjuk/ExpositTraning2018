'use strict';

angular.module('myApp').factory('Service', ['$http', '$q', function($http, $q){

    var REST_SERVICE_URI = 'http://localhost:8080/Carriage/';

    var factory = {
        fetchAllUsers: fetchAllUsers,
        fetchAllCategory: fetchAllCategory,
        createUser: createUser,
        updateUser:updateUser,
        deleteUser:deleteUser,
        deleteAdvert:deleteAdvert,
        loginUser:loginUser,
        profile:profile,
        getUserById:getUserById,
        byEmail:byEmail,
        fetchAllAdvert:fetchAllAdvert,
        modelById:modelById,
        countNewUser:countNewUser,
        countNewAdvert:countNewAdvert,
        getNewUser:getNewUser,
        getNewAdvert:getNewAdvert,
        getAllPhoto:getAllPhoto,
        updateActiveUser:updateActiveUser,
        updateActiveAdvert:updateActiveAdvert,
        getAllBody:getAllBody,
        getAllDrive:getAllDrive,
        getAllEngine:getAllEngine,
        getAllFuel:getAllFuel,
        getAllMarka:getAllMarka,
        getAllModel:getAllModel,
        getAllRole:getAllRole,
        getAllTransmission:getAllTransmission,
        uploadFileToUrl:uploadFileToUrl,
        insertAdvert:insertAdvert
    };

    return factory;

    
    
    
//    function insertAdvert(id_model, id_marka, year_of_issue, gov_number, miliage, seats, location, transmission, body, drive, engine, fuel, consumption, demage, accessory, insurance, cena, text){
   	function insertAdvert(advert, id_user){
    	 var deferred = $q.defer();
//         $http.post(REST_SERVICE_URI + 'advert/' + id_model + id_marka + year_of_issue + gov_number + miliage + seats + location + transmission + body + drive + engine + fuel + consumption + demage + accessory + insurance + cena + text )
         $http.post(REST_SERVICE_URI + 'advert/' + id_user, advert)
             .then(
             function (response) {
                 deferred.resolve(response.data);
             },
             function(errResponse){
                 console.error('Error while creating User');
                 deferred.reject(errResponse);
             }
         );
         return deferred.promise;
    }
    
    function uploadFileToUrl(file, uploadUrl){
    	var fd = new FormData();
        fd.append('file', file);
        $http.post(uploadUrl, fd, {
           transformRequest: angular.identity,
           headers: {'Content-Type': undefined}
        })
        .success(function(){
        	alert('success');
        })
        .error(function(){
        	 console.dir(file);
        	alert('error');
        });
    }
    
    function getAllTransmission() {
    	var deferred = $q.defer();
    	$http.get(REST_SERVICE_URI + '/transmission/')
    	.then(
    			function (response) {
    				deferred.resolve(response.data);
    			},
    			function(errResponse){
    				console.error('Error while fetching Transmission');
    				deferred.reject(errResponse);
    			}
    	);
    	return deferred.promise;
    }
    
    function getAllRole() {
    	var deferred = $q.defer();
    	$http.get(REST_SERVICE_URI + '/role/')
    	.then(
    			function (response) {
    				deferred.resolve(response.data);
    			},
    			function(errResponse){
    				console.error('Error while fetching Role');
    				deferred.reject(errResponse);
    			}
    	);
    	return deferred.promise;
    }
    
    function getAllModel() {
    	var deferred = $q.defer();
    	$http.get(REST_SERVICE_URI + '/model/')
    	.then(
    			function (response) {
    				deferred.resolve(response.data);
    			},
    			function(errResponse){
    				console.error('Error while fetching Model');
    				deferred.reject(errResponse);
    			}
    	);
    	return deferred.promise;
    }
    
    function getAllMarka() {
    	var deferred = $q.defer();
    	$http.get(REST_SERVICE_URI + '/marka/')
    	.then(
    			function (response) {
    				deferred.resolve(response.data);
    			},
    			function(errResponse){
    				console.error('Error while fetching Marka');
    				deferred.reject(errResponse);
    			}
    	);
    	return deferred.promise;
    }
    
    function getAllFuel() {
    	var deferred = $q.defer();
    	$http.get(REST_SERVICE_URI + '/fuel/')
    	.then(
    			function (response) {
    				deferred.resolve(response.data);
    			},
    			function(errResponse){
    				console.error('Error while fetching Fuel');
    				deferred.reject(errResponse);
    			}
    	);
    	return deferred.promise;
    }
    
    function getAllEngine() {
    	var deferred = $q.defer();
    	$http.get(REST_SERVICE_URI + '/engine/')
    	.then(
    			function (response) {
    				deferred.resolve(response.data);
    			},
    			function(errResponse){
    				console.error('Error while fetching Engine');
    				deferred.reject(errResponse);
    			}
    	);
    	return deferred.promise;
    }
    
    function getAllDrive() {
    	var deferred = $q.defer();
    	$http.get(REST_SERVICE_URI + '/drive/')
    	.then(
    			function (response) {
    				deferred.resolve(response.data);
    			},
    			function(errResponse){
    				console.error('Error while fetching Drive');
    				deferred.reject(errResponse);
    			}
    	);
    	return deferred.promise;
    }
    
    function getAllBody() {
    	var deferred = $q.defer();
    	$http.get(REST_SERVICE_URI + '/body/')
    	.then(
    			function (response) {
    				deferred.resolve(response.data);
    			},
    			function(errResponse){
    				console.error('Error while fetching Body');
    				deferred.reject(errResponse);
    			}
    	);
    	return deferred.promise;
    }
    
    function updateActiveAdvert(id) {
    	var deferred = $q.defer();
    	$http.put(REST_SERVICE_URI + 'advert/updateActive/' + id)
    	.then(
    			function (response) {
    				deferred.resolve(response.data);
    			},
    			function(errResponse){
    				console.error('Error while fetching Photo');
    				deferred.reject(errResponse);
    			}
    	);
    	return deferred.promise;
    }

    function updateActiveUser(id) {
    	var deferred = $q.defer();
    	$http.put(REST_SERVICE_URI + 'user/updateActive/' + id)
    	.then(
    			function (response) {
    				deferred.resolve(response.data);
    			},
    			function(errResponse){
    				console.error('Error while fetching Photo');
    				deferred.reject(errResponse);
    			}
    	);
    	return deferred.promise;
    }
    
    function getAllPhoto() {
    	var deferred = $q.defer();
    	$http.get(REST_SERVICE_URI + '/photo/')
    	.then(
    			function (response) {
    				deferred.resolve(response.data);
    			},
    			function(errResponse){
    				console.error('Error while fetching Photo');
    				deferred.reject(errResponse);
    			}
    	);
    	return deferred.promise;
    }
    
    function getNewAdvert() {
    	var deferred = $q.defer();
    	$http.get(REST_SERVICE_URI + '/advert/newadvert/')
    	.then(
    			function (response) {
    				deferred.resolve(response.data);
    			},
    			function(errResponse){
    				console.error('Error while fetching Advert');
    				deferred.reject(errResponse);
    			}
    	);
    	return deferred.promise;
    }
    
    
    function getNewUser() {
    	var deferred = $q.defer();
    	$http.get(REST_SERVICE_URI + '/user/newuser/')
    	.then(
    			function (response) {
    				deferred.resolve(response.data);
    			},
    			function(errResponse){
    				console.error('Error while fetching Users');
    				deferred.reject(errResponse);
    			}
    	);
    	return deferred.promise;
    }

    function countNewAdvert() {
    	var deferred = $q.defer();
    	$http.get(REST_SERVICE_URI + '/advert/count/')
    	.then(
    			function (response) {
    				deferred.resolve(response.data);
    			},
    			function(errResponse){
    				console.error('Error while fetching Users');
    				deferred.reject(errResponse);
    			}
    	);
    	return deferred.promise;
    }

    function countNewUser() {
    	var deferred = $q.defer();
    	$http.get(REST_SERVICE_URI + '/user/count/')
    	.then(
    			function (response) {
    				deferred.resolve(response.data);
    			},
    			function(errResponse){
    				console.error('Error while fetching Users');
    				deferred.reject(errResponse);
    			}
    	);
    	return deferred.promise;
    }

    function modelById(id) {
    	var deferred = $q.defer();
    	$http.get(REST_SERVICE_URI + 'advert/' + id)
    	.then(
    			function (response) {
    				deferred.resolve(response.data);
    			},
    			function(errResponse){
    				console.error('Error while fetching Users');
    				deferred.reject(errResponse);
    			}
    	);
    	return deferred.promise;
    }

    function fetchAllAdvert() {
        var deferred = $q.defer();
        $http.get(REST_SERVICE_URI + 'advert/')
            .then(
            function (response) {
                deferred.resolve(response.data);
            },
            function(errResponse){
                console.error('Error while fetching Users');
                deferred.reject(errResponse);
            }
        );
        return deferred.promise;
    }
    
    function fetchAllUsers() {
        var deferred = $q.defer();
        $http.get(REST_SERVICE_URI + 'user/')
            .then(
            function (response) {
                deferred.resolve(response.data);
            },
            function(errResponse){
                console.error('Error while fetching Users');
                deferred.reject(errResponse);
            }
        );
        return deferred.promise;
    }

    function fetchAllCategory() {
    	var deferred = $q.defer();
    	$http.get(REST_SERVICE_URI + 'user/' + 'category/')
    	.then(
    			function (response) {
    				deferred.resolve(response.data);
    			},
    			function(errResponse){
    				console.error('Error while fetching Users');
    				deferred.reject(errResponse);
    			}
    	);
    	return deferred.promise;
    }


    function getUserById(id) {
    	alert('ID ' + id);
        var deferred = $q.defer();
        $http.get(REST_SERVICE_URI + 'user/' + 'getuserbyid/' + id)
            .then(
            function (response) {
                deferred.resolve(response.data);
            },
            function(errResponse){
                console.error('Error while fetching Users');
                deferred.reject(errResponse);
            }
        );
        return deferred.promise;
    }

    
    
    function profile(id) {
    	
        var deferred = $q.defer();
        $http.get(REST_SERVICE_URI + 'user/' + 'profile/' + id)
            .then(
            function (response) {
                deferred.resolve(response.data);
            },
            function(errResponse){
                console.error('Error while fetching Users');
                deferred.reject(errResponse);
            }
        );
        return deferred.promise;
    }
    
    function createUser(user) {
        var deferred = $q.defer();
        $http.post(REST_SERVICE_URI + 'user/', user)
            .then(
            function (response) {
                deferred.resolve(response.data);
            },
            function(errResponse){
                console.error('Error while creating User');
                deferred.reject(errResponse);
            }
        );
        return deferred.promise;
    }


    function updateUser(user, id) {
        var deferred = $q.defer();
        $http.put(REST_SERVICE_URI + 'user/' +id, user)
            .then(
            function (response) {
                deferred.resolve(response.data);
            },
            function(errResponse){
                console.error('Error while updating User');
                deferred.reject(errResponse);
            }
        );
        return deferred.promise;
    }
    
    function deleteAdvert(id) {
    	var deferred = $q.defer();
    	$http.delete(REST_SERVICE_URI + 'advert/' +id)
    	.then(
    			function (response) {
    				deferred.resolve(response.data);
    			},
    			function(errResponse){
    				console.error('Error while deleting Advert');
    				deferred.reject(errResponse);
    			}
    	);
    	return deferred.promise;
    }

    function deleteUser(id) {
        var deferred = $q.defer();
        $http.delete(REST_SERVICE_URI + 'user/' +id)
            .then(
            function (response) {
                deferred.resolve(response.data);
            },
            function(errResponse){
                console.error('Error while deleting User');
                deferred.reject(errResponse);
            }
        );
        return deferred.promise;
    }

    
    function loginUser(email, pass) {
        var deferred = $q.defer();
        $http.get(REST_SERVICE_URI + 'user/' +'login/' + email +'/' + pass )
            .then(
            function (response) {
                deferred.resolve(response.data);
            },
            function(errResponse){
                console.error('Error while creating User');
                deferred.reject(errResponse);
            }
        );
        return deferred.promise;
    }
    
    function byEmail(email) {
        var deferred = $q.defer();
        $http.get(REST_SERVICE_URI + 'user/' +'byEmail/' + email )
            .then(
            function (response) {
                deferred.resolve(response.data);
            },
            function(errResponse){
                console.error('Error while creating User');
                deferred.reject(errResponse);
            }
        );
        return deferred.promise;
    }
    
}]);
