package ru.site.spring.controller;
 
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.util.UriComponentsBuilder;

import ru.site.spring.email.EmailSend;
import ru.site.spring.model.Advert;
import ru.site.spring.model.Body;
import ru.site.spring.model.Category;
import ru.site.spring.model.Drive;
import ru.site.spring.model.Engine;
import ru.site.spring.model.Fuel;
import ru.site.spring.model.Marka;
import ru.site.spring.model.Model;
import ru.site.spring.model.Orders;
import ru.site.spring.model.Role;
import ru.site.spring.model.Transmission;
import ru.site.spring.model.User;
import ru.site.spring.service.AdvertService;
import ru.site.spring.service.BodyService;
import ru.site.spring.service.CategoryService;
import ru.site.spring.service.DriveService;
import ru.site.spring.service.EngineService;
import ru.site.spring.service.FuelService;
import ru.site.spring.service.MarkaService;
import ru.site.spring.service.ModelService;
import ru.site.spring.service.OrderService;
import ru.site.spring.service.RoleService;
import ru.site.spring.service.TransmissionService;
import ru.site.spring.service.UserService;
import ru.site.spring.utility.PasswordString;


@RestController
public class CarriageController {
 
	PasswordString passwordString = new PasswordString();
	EmailSend emailsend = new EmailSend();
	
    @Autowired
    UserService userService;  //Service which will do all data retrieval/manipulation work
    @Autowired
    AdvertService advertService;  //Service which will do all data retrieval/manipulation work
    @Autowired
    CategoryService categoryService;
    @Autowired
    BodyService bodyService;
    @Autowired
    DriveService driveService;
    @Autowired
    EngineService engineService;
    @Autowired
    FuelService fuelService;
    @Autowired
    MarkaService markaService;    
    @Autowired
    ModelService modelService;
    @Autowired
    RoleService roleService;
    @Autowired
    TransmissionService transmissionService;    
    @Autowired
    OrderService orderService;
    
    
 
    
    //------------------- Update a Order Active --------------------------------------------------------
    
    @RequestMapping(value = "/order/delete/{id_order}", method = RequestMethod.PUT)
    public ResponseEntity deleteActiveOrder(@PathVariable("id_order") long id_order) {
    	System.out.println("Order Delete ");
    	orderService.deleteActiveOrder(id_order);
    	return null;
    }   

    //------------------- Update a Order Active --------------------------------------------------------
    
    @RequestMapping(value = "/order/active/{id_order}/{id_user}", method = RequestMethod.PUT)
    public ResponseEntity updatActiveOrder(@PathVariable("id_order") long id_order, @PathVariable("id_user") int id_user) {
    	System.out.println("Order Active ");
    	User user = userService.findById(id_user);	
    	try {
    		emailsend.sendMessage(user.getEmail(), "Successful order", "Your order is approved");
    	} catch (IOException e) {
    		e.printStackTrace();
    	}
    	orderService.updateActiveOrder(id_order);
    	return null;
    }   
    
   //------------------- Update a Order Ignore --------------------------------------------------------
    
