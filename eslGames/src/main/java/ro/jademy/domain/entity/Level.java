package ro.jademy.domain.entity;
/**
*
*@author diana.maftei[at]gmail.com
*/
public enum Level {
	STARTERS("Starters"), MOVERS("Movers"), FLYERS("Flyers");
	
	private String level;
	
	private Level(String level) {
		this.level = level;
	}

	public String getLevel() {
		return level;
	}
}
