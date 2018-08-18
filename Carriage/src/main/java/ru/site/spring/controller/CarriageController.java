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
import ru.site.spring.model.About;
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
import ru.site.spring.service.AboutService;
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

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

@RestController
public class CarriageController {
 
	private static final  Log log = LogFactory.getLog(CarriageController.class);
	
	PasswordString passwordString = new PasswordString();
	EmailSend emailsend = new EmailSend();
	
    @Autowired
    UserService userService;  
    @Autowired
    AdvertService advertService;  
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
    @Autowired
    AboutService aboutService;
    
    
    //------------------- Update a User Active --------------------------------------------------------
    
    @RequestMapping(value = "/user/changePass/{id}/{pass}", method = RequestMethod.PUT)
    public ResponseEntity updatPassUser(@PathVariable("id") long id, @PathVariable("pass") String pass) {
    	if (id > 0 ) {
    		userService.updatPassUser(id, DigestUtils.md5Hex(pass));
    		  log.info("updatPassUser " + id);
    	}
		return null;
    } 
    
  //------------------- Update a About --------------------------------------------------------
    @RequestMapping(value = "/about/update/", method = RequestMethod.PUT)
    public ResponseEntity<About> updateAbout(@RequestBody About allAbout) {
    	aboutService.updateAbout(allAbout);
    	log.info("updateAbout ");
        return new ResponseEntity<About>(allAbout, HttpStatus.OK);
    }
    
    //-------------------Get All About--------------------------------------------------------    
    @RequestMapping(value = "/about/", method = RequestMethod.GET)
    public ResponseEntity <About> getAllAbout() {
    	About about = aboutService.getAllAbout();
    	if(about.equals(null)){
    		log.info("getAllAbout ");
    		return new ResponseEntity <About> (HttpStatus.NO_CONTENT);
    	}
    	return new ResponseEntity <About> (about, HttpStatus.OK);
    }
    
    //------------------- Update a Order Active --------------------------------------------------------
    
    @RequestMapping(value = "/order/delete/{id_order}", method = RequestMethod.PUT)
    public ResponseEntity deleteActiveOrder(@PathVariable("id_order") long id_order) {
    	orderService.deleteActiveOrder(id_order);
    	log.info("deleteActiveOrder " + id_order);
    	return null;
    }   

    //------------------- Update a Order  Ok Wait --------------------------------------------------------
    @RequestMapping(value = "/order/ok/{id_order}", method = RequestMethod.PUT)
    public ResponseEntity updateOkOrderWait(@PathVariable("id_order") long id_order) {
    	orderService.updateOkOrderWait(id_order);
    	log.info("updateOkOrderWait " + id_order);
    	return null;
    }   

    //------------------- Update a Order Active --------------------------------------------------------
    @RequestMapping(value = "/order/active/{id_order}/{id_user}/{price}", method = RequestMethod.PUT)
    public ResponseEntity updatActiveOrder(@PathVariable("id_order") long id_order, @PathVariable("id_user") int id_user, @PathVariable("price") int price) {
    	User user = userService.findById(id_user);	
    	try {
    		emailsend.sendMessage(user.getEmail(), "Successful order", "Your order is approved");
    	} catch (IOException e) {
    		log.error("updatActiveOrder " + e);
    	}
    	orderService.updateActiveOrder(id_order, price);
    	return null;
    }   
    
