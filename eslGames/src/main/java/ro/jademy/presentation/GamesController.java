package ro.jademy.presentation;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author diana.maftei[at]gmail.com
 */
@Controller
public class GamesController {

	@RequestMapping(value = "/")
	public String home() {
		System.out.println("in controller home");
		return "home";
	}
	
	@RequestMapping(value = "/games")
	public String games() {
		return "games";
	}
	
	@RequestMapping(method = RequestMethod.GET, value = "header")
	public String header() {
	    return "header";
	}
	
	@RequestMapping(method = RequestMethod.GET, value = "game2")
	public String memory() {
		return "memory";
	}
	
	@RequestMapping(method = RequestMethod.GET, value = "game1")
	public String unscramble() {
		return "unscramble";
	}
	
	@RequestMapping(method = RequestMethod.GET, value = "game3")
	public String hangman() {
		return "hangman";
	}
	
}
