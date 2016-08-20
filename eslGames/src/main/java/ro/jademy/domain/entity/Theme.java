package ro.jademy.domain.entity;
/**
*
*@author diana.maftei[at]gmail.com
*/
public enum Theme {
	ANIMALS("Animals"), CLOTHES("Clothes"), SPORT("Sport"), TOYS("Toys"), MISC("Other"), FAMILY("Family"), COLOR("Colors");
	
	private String theme;

	private Theme(String theme) {
		this.theme = theme;
	}

	public String getTheme() {
		return theme;
	}
}
