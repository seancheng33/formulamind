package au.com.phytoline.entity;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * Supplier entity. @author MyEclipse Persistence Tools
 */

public class Supplier implements java.io.Serializable {

	// Fields

	private Integer sid;
	private String sname;
	private String address;
	private String suburb;
	private String postcode;
	private String phone;
	private String fax;
	private String contact;
	private Date screatedate;
	private Date smodifydate;
	private Set chemicals = new HashSet(0);

	// Constructors

	/** default constructor */
	public Supplier() {
	}

	/** full constructor */
	public Supplier(String sname, String address, String suburb,
			String postcode, String phone, String fax, String contact,
			Date screatedate, Date smodifydate, Set chemicals) {
		this.sname = sname;
		this.address = address;
		this.suburb = suburb;
		this.postcode = postcode;
		this.phone = phone;
		this.fax = fax;
		this.contact = contact;
		this.screatedate = screatedate;
		this.smodifydate = smodifydate;
		this.chemicals = chemicals;
	}

	// Property accessors

	public Integer getSid() {
		return this.sid;
	}

	public void setSid(Integer sid) {
		this.sid = sid;
	}

	public String getSname() {
		return this.sname;
	}

	public void setSname(String sname) {
		this.sname = sname;
	}

	public String getAddress() {
		return this.address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getSuburb() {
		return this.suburb;
	}

	public void setSuburb(String suburb) {
		this.suburb = suburb;
	}

	public String getPostcode() {
		return this.postcode;
	}

	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}

	public String getPhone() {
		return this.phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getFax() {
		return this.fax;
	}

	public void setFax(String fax) {
		this.fax = fax;
	}

	public String getContact() {
		return this.contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}

	public Date getScreatedate() {
		return this.screatedate;
	}

	public void setScreatedate(Date screatedate) {
		this.screatedate = screatedate;
	}

	public Date getSmodifydate() {
		return this.smodifydate;
	}

	public void setSmodifydate(Date smodifydate) {
		this.smodifydate = smodifydate;
	}

	public Set getChemicals() {
		return this.chemicals;
	}

	public void setChemicals(Set chemicals) {
		this.chemicals = chemicals;
	}

}