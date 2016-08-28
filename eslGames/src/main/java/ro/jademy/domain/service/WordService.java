package ro.jademy.domain.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ro.jademy.domain.entity.Level;
import ro.jademy.domain.entity.Theme;
import ro.jademy.domain.entity.Word;
import ro.jademy.persistence.WordDAO;

/**
 *
 * @author diana.maftei[at]gmail.com
 */
@Service
public class WordService {

	@Autowired
	WordDAO wordDAO;

	private List<Word> getWords(int numberOfWords, Level level, Theme theme) {
		return wordDAO.getRandomWords(numberOfWords, level, theme);
	}

	public Map<String, String> getScrambled(int numberOfWords, Level level, Theme theme) {
		Map<String, String> scrambledWords = new HashMap<String, String>();

		List<Word> words = getWords(numberOfWords, level, theme);

		for (Word word : words) {
			String initial = word.getWord();
			String scrambled = scramble(initial);
			scrambledWords.put(initial, scrambled);
		}

		return scrambledWords;
	}

	public List<String> getWordList(int numberOfWords, Level level, Theme theme) {
		List<String> wordList = new ArrayList<>();
		List<Word> words = getWords(numberOfWords, level, theme);

		for (Word word : words) {
			wordList.add(word.getWord());
		}
		return wordList;
	}

	private String scramble(String word) {
		Random random = new Random();

		char wordChar[] = word.toCharArray();

		for (int i = 0; i < wordChar.length - 1; i++) {
			int j = random.nextInt(wordChar.length - 1);
			// Swap letters
			char temp = wordChar[i];
			wordChar[i] = wordChar[j];
			wordChar[j] = temp;
		}
		return new String(wordChar);
	}
}