    @RequestMapping(value = "/order/ignore/{id_order}/{id_user}/{retVal}", method = RequestMethod.PUT)
    public ResponseEntity updateIgnoreOrder(@PathVariable("id_order") long id_order, @PathVariable("id_user") int id_user, @PathVariable("retVal") String retVal) {
    	System.out.println("Order Ignore " + retVal);
    	User user = userService.findById(id_user);	
    	try {
			emailsend.sendMessage(user.getEmail(), "Reason for refusal", retVal);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	orderService.updateIgnoreOrder(id_order);
		return null;
    }   

//-------------------Count Order--------------------------------------------------------
    
    @RequestMapping(value = "/order/count/{id}", method = RequestMethod.GET)
    public ResponseEntity countNewOrder(@PathVariable("id") int id) {
//    	System.out.println( "Count Order " + id);
    	int  countOrder = orderService.countNewOrder(id);
    	
    	if(countOrder == 0){
    		return new ResponseEntity (HttpStatus.NO_CONTENT);//You many decide to return HttpStatus.NOT_FOUND
    	}
    	return new ResponseEntity (countOrder, HttpStatus.OK);
    }
    
 
    //-------------------Create a Order--------------------------------------------------------
    
  @RequestMapping(value = "/order/{id_advert}/{id_user}/{orderDate}", method = RequestMethod.POST)
  public ResponseEntity<Void> saveOrder(@PathVariable("id_advert") int id_advert, @PathVariable("id_user") int id_user, @PathVariable("orderDate") String orderDate) {
  	Date date = new Date();
  	Orders order = new Orders();
  	 SimpleDateFormat formatter = new SimpleDateFormat("yyyy-M-d");
  	System.out.println("saveOrder " + orderDate);

  	order.setId_advert(id_advert);
  	order.setId_user(id_user);
  	order.setDate_registration(date);
  	order.setActive(0);
  	order.setCena(0);
  	
  	try {
  		
		order.setDate_order(date = formatter.parse(orderDate));
	} catch (ParseException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
  	orderService.saveOrder(order);
  	 return new ResponseEntity<Void>(HttpStatus.OK);
  }
    
    
    //------------------- Update a Advert --------------------------------------------------------
    
    @RequestMapping(value = "/advert/update/", method = RequestMethod.PUT)
    public ResponseEntity<Advert> updateAdvert(@RequestBody Advert advert) {
//    	System.out.println("updateAdvert ");
    	
        advertService.updateAdvert(advert);
        return new ResponseEntity<Advert>(advert, HttpStatus.OK);
    }
    
    
    //------------------- Delete a Advert --------------------------------------------------------
    
    @RequestMapping(value = "/advert/{id}", method = RequestMethod.DELETE)
    public ResponseEntity<Advert> deleteAdvert(@PathVariable("id") long id) {
        advertService.deleteAdvertById(id);
        return new ResponseEntity<Advert>(HttpStatus.NO_CONTENT);
    }
 
    
    //-------------------Create a Advert--------------------------------------------------------
    
//    @RequestMapping(value = "/advert//{id_model}/{id_marka}/{year_of_issue}/{gov_number}/{miliage}/{seats}/{location}/{transmission}/{body}/{drive}/{engine}/{fuel}/{consumption}/{demage}/{accessory}/{insurance}/{cena}/{text}", method = RequestMethod.POST)
    @RequestMapping(value = "/advert/{id_user}/{newAdvertDate}", method = RequestMethod.POST)
    public ResponseEntity<Void> saveAdvert(@RequestBody Advert advert, @PathVariable("id_user") int id_user , @PathVariable("newAdvertDate") String newAdvertDate, UriComponentsBuilder ucBuilder) {
    	
    	System.out.println("id_user " + id_user); 
    	System.out.println("newAdvertDate " + newAdvertDate); 
    	Date date = new Date();
//    	ByteArrayOutputStream output = passwordString.getPassword();
//    	String temp = output.toString();

    	advert.setDate_registration(date);
    	advert.setId_user(id_user);
    	
    	
//    	System.out.println("id_model " + advert.getId_model());
//    	System.out.println("year " + advert.getYear_of_issue());
//    	System.out.println("gov " + advert.getGov_number());
//    	System.out.println("miliage " + advert.getMileage());
//    	System.out.println("seats " + advert.getSeats());
//    	System.out.println("location " + advert.getLocation());
//    	System.out.println("id_body " + advert.getId_body());
//    	System.out.println("id_drive " + advert.getId_drive());
//    	System.out.println("id_engine " + advert.getId_engine());
//    	System.out.println("id_fuel " + advert.getId_fuel());
//    	System.out.println("id_transmission " + advert.getId_transmission());
//    	System.out.println("accessory " + advert.getAccessory());
//    	System.out.println("demage " + advert.getDemage());
//    	System.out.println("consumption " + advert.getConsumption());
//    	System.out.println("cena " + advert.getCena());
//    	System.out.println("insurens " + advert.getInsurance());
//    	System.out.println("text " + advert.getText());
//    	
    	
//        if (userService.isUserExist(user)) {
//            System.out.println("A User with name " + user.getUsername() + " already exist");
//            return new ResponseEntity<Void>(HttpStatus.CONFLICT);
//        }
    	advertService.saveAdvert(advert);
    	
    	HttpHeaders headers = new HttpHeaders();
        headers.setLocation(ucBuilder.path("/advert/{id}").buildAndExpand(advert.getId()).toUri());
        return new ResponseEntity<Void>(headers, HttpStatus.CREATED);
// 
//        return null;
       
    }
    
    
    //-------------------Get All Order--------------------------------------------------------    
    @RequestMapping(value = "/allOrder/", method = RequestMethod.GET)
    public ResponseEntity <List<Orders>> getAllOrder() {
    	List<Orders> list = orderService.getAllOrder();
    	if(list.isEmpty()){
    		return new ResponseEntity <List<Orders>> (HttpStatus.NO_CONTENT);//You many decide to return HttpStatus.NOT_FOUND
    	}
    	return new ResponseEntity <List<Orders>> (list, HttpStatus.OK);
    }
    
    //-------------------Get All Advert--------------------------------------------------------    
    @RequestMapping(value = "/allAdvert/", method = RequestMethod.GET)
    public ResponseEntity <List<Advert>> getEveryAdvert() {
    	List<Advert> list = advertService.getEveryAdvert();
    	if(list.isEmpty()){
    		return new ResponseEntity <List<Advert>> (HttpStatus.NO_CONTENT);//You many decide to return HttpStatus.NOT_FOUND
    	}
    	return new ResponseEntity <List<Advert>> (list, HttpStatus.OK);
    }
    
    
    //-------------------Get Transmission--------------------------------------------------------    
    @RequestMapping(value = "/transmission/", method = RequestMethod.GET)
    public ResponseEntity <List<Transmission>> getAllTransmission() {
    	List<Transmission> list = transmissionService.getAllTransmission();
    	if(list.isEmpty()){
    		return new ResponseEntity <List<Transmission>> (HttpStatus.NO_CONTENT);//You many decide to return HttpStatus.NOT_FOUND
    	}
    	return new ResponseEntity <List<Transmission>> (list, HttpStatus.OK);
    }
    
    //-------------------Get Role--------------------------------------------------------    
    @RequestMapping(value = "/role/", method = RequestMethod.GET)
    public ResponseEntity <List<Role>> getAllRole() {
    	List<Role> list = roleService.getAllRole();
    	if(list.isEmpty()){
    		return new ResponseEntity <List<Role>> (HttpStatus.NO_CONTENT);//You many decide to return HttpStatus.NOT_FOUND
    	}
    	return new ResponseEntity <List<Role>> (list, HttpStatus.OK);
    }
    
    //-------------------Get Model--------------------------------------------------------    
    @RequestMapping(value = "/model/", method = RequestMethod.GET)
    public ResponseEntity <List<Model>> getAllModel() {
    	List<Model> list = modelService.getAllModel();
    	if(list.isEmpty()){
    		return new ResponseEntity <List<Model>> (HttpStatus.NO_CONTENT);//You many decide to return HttpStatus.NOT_FOUND
    	}
    	return new ResponseEntity <List<Model>> (list, HttpStatus.OK);
    }
    
    //-------------------Get Marka--------------------------------------------------------    
    @RequestMapping(value = "/marka/", method = RequestMethod.GET)
    public ResponseEntity <List<Marka>> getAllMarka() {
    	List<Marka> list = markaService.getAllMarka();
    	if(list.isEmpty()){
    		return new ResponseEntity <List<Marka>> (HttpStatus.NO_CONTENT);//You many decide to return HttpStatus.NOT_FOUND
    	}
    	return new ResponseEntity <List<Marka>> (list, HttpStatus.OK);
    }
    
    //-------------------Get Fuel--------------------------------------------------------    
    @RequestMapping(value = "/fuel/", method = RequestMethod.GET)
    public ResponseEntity <List<Fuel>> getAllFuel() {
    	List<Fuel> list = fuelService.getAllFuel();
    	if(list.isEmpty()){
    		return new ResponseEntity <List<Fuel>> (HttpStatus.NO_CONTENT);//You many decide to return HttpStatus.NOT_FOUND
    	}
    	return new ResponseEntity <List<Fuel>> (list, HttpStatus.OK);
    }
    
    //-------------------Get Engine--------------------------------------------------------    
    @RequestMapping(value = "/engine/", method = RequestMethod.GET)
    public ResponseEntity <List<Engine>> getAllEngine() {
    	List<Engine> list = engineService.getAllEngine();
    	if(list.isEmpty()){
    		return new ResponseEntity <List<Engine>> (HttpStatus.NO_CONTENT);//You many decide to return HttpStatus.NOT_FOUND
    	}
    	return new ResponseEntity <List<Engine>> (list, HttpStatus.OK);
    }

    //-------------------Get Drive--------------------------------------------------------    
    @RequestMapping(value = "/drive/", method = RequestMethod.GET)
    public ResponseEntity <List<Drive>> getAllDrive() {
    	List<Drive> list = driveService.getAllDrive();
    	if(list.isEmpty()){
    		return new ResponseEntity <List<Drive>> (HttpStatus.NO_CONTENT);//You many decide to return HttpStatus.NOT_FOUND
    	}
    	return new ResponseEntity <List<Drive>> (list, HttpStatus.OK);
    }

    //-------------------Get Body--------------------------------------------------------    
    @RequestMapping(value = "/body/", method = RequestMethod.GET)
    public ResponseEntity <List<Body>> getAllBody() {
    	List<Body> list = bodyService.getAllBody();
    	if(list.isEmpty()){
    		return new ResponseEntity <List<Body>> (HttpStatus.NO_CONTENT);//You many decide to return HttpStatus.NOT_FOUND
    	}
    	return new ResponseEntity <List<Body>> (list, HttpStatus.OK);
    }
    
 //------------------- Update a Advert Active --------------------------------------------------------
    
    @RequestMapping(value = "/advert/updateActive/{id}", method = RequestMethod.PUT)
    public ResponseEntity updatActiveAdvert(@PathVariable("id") long id) {
//    	System.out.println("Updating User Active " + id);
    	
    	if (id > 0 ) {
//    		System.out.println("User with id " + id + " not found");
//    		return new ResponseEntity<User>(HttpStatus.NOT_FOUND);
    		advertService.updateActiveAdvert(id);
    	}
//    	return new ResponseEntity<User>(currentUser, HttpStatus.OK);
		return null;
    }
    
    //-------------------Get New Advert--------------------------------------------------------
    
    @RequestMapping(value = "/photo/", method = RequestMethod.GET)
    public ResponseEntity <List> getAllPhoto() {
    	List list = advertService.getAllPhoto();
    	if(list.isEmpty()){
    		return new ResponseEntity <List> (HttpStatus.NO_CONTENT);//You many decide to return HttpStatus.NOT_FOUND
    	}
    	return new ResponseEntity <List> (list, HttpStatus.OK);
    }

    //-------------------Get New Advert--------------------------------------------------------

    @RequestMapping(value = "/advert/newadvert/", method = RequestMethod.GET)
    public ResponseEntity <List> getNewAdvert() {
    	List list = advertService.getNewAdvert();
    	if(list.isEmpty()){
    		return new ResponseEntity <List> (HttpStatus.NO_CONTENT);//You many decide to return HttpStatus.NOT_FOUND
    	}
    	return new ResponseEntity <List> (list, HttpStatus.OK);
    }

//-------------------Count Advert--------------------------------------------------------
    
    @RequestMapping(value = "/advert/count/", method = RequestMethod.GET)
    public ResponseEntity countNewAdvert() {
    	int  countAdvert = advertService.countNewAdvert();
//    	System.out.println("countAdvert " + countAdvert);
    	
    	if(countAdvert == 0){
    		return new ResponseEntity (HttpStatus.NO_CONTENT);//You many decide to return HttpStatus.NOT_FOUND
    	}
    	return new ResponseEntity (countAdvert, HttpStatus.OK);
    }
    
    //-------------------Retrieve All Advert--------------------------------------------------------
    
    @RequestMapping(value = "/advert/", method = RequestMethod.GET)
    public ResponseEntity <List> getAllAdvert() {
    	List list = advertService.getAllAdvert();
//    	System.out.println("users " + users.get(0));
    	
    	if(list.isEmpty()){
    		return new ResponseEntity <List> (HttpStatus.NO_CONTENT);//You many decide to return HttpStatus.NOT_FOUND
    	}
    	return new ResponseEntity <List> (list, HttpStatus.OK);
    }
    
    //-------------------Retrieve All Advert--------------------------------------------------------
    
    @RequestMapping(value = "/advert/{id}", method = RequestMethod.GET)
    public ResponseEntity <List> findById(@PathVariable("id") int id) {
    	List list = advertService.findById(id);
//    	System.out.println("users " + users.get(0));
    	
    	if(list.isEmpty()){
    		return new ResponseEntity <List> (HttpStatus.NO_CONTENT);//You many decide to return HttpStatus.NOT_FOUND
    	}
    	return new ResponseEntity <List> (list, HttpStatus.OK);
    }
    
    //-------------------Retrieve All Users--------------------------------------------------------
     
    @RequestMapping(value = "/user/", method = RequestMethod.GET)
    public ResponseEntity<List<User>> listAllUsers() {
        List<User> users = userService.getAllUsers();
//        System.out.println("users " + users.get(0));
        
        if(users.isEmpty()){
            return new ResponseEntity<List<User>>(HttpStatus.NO_CONTENT);//You many decide to return HttpStatus.NOT_FOUND
        }
        return new ResponseEntity<List<User>>(users, HttpStatus.OK);
    }

    //-------------------Count Users--------------------------------------------------------
    
    @RequestMapping(value = "/user/count/", method = RequestMethod.GET)
    public ResponseEntity countNewUser() {
    	int  countUser = userService.countNewUser();
//    	System.out.println("countUser " + countUser);
    	
    	if(countUser == 0){
    		return new ResponseEntity (HttpStatus.NO_CONTENT);//You many decide to return HttpStatus.NOT_FOUND
    	}
    	return new ResponseEntity (countUser, HttpStatus.OK);
    }
 
  //-------------------Retrieve All Category--------------------------------------------------------
    
    @RequestMapping(value = "/user/category/", method = RequestMethod.GET)
    public ResponseEntity<List<Category>> listAllCategory() {
        List<Category> category = categoryService.getAllCategory();
        //System.out.println("Category " + category.get(0));
        
        if(category.isEmpty()){
            return new ResponseEntity<List<Category>>(HttpStatus.NO_CONTENT);//You many decide to return HttpStatus.NOT_FOUND
        }
        return new ResponseEntity<List<Category>>(category, HttpStatus.OK);
    }
    
    //-------------------Retrieve Single User--------------------------------------------------------
     
    @RequestMapping(value = "/user/{id}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<User> getUser(@PathVariable("id") long id) {
//        System.out.println("Fetching User with id " + id);
        User user = userService.findById(id);
        if (user == null) {
//            System.out.println("User with id " + id + " not found");
            return new ResponseEntity<User>(HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<User>(user, HttpStatus.OK);
    }
 
     
     
    //-------------------Create a User--------------------------------------------------------
     
    @RequestMapping(value = "/user/", method = RequestMethod.POST)
    public ResponseEntity<Void> createUser(@RequestBody User user,    UriComponentsBuilder ucBuilder) {
    	Date date = new Date();
    	ByteArrayOutputStream output = passwordString.getPassword();
    	String temp = output.toString();
//    	System.out.println("Creating User " + user.getLast_name());
//        System.out.println("date " + date);
    	try {
			emailsend.sendMessage(user.getEmail(), "Registration on Carriage", "You pass " + temp );
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	
    	user.setPass(DigestUtils.md5Hex(temp));
    	user.setDate_registration(date);
    	
//    	System.out.println("Creating Pass " + temp);
//    	System.out.println("Creating Pass MD5 " + user.getPass());
    	    	
//        if (userService.isUserExist(user)) {
//            System.out.println("A User with name " + user.getUsername() + " already exist");
//            return new ResponseEntity<Void>(HttpStatus.CONFLICT);
//        }
 
        userService.saveUser(user);
 
        HttpHeaders headers = new HttpHeaders();
        headers.setLocation(ucBuilder.path("/user/{id}").buildAndExpand(user.getId()).toUri());
        return new ResponseEntity<Void>(headers, HttpStatus.CREATED);
    }
 
    
    
    //------------------- Update a User Active --------------------------------------------------------
    
    @RequestMapping(value = "/user/updateActive/{id}", method = RequestMethod.PUT)
    public ResponseEntity updatActiveUser(@PathVariable("id") long id) {
//    	System.out.println("Updating User Active " + id);
    	
    	if (id > 0 ) {
//    		System.out.println("User with id " + id + " not found");
//    		return new ResponseEntity<User>(HttpStatus.NOT_FOUND);
    		userService.updateActiveUser(id);
    	}
//    	return new ResponseEntity<User>(currentUser, HttpStatus.OK);
		return null;
    }
     
    //------------------- Update a User --------------------------------------------------------
     
    @RequestMapping(value = "/user/{id}", method = RequestMethod.PUT)
    public ResponseEntity<User> updateUser(@PathVariable("id") long id, @RequestBody User user) {
//        System.out.println("Updating User " + id);
         
        User currentUser = userService.findById(id);
         
        if (currentUser==null) {
            System.out.println("User with id " + id + " not found");
            return new ResponseEntity<User>(HttpStatus.NOT_FOUND);
        }
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        
//        System.out.println("Updating Passport " + user.getSeries_passport());
//        System.out.println("Updating Issued_license Date " + dateFormat.format(user.getIssued_license()));
//        System.out.println("Updating Birthday Date " + dateFormat.format(user.getDate_birthday()));
//        System.out.println("Updating Valid Date " + user.getValid_license());
        
        currentUser.setLast_name(user.getLast_name());
        currentUser.setFirst_name(user.getFirst_name());
        currentUser.setMidle_name(user.getMidle_name());
        currentUser.setSeries_passport(user.getSeries_passport());
        currentUser.setNumber_passport(user.getNumber_passport());
        currentUser.setIssued_by_passport(user.getIssued_by_passport());
        currentUser.setIssued_passport(user.getIssued_passport());
        currentUser.setDate_birthday(user.getDate_birthday());
        currentUser.setLocation_birthday(user.getLocation_birthday());
        currentUser.setSeries_license(user.getSeries_license());
        currentUser.setNumber_license(user.getNumber_license());
        currentUser.setIssued_by_license(user.getIssued_by_license());
        currentUser.setIssued_license(user.getIssued_license());
        currentUser.setValid_license(user.getValid_license());
        currentUser.setId_category(user.getId_category());
        currentUser.setPhoto(user.getPhoto());
        currentUser.setPhone(user.getPhone());
        currentUser.setEmail(user.getEmail());
         
        
        
        
        userService.updateUser(currentUser);
        return new ResponseEntity<User>(currentUser, HttpStatus.OK);
    }
 
    
    
    //------------------- Delete a User --------------------------------------------------------
     
    @RequestMapping(value = "/user/{id}", method = RequestMethod.DELETE)
    public ResponseEntity<User> deleteUser(@PathVariable("id") long id) {
//        System.out.println("Fetching & Deleting User with id " + id);
 
        User user = userService.findById(id);
        if (user == null) {
//            System.out.println("Unable to delete. User with id " + id + " not found");
            return new ResponseEntity<User>(HttpStatus.NOT_FOUND);
        }
 
        userService.deleteUserById(id);
        return new ResponseEntity<User>(HttpStatus.NO_CONTENT);
    }
 
     
    
    //------------------- Delete All Users --------------------------------------------------------
     
    @RequestMapping(value = "/user/", method = RequestMethod.DELETE)
    public ResponseEntity<User> deleteAllUsers() {
//        System.out.println("Deleting All Users");
 
        userService.deleteAllUsers();
        return new ResponseEntity<User>(HttpStatus.NO_CONTENT);
    }
 
    
//-------------------Get  All New User--------------------------------------------------------
    
    @RequestMapping(value = "/user/newuser/", method = RequestMethod.GET)
    public ResponseEntity <List> getNewUser() {
    	List list = userService.getNewUser();
    	if(list.isEmpty()){
    		return new ResponseEntity <List> (HttpStatus.NO_CONTENT);//You many decide to return HttpStatus.NOT_FOUND
    	}
    	return new ResponseEntity <List> (list, HttpStatus.OK);
    }
    
  //-------------------Log in a User--------------------------------------------------------
    
    @RequestMapping(value = "/user/login/{email}/{pass}", method = RequestMethod.GET)
    public ResponseEntity<User> login(@PathVariable("email") String email, @PathVariable("pass") String pass ) {
//        System.out.println("Creating email " + email);
//        System.out.println("Creating pass " + pass);
//        System.out.println("MD5 " +  DigestUtils.md5Hex(pass));
//         
        User user = userService.findByEmail(email);
        if (user != null) {
        	if (DigestUtils.md5Hex(pass).equals(user.getPass())) {
//        		System.out.println("User birthday " + user.getDate_birthday());
//        		System.out.println("User pass " + user.getPass());
//        	
        	
        	 return new ResponseEntity<User>(user, HttpStatus.OK);
        	 }
        	return null;
        }else {
        	return null;
        }
    }
    
    
//-------------------By Email--------------------------------------------------------
    
    @RequestMapping(value = "/user/byEmail/{email}", method = RequestMethod.GET)
    public ResponseEntity<User> login(@PathVariable("email") String email ) {
        User user = userService.findByEmail(email);
//        System.out.println("By Email " + email);
        if (user != null) {
        	
//        	System.out.println("By Email");
//        	System.out.println("User email " + user.getEmail());
//    		System.out.println("User Last_name  " + user.getLast_name());
//    		System.out.println("User Birthday Date " + user.getDate_birthday());
    		
        	 return new ResponseEntity<User>(user, HttpStatus.OK);
        }else {
        	return null;
        }
    }
    
 //-------------------Profile in a User--------------------------------------------------------
    
    @RequestMapping(value = "/user/profile/{id}", method = RequestMethod.GET)
    public ResponseEntity<User> profile(@PathVariable("id") long id ) {
//        System.out.println("Profils id " + id);
         
        User user = userService.findById(id);

        if (user != null) {
        	
//        		System.out.println("Profil User email " + user.getEmail());
//        		System.out.println("Profil User pass " + user.getPass());
        	
        	
        	 return new ResponseEntity<User>(user, HttpStatus.OK);
        }else {
        	return null;
        }
    }

  //-------------------getUserById--------------------------------------------------------
    
    @RequestMapping(value = "/user/getuserbyid/{id}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<User> getUserById(@PathVariable("id") long id) {
//        System.out.println("Fetching User with id " + id);
        User user = userService.findById(id);
        if (user == null) {
//            System.out.println("User with id " + id + " not found");
            return new ResponseEntity<User>(HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<User>(user, HttpStatus.OK);
    }
 

    
}