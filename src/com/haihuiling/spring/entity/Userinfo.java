package com.haihuiling.spring.entity;

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Parameter;

/**
 * Userinfo entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "USERINFO")
public class Userinfo implements java.io.Serializable {

	// Fields

	/**
	 * 
	 */
	private static final long serialVersionUID = -1732272314938820508L;
	private String userid;
	private String username;
	private String userage;
	private Date userbirthday;
	private String useraddress;
	private String usersex;
	private String userjob;

	// Constructors

	/** default constructor */
	public Userinfo() {
	}

	/** minimal constructor */
	public Userinfo(String userid, String username) {
		this.userid = userid;
		this.username = username;
	}

	/** full constructor */
	public Userinfo(String userid, String username, String userage,
			Date userbirthday, String useraddress, String usersex,
			String userjob) {
		this.userid = userid;
		this.username = username;
		this.userage = userage;
		this.userbirthday = userbirthday;
		this.useraddress = useraddress;
		this.usersex = usersex;
		this.userjob = userjob;
	}

	@Id
	//@GenericGenerator(name = "idGenerator", strategy = "sequence",parameters ={@Parameter(name = "sequence", value = "myseq")})
	//@GeneratedValue(generator = "idGenerator")
	@Column(name = "USERID", unique = true, nullable = false, length = 20)
	public String getUserid() {
		return this.userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	@Column(name = "USERNAME", nullable = false, length = 20)
	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	@Column(name = "USERAGE", length = 2)
	public String getUserage() {
		return this.userage;
	}

	public void setUserage(String userage) {
		this.userage = userage;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "USERBIRTHDAY", length = 7)
	public Date getUserbirthday() {
		return this.userbirthday;
	}

	public void setUserbirthday(Date userbirthday) {
		this.userbirthday = userbirthday;
	}

	@Column(name = "USERADDRESS", length = 30)
	public String getUseraddress() {
		return this.useraddress;
	}

	public void setUseraddress(String useraddress) {
		this.useraddress = useraddress;
	}

	@Column(name = "USERSEX", length = 3)
	public String getUsersex() {
		return this.usersex;
	}

	public void setUsersex(String usersex) {
		this.usersex = usersex;
	}

	@Column(name = "USERJOB", length = 20)
	public String getUserjob() {
		return this.userjob;
	}

	public void setUserjob(String userjob) {
		this.userjob = userjob;
	}
}