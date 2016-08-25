package ro.jademy.presentation;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import ro.jademy.domain.entity.Level;
import ro.jademy.domain.entity.LoginMessages;
import ro.jademy.domain.entity.SiteUser;
import ro.jademy.domain.service.LoginService;

/**
 *
 * @author diana.maftei[at]gmail.com
 */
@Controller
@Scope("session")
public class GamesController {
	
	@Autowired
	LoginService login;

	@RequestMapping(value = "/")
	public String home() {
		return "index";
	}
	
	@RequestMapping(value = "/games", method=RequestMethod.GET)
	public String games(Model model) {
		model.addAttribute("user", new SiteUser());
		return "games";
	}
	
	@RequestMapping(value = "/login", method=RequestMethod.POST)
	public ModelAndView signIn(@ModelAttribute("user")SiteUser user, HttpServletRequest request, HttpServletResponse response) {
		System.out.println(login);
		
		LoginMessages loginMess = login.doLogin(user.getUsername(), user.getPassword());

		if (LoginMessages.SUCCESS.equals(loginMess)) {
			SiteUser loggedIn = login.getUser(user.getUsername());
			request.getSession().setAttribute("log", loggedIn);
			response.addCookie(new Cookie("foo", "bar"));
			return new ModelAndView("redirect:games");
		} else {
			System.err.println("failure to login");
			return new ModelAndView("redirect:games");
		}
	}
	
	@RequestMapping(value = "/register", method=RequestMethod.POST)
	public String signUp(@ModelAttribute("user")SiteUser user) {
		System.out.println(user.getUsername());
		

		//RegisterMessages regMess = register.registerUser(fullName, username, password1, password2, email, userType);
		
//		if (RegisterMessages.SUCCESS.equals(regMess)) {		
//		} else {
//		}
		
		return "greeting";
	}
	
	@RequestMapping(value="/levelsDrop")
	public String selectLevel(Model model){
		model.addAttribute("levels", Level.values());
		return "levels";
	}
		
	@RequestMapping(method = RequestMethod.GET, value = "header")
	public String header() {
	    return "header";
	}
	
	@RequestMapping(method = RequestMethod.GET, value = "game1")
	public String unscramble() {
		return "unscramble";
	}
	
	@RequestMapping(method = RequestMethod.GET, value = "game2")
	public String memory() {
		return "memory";
	}
		
	@RequestMapping(method = RequestMethod.GET, value = "game3")
	public String hangman() {
		return "hangman";
	}
	
	@RequestMapping(method = RequestMethod.GET, value = "footer")
	public String footer() {
	    return "footer";
	}
}
