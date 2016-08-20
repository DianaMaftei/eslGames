package ro.jademy.domain.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import ro.jademy.domain.entity.Level;
import ro.jademy.domain.entity.Theme;
import ro.jademy.domain.entity.Word;
import ro.jademy.persistence.WordDAO;

/**
*
*@author diana.maftei[at]gmail.com
*/
public class WordService {

	@Autowired
	WordDAO wordDAO;
	
	public List<Word> getWords(int numberOfWords, Level level, Theme theme){
		return wordDAO.getRandomWords(numberOfWords, level, theme);
	}
}
