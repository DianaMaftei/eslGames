package ro.jademy.domain.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 *
 * @author diana.maftei[at]gmail.com
 */
@Entity
@Table(name="Users")
public class SiteUser implements Serializable{
	@Id
	@GeneratedValue
	private Long id;
	private String fullName;
	private String password;
	
	@Column(name = "username", unique=true)
	private String username;
	private String email;
	
	@Enumerated(EnumType.STRING)
	private TypeOfUser typeOfUser;
	
	public String getEmail() {
		return email;
	}

	public String getFullName() {
		return fullName;
	}

	public Long getId() {
		return id;
	}

	public String getPassword() {
		return password;
	}

	public TypeOfUser getTypeOfUser() {
		return typeOfUser;
	}

	public String getUsername() {
		return username;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public void setTypeOfUser(TypeOfUser typeOfUser) {
		this.typeOfUser = typeOfUser;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	@Override
	public String toString() {
		return "User [fullName=" + fullName + ", username=" + username + ", email=" + email + ", password=" + password
				+ ", typeOfUser=" + typeOfUser + "]";
	}

}
