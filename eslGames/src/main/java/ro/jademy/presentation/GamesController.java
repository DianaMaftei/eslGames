package ro.jademy.presentation;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import ro.jademy.domain.entity.Level;
import ro.jademy.domain.entity.LoginMessages;
import ro.jademy.domain.entity.SiteUser;
import ro.jademy.domain.entity.Theme;
import ro.jademy.domain.service.LoginService;
import ro.jademy.domain.service.WordService;

/**
 *
 * @author diana.maftei[at]gmail.com
 */
@Controller
@Scope("session")
public class GamesController {

	@Autowired
	LoginService login;

	@Autowired
	WordService wordService;

	@RequestMapping(value = "/")
	public String home() {
		return "index";
	}

	@RequestMapping(value = "/games", method = RequestMethod.GET)
	public String games(Model model) {
		model.addAttribute("user", new SiteUser());
		model.addAttribute("levels", Level.values());
		return "games";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public ModelAndView signIn(@ModelAttribute("user") SiteUser user, HttpServletRequest request,
			HttpServletResponse response) {
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

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String signUp(@ModelAttribute("user") SiteUser user) {
		System.out.println(user.getUsername());
		// RegisterMessages regMess = register.registerUser(fullName, username,
		// password1, password2, email, userType);

		// if (RegisterMessages.SUCCESS.equals(regMess)) {
		// } else {
		// }
		return "greeting";
	}

	@RequestMapping(method = RequestMethod.GET, value = "header")
	public String header() {
		return "header";
	}

	@RequestMapping(method = RequestMethod.GET, value = "gamesMenu")
	public String gamesMenu() {
		return "gamesMenu";
	}

	@RequestMapping(method = RequestMethod.GET, value = "game1")
	public String unscramble(@RequestParam("level") String level, @RequestParam("theme") String theme, Model model) {	
		Level gameLevel = null;
		if(!level.equals("empty")){
			gameLevel = Level.valueOf(level);
		}		
		Theme gameTheme = null;
		if(!theme.equals("empty")){
			gameTheme = Theme.valueOf(theme);
		}			
		Map<String, String> words = wordService.getScrambled(5, gameLevel, gameTheme);
		JSONObject wordsJSON = new JSONObject(words);
		model.addAttribute("words", wordsJSON);
		return "unscramble";
	}
	
	@RequestMapping(method = RequestMethod.GET, value = "game2")
	public String memory(@RequestParam("level") String level, @RequestParam("theme") String theme, Model model) {
		Level gameLevel = null;
		if(!level.equals("empty")){
			gameLevel = Level.valueOf(level);
		}		
		Theme gameTheme = null;
		if(!theme.equals("empty")){
			gameTheme = Theme.valueOf(theme);
		}
		List<String> wordsSingle = wordService.getWordList(8, gameLevel, gameTheme);
		List<String> wordsDouble = new ArrayList<>(wordsSingle);
		wordsDouble.addAll(wordsSingle);
		long seed = System.nanoTime();
		Collections.shuffle(wordsDouble, new Random(seed));
		model.addAttribute("words", new JSONArray(wordsDouble));
		return "memory";
	}

	@RequestMapping(method = RequestMethod.GET, value = "game3")
	public String hangman(@RequestParam("level") String level, @RequestParam("theme") String theme, Model model) {
		Level gameLevel = null;
		if(!level.equals("empty")){
			gameLevel = Level.valueOf(level);
		}		
		Theme gameTheme = null;
		if(!theme.equals("empty")){
			gameTheme = Theme.valueOf(theme);
		}
		String word = wordService.getWordList(1, gameLevel, gameTheme).get(0);
		model.addAttribute("word", word);
		return "hangman";
	}

	@RequestMapping(method = RequestMethod.GET, value = "footer")
	public String footer() {
		return "footer";
	}
}
