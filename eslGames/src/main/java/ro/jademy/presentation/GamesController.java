package ro.jademy.presentation;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import ro.jademy.domain.entity.Level;

/**
 *
 * @author diana.maftei[at]gmail.com
 */
@Controller
public class GamesController {

	@RequestMapping(value = "/")
	public String home() {
		return "index";
	}
	
	@RequestMapping(value = "/games")
	public String games() {
		return "games";
	}
	
	@RequestMapping(value = "/login")
	public String signIn() {
		return "games";
	}
	
	@RequestMapping(value = "/register")
	public String signUp() {
		return "games";
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
	
}