   //------------------- Update a Order Ignore --------------------------------------------------------
    @RequestMapping(value = "/order/ignore/{id_order}/{id_user}/{retVal}", method = RequestMethod.PUT)
    public ResponseEntity updateIgnoreOrder(@PathVariable("id_order") long id_order, @PathVariable("id_user") int id_user, @PathVariable("retVal") String retVal) {
    	User user = userService.findById(id_user);	
    	try {
			emailsend.sendMessage(user.getEmail(), "Reason for refusal", retVal);
		} catch (IOException e) {
			log.error("updateIgnoreOrder " + e);
		}
    	orderService.updateIgnoreOrder(id_order);
		return null;
    }   

//-------------------Count Order--------------------------------------------------------
    @RequestMapping(value = "/order/count/{id}", method = RequestMethod.GET)
    public ResponseEntity countNewOrder(@PathVariable("id") int id) {
    	int  countOrder = orderService.countNewOrder(id);
    	if(countOrder == 0){
			log.info("countNewOrder " + id);
    		return new ResponseEntity (HttpStatus.NO_CONTENT);
    	}
    	return new ResponseEntity (countOrder, HttpStatus.OK);
    }
    
 
    //-------------------Create a Order--------------------------------------------------------
  @RequestMapping(value = "/order/{id_advert}/{id_user}/{orderDate}", method = RequestMethod.POST)
  public ResponseEntity<Void> saveOrder(@PathVariable("id_advert") int id_advert, @PathVariable("id_user") int id_user, @PathVariable("orderDate") String orderDate) {
  	Date date = new Date();
  	Orders order = new Orders();
  	SimpleDateFormat formatter = new SimpleDateFormat("yyyy-M-d");
  	order.setId_advert(id_advert);
  	order.setId_user(id_user);
  	order.setDate_registration(date);
  	order.setActive(0);
  	order.setCena(0);
  	try {
		order.setDate_order(date = formatter.parse(orderDate));
	} catch (ParseException e) {
		log.error("saveOrder " + e);
	}
  	orderService.saveOrder(order);
  	 return new ResponseEntity<Void>(HttpStatus.OK);
  }
    
    
    //------------------- Update a Advert --------------------------------------------------------
    @RequestMapping(value = "/advert/update/", method = RequestMethod.PUT)
    public ResponseEntity<Advert> updateAdvert(@RequestBody Advert advert) {
        advertService.updateAdvert(advert);
    	log.info("updateAdvert ");
        return new ResponseEntity<Advert>(advert, HttpStatus.OK);
    }
    
    //------------------- Delete a Advert --------------------------------------------------------
    @RequestMapping(value = "/advert/{id}", method = RequestMethod.DELETE)
    public ResponseEntity<Advert> deleteAdvert(@PathVariable("id") long id) {
        advertService.deleteAdvertById(id);
    	log.info("deleteAdvert " + id);
        return new ResponseEntity<Advert>(HttpStatus.NO_CONTENT);
    }
    
    //-------------------Create a Advert--------------------------------------------------------
    @RequestMapping(value = "/advert/{id_user}/{newAdvertDate}", method = RequestMethod.POST)
    public ResponseEntity<Void> saveAdvert(@RequestBody Advert advert, @PathVariable("id_user") int id_user , @PathVariable("newAdvertDate") String newAdvertDate, UriComponentsBuilder ucBuilder) {
    	Date date = new Date();
    	advert.setDate_registration(date);
    	advert.setId_user(id_user);
    	advertService.saveAdvert(advert);
    	log.info("saveAdvert " + id_user );
    	HttpHeaders headers = new HttpHeaders();
        headers.setLocation(ucBuilder.path("/advert/{id}").buildAndExpand(advert.getId()).toUri());
        return new ResponseEntity<Void>(headers, HttpStatus.CREATED);
    }
    
    //-------------------Get All Order--------------------------------------------------------    
    @RequestMapping(value = "/allOrder/", method = RequestMethod.GET)
    public ResponseEntity <List<Orders>> getAllOrder() {
    	List<Orders> list = orderService.getAllOrder();
    	if(list.isEmpty()){
    		log.info("getAllOrder ");
    		return new ResponseEntity <List<Orders>> (HttpStatus.NO_CONTENT);
    	}
    	return new ResponseEntity <List<Orders>> (list, HttpStatus.OK);
    }
    
