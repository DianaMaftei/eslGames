package ro.jademy.presentation;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author diana.maftei[at]gmail.com
 */
@Controller
public class GamesController {

	@RequestMapping(value = "/")
	public String home() {
		System.out.println("in controller home");
		return "hello";
	}
	
	@RequestMapping(value = "/gamesHome")
	public String gamesHome() {
		return "gamesHome";
	}
	
	@RequestMapping(value = "/memory")
	public String memory() {
		return "memory";
	}
	
	@RequestMapping(value = "/unscramble")
	public String unscramble() {
		return "unscramble";
	}
	
	@RequestMapping(value = "/hangman")
	public String hangman() {
		return "hangman";
	}
	
}
