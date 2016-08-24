package ro.jademy.domain.entity;
/**
*
*@author diana.maftei[at]gmail.com
*/
public enum Level {
	STARTERS("Starters"), MOVERS("Movers"), FLYERS("Flyers");
	
	private String name;

	private Level(String name) {
		this.name = name;
	}

	public String getName() {
		return name;
	}
}