    //-------------------Get All Advert--------------------------------------------------------    
    @RequestMapping(value = "/allAdvert/", method = RequestMethod.GET)
    public ResponseEntity <List<Advert>> getEveryAdvert() {
    	List<Advert> list = advertService.getEveryAdvert();
    	if(list.isEmpty()){
    		log.info("getEveryAdvert ");
    		return new ResponseEntity <List<Advert>> (HttpStatus.NO_CONTENT);
    	}
    	return new ResponseEntity <List<Advert>> (list, HttpStatus.OK);
    }
    
    //-------------------Get Transmission--------------------------------------------------------    
    @RequestMapping(value = "/transmission/", method = RequestMethod.GET)
    public ResponseEntity <List<Transmission>> getAllTransmission() {
    	List<Transmission> list = transmissionService.getAllTransmission();
    	if(list.isEmpty()){
    		log.info("getAllTransmission ");
    		return new ResponseEntity <List<Transmission>> (HttpStatus.NO_CONTENT);
    	}
    	return new ResponseEntity <List<Transmission>> (list, HttpStatus.OK);
    }
    
    //-------------------Get Role--------------------------------------------------------    
    @RequestMapping(value = "/role/", method = RequestMethod.GET)
    public ResponseEntity <List<Role>> getAllRole() {
    	List<Role> list = roleService.getAllRole();
    	if(list.isEmpty()){
    		log.info("getAllRole ");
    		return new ResponseEntity <List<Role>> (HttpStatus.NO_CONTENT);
    	}
    	return new ResponseEntity <List<Role>> (list, HttpStatus.OK);
    }
    
    //-------------------Get Model--------------------------------------------------------    
    @RequestMapping(value = "/model/", method = RequestMethod.GET)
    public ResponseEntity <List<Model>> getAllModel() {
    	List<Model> list = modelService.getAllModel();
    	if(list.isEmpty()){
    		log.info("getAllModel ");
    		return new ResponseEntity <List<Model>> (HttpStatus.NO_CONTENT);
    	}
    	return new ResponseEntity <List<Model>> (list, HttpStatus.OK);
    }
    
    //-------------------Get Marka--------------------------------------------------------    
    @RequestMapping(value = "/marka/", method = RequestMethod.GET)
    public ResponseEntity <List<Marka>> getAllMarka() {
    	List<Marka> list = markaService.getAllMarka();
    	if(list.isEmpty()){
    		log.info("getAllMarka ");
    		return new ResponseEntity <List<Marka>> (HttpStatus.NO_CONTENT);
    	}
    	return new ResponseEntity <List<Marka>> (list, HttpStatus.OK);
    }
    
    //-------------------Get Fuel--------------------------------------------------------    
    @RequestMapping(value = "/fuel/", method = RequestMethod.GET)
    public ResponseEntity <List<Fuel>> getAllFuel() {
    	List<Fuel> list = fuelService.getAllFuel();
    	if(list.isEmpty()){
    		log.info("getAllFuel ");
    		return new ResponseEntity <List<Fuel>> (HttpStatus.NO_CONTENT);
    	}
    	return new ResponseEntity <List<Fuel>> (list, HttpStatus.OK);
    }
    
    //-------------------Get Engine--------------------------------------------------------    
    @RequestMapping(value = "/engine/", method = RequestMethod.GET)
    public ResponseEntity <List<Engine>> getAllEngine() {
    	List<Engine> list = engineService.getAllEngine();
    	if(list.isEmpty()){
    		log.info("getAllEngine ");
    		return new ResponseEntity <List<Engine>> (HttpStatus.NO_CONTENT);
    	}
    	return new ResponseEntity <List<Engine>> (list, HttpStatus.OK);
    }

    //-------------------Get Drive--------------------------------------------------------    
    @RequestMapping(value = "/drive/", method = RequestMethod.GET)
    public ResponseEntity <List<Drive>> getAllDrive() {
    	List<Drive> list = driveService.getAllDrive();
    	if(list.isEmpty()){
    		log.info("getAllDrive ");
    		return new ResponseEntity <List<Drive>> (HttpStatus.NO_CONTENT);
    	}
    	return new ResponseEntity <List<Drive>> (list, HttpStatus.OK);
    }

    //-------------------Get Body--------------------------------------------------------    
    @RequestMapping(value = "/body/", method = RequestMethod.GET)
    public ResponseEntity <List<Body>> getAllBody() {
    	List<Body> list = bodyService.getAllBody();
    	if(list.isEmpty()){
    		log.info("getAllBody ");
    		return new ResponseEntity <List<Body>> (HttpStatus.NO_CONTENT);
    	}
    	return new ResponseEntity <List<Body>> (list, HttpStatus.OK);
    }
    
 //------------------- Update a Advert Active --------------------------------------------------------
    @RequestMapping(value = "/advert/updateActive/{id}", method = RequestMethod.PUT)
    public ResponseEntity updatActiveAdvert(@PathVariable("id") long id) {
    	if (id > 0 ) {
    		log.info("updatActiveAdvert " + id);
    		advertService.updateActiveAdvert(id);
    	}
		return null;
    }
    
    //-------------------Get New Advert--------------------------------------------------------
    @RequestMapping(value = "/photo/", method = RequestMethod.GET)
    public ResponseEntity <List> getAllPhoto() {
    	List list = advertService.getAllPhoto();
    	if(list.isEmpty()){
    		log.info("getAllPhoto ");
    		return new ResponseEntity <List> (HttpStatus.NO_CONTENT);
    	}
    	return new ResponseEntity <List> (list, HttpStatus.OK);
    }

    //-------------------Get New Advert--------------------------------------------------------
    @RequestMapping(value = "/advert/newadvert/", method = RequestMethod.GET)
    public ResponseEntity <List> getNewAdvert() {
    	List list = advertService.getNewAdvert();
    	if(list.isEmpty()){
    		log.info("getNewAdvert ");
    		return new ResponseEntity <List> (HttpStatus.NO_CONTENT);
    	}
    	return new ResponseEntity <List> (list, HttpStatus.OK);
    }

//-------------------Count Advert--------------------------------------------------------
    @RequestMapping(value = "/advert/count/", method = RequestMethod.GET)
    public ResponseEntity countNewAdvert() {
    	int  countAdvert = advertService.countNewAdvert();
    	if(countAdvert == 0){
    		log.info("countNewAdvert ");
    		return new ResponseEntity (HttpStatus.NO_CONTENT);
    	}
    	return new ResponseEntity (countAdvert, HttpStatus.OK);
    }
    
    //-------------------Retrieve All Advert--------------------------------------------------------
    @RequestMapping(value = "/advert/", method = RequestMethod.GET)
    public ResponseEntity <List> getAllAdvert() {
    	List list = advertService.getAllAdvert();
    	if(list.isEmpty()){
    		log.info("getAllAdvert ");
    		return new ResponseEntity <List> (HttpStatus.NO_CONTENT);
    	}
    	return new ResponseEntity <List> (list, HttpStatus.OK);
    }
    
    //-------------------Retrieve All Advert--------------------------------------------------------
    @RequestMapping(value = "/advert/{id}", method = RequestMethod.GET)
    public ResponseEntity <List> findById(@PathVariable("id") int id) {
    	List list = advertService.findById(id);
    	if(list.isEmpty()){
    		log.info("findById " + id);
    		return new ResponseEntity <List> (HttpStatus.NO_CONTENT);
    	}
    	return new ResponseEntity <List> (list, HttpStatus.OK);
    }
    
    //-------------------Retrieve All Users--------------------------------------------------------
    @RequestMapping(value = "/user/", method = RequestMethod.GET)
    public ResponseEntity<List<User>> listAllUsers() {
        List<User> users = userService.getAllUsers();
        if(users.isEmpty()){
        	log.info("listAllUsers ");
            return new ResponseEntity<List<User>>(HttpStatus.NO_CONTENT);
        }
        return new ResponseEntity<List<User>>(users, HttpStatus.OK);
    }

    //-------------------Count Users--------------------------------------------------------
    @RequestMapping(value = "/user/count/", method = RequestMethod.GET)
    public ResponseEntity countNewUser() {
    	int  countUser = userService.countNewUser();
    	if(countUser == 0){
    		log.info("countNewUser ");
    		return new ResponseEntity (HttpStatus.NO_CONTENT);
    	}
    	return new ResponseEntity (countUser, HttpStatus.OK);
    }
 
  //-------------------Retrieve All Category--------------------------------------------------------
    @RequestMapping(value = "/user/category/", method = RequestMethod.GET)
    public ResponseEntity<List<Category>> listAllCategory() {
        List<Category> category = categoryService.getAllCategory();
        if(category.isEmpty()){
        	log.info("listAllCategory ");
            return new ResponseEntity<List<Category>>(HttpStatus.NO_CONTENT);
        }
        return new ResponseEntity<List<Category>>(category, HttpStatus.OK);
    }
    
    //-------------------Retrieve Single User--------------------------------------------------------
    @RequestMapping(value = "/user/{id}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<User> getUser(@PathVariable("id") long id) {
        User user = userService.findById(id);
        if (user == null) {
        	log.info("getUser " + id);
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
    	try {
			emailsend.sendMessage(user.getEmail(), "Registration on Carriage", "You pass " + temp );
		} catch (IOException e) {
			log.error("createUser " + e);
		}
    	user.setPass(DigestUtils.md5Hex(temp));
    	user.setDate_registration(date);
 
        userService.saveUser(user);
 
        HttpHeaders headers = new HttpHeaders();
        headers.setLocation(ucBuilder.path("/user/{id}").buildAndExpand(user.getId()).toUri());
        return new ResponseEntity<Void>(headers, HttpStatus.CREATED);
    }
    
    //------------------- Update a User Active --------------------------------------------------------
    @RequestMapping(value = "/user/updateActive/{id}", method = RequestMethod.PUT)
    public ResponseEntity updatActiveUser(@PathVariable("id") long id) {
    	if (id > 0 ) {
    		log.info("updatActiveUser " + id);
    		userService.updateActiveUser(id);
    	}
		return null;
    }
     
    //------------------- Update a User --------------------------------------------------------
     
    @RequestMapping(value = "/user/{id}/{issued_passport}/{date_birthday}/{issued_license}/{valid_license}", method = RequestMethod.PUT)
    public ResponseEntity<User> updateUser(@PathVariable("id") long id, @PathVariable("issued_passport") String issued_passport, @PathVariable("date_birthday") String date_birthday, @PathVariable("issued_license") String issued_license, @PathVariable("valid_license") String valid_license, @RequestBody User user) {
    	Date date = new Date();
    	SimpleDateFormat formatter = new SimpleDateFormat("yyyy-M-d");
        User currentUser = userService.findById(id);
        if (currentUser==null) {
            return new ResponseEntity<User>(HttpStatus.NOT_FOUND);
        }
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        currentUser.setLast_name(user.getLast_name());
        currentUser.setFirst_name(user.getFirst_name());
        currentUser.setMidle_name(user.getMidle_name());
        currentUser.setSeries_passport(user.getSeries_passport());
        currentUser.setNumber_passport(user.getNumber_passport());
        currentUser.setIssued_by_passport(user.getIssued_by_passport());
        try {
			currentUser.setIssued_passport(date = formatter.parse(issued_passport));
			currentUser.setDate_birthday(date = formatter.parse(date_birthday));
			currentUser.setIssued_license(date = formatter.parse(issued_license));
			currentUser.setValid_license(date = formatter.parse(valid_license));
		} catch (ParseException e) {
			log.error("updateUser " + e);	
		}
        currentUser.setLocation_birthday(user.getLocation_birthday());
        currentUser.setSeries_license(user.getSeries_license());
        currentUser.setNumber_license(user.getNumber_license());
        currentUser.setIssued_by_license(user.getIssued_by_license());
        currentUser.setId_category(user.getId_category());
        currentUser.setPhoto(user.getPhoto());
        currentUser.setPhone(user.getPhone());
        currentUser.setEmail(user.getEmail());
        log.info("updateUser ");
        userService.updateUser(currentUser);
        return new ResponseEntity<User>(currentUser, HttpStatus.OK);
    }
    
    //------------------- Delete a User --------------------------------------------------------
    @RequestMapping(value = "/user/{id}", method = RequestMethod.DELETE)
    public ResponseEntity<User> deleteUser(@PathVariable("id") long id) {
        User user = userService.findById(id);
        if (user == null) {
            log.info("deleteUser " + id);
            return new ResponseEntity<User>(HttpStatus.NOT_FOUND);
        }
        userService.deleteUserById(id);
        return new ResponseEntity<User>(HttpStatus.NO_CONTENT);
    }
    
    //------------------- Delete All Users --------------------------------------------------------
    @RequestMapping(value = "/user/", method = RequestMethod.DELETE)
    public ResponseEntity<User> deleteAllUsers() {
        userService.deleteAllUsers();
        log.info("deleteAllUsers ");
        return new ResponseEntity<User>(HttpStatus.NO_CONTENT);
    }
 
    
//-------------------Get  All New User--------------------------------------------------------
    @RequestMapping(value = "/user/newuser/", method = RequestMethod.GET)
    public ResponseEntity <List> getNewUser() {
    	List list = userService.getNewUser();
    	if(list.isEmpty()){
    		log.info("getNewUser ");
    		return new ResponseEntity <List> (HttpStatus.NO_CONTENT);
    	}
    	return new ResponseEntity <List> (list, HttpStatus.OK);
    }
    
  //-------------------Log in a User--------------------------------------------------------
    @RequestMapping(value = "/user/login/{email}/{pass}", method = RequestMethod.GET)
    public ResponseEntity<User> login(@PathVariable("email") String email, @PathVariable("pass") String pass ) {
        User user = userService.findByEmail(email);
        if (user != null) {
        	if (DigestUtils.md5Hex(pass).equals(user.getPass())) {
        		log.info("login " + email );
        	 return new ResponseEntity<User>(user, HttpStatus.OK);
        	 }
        	return null;
        }else {
        	log.info("login " + email + " - " + pass);
        	return null;
        }
    }
    
    
//-------------------By Email--------------------------------------------------------
    @RequestMapping(value = "/user/byEmail/{email}", method = RequestMethod.GET)
    public ResponseEntity<User> login(@PathVariable("email") String email ) {
        User user = userService.findByEmail(email);
        if (user != null) {
        	log.info(" byEmail login " + email );
        	 return new ResponseEntity<User>(user, HttpStatus.OK);
        }else {
        	return null;
        }
    }
    
 //-------------------Profile in a User--------------------------------------------------------
    @RequestMapping(value = "/user/profile/{id}", method = RequestMethod.GET)
    public ResponseEntity<User> profile(@PathVariable("id") long id ) {
        User user = userService.findById(id);
        if (user != null) {
        	log.info("profile " + id );
        	 return new ResponseEntity<User>(user, HttpStatus.OK);
        }else {
        	return null;
        }
    }

  //-------------------getUserById--------------------------------------------------------
    @RequestMapping(value = "/user/getuserbyid/{id}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<User> getUserById(@PathVariable("id") long id) {
        User user = userService.findById(id);
        if (user == null) {
        	log.info("getUserById " + id );
            return new ResponseEntity<User>(HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<User>(user, HttpStatus.OK);
    }
}