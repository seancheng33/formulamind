package au.com.phytoline.entity;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * Product entity. @author MyEclipse Persistence Tools
 */

public class Product implements java.io.Serializable {

	// Fields

	private Integer pid;
	private String pname;
	private String pcode;
	private Date pdate;
	private String pinfo;
	private Set batchs = new HashSet(0);

	// Constructors

	/** default constructor */
	public Product() {
	}

	/** full constructor */
	public Product(String pname, String pcode, Date pdate, String pinfo, Set batchs) {
		this.pname = pname;
		this.pcode = pcode;
		this.pdate = pdate;
		this.pinfo = pinfo;
		this.batchs = batchs;
	}

	// Property accessors

	public Integer getPid() {
		return this.pid;
	}

	public void setPid(Integer pid) {
		this.pid = pid;
	}

	public String getPname() {
		return this.pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public String getPcode() {
		return this.pcode;
	}

	public void setPcode(String pcode) {
		this.pcode = pcode;
	}

	public Date getPdate() {
		return this.pdate;
	}

	public void setPdate(Date pdate) {
		this.pdate = pdate;
	}

	public String getPinfo() {
		return this.pinfo;
	}

	public void setPinfo(String pinfo) {
		this.pinfo = pinfo;
	}

	public Set getBatchs() {
		return this.batchs;
	}

	public void setBatchs(Set batchs) {
		this.batchs = batchs;
	}

}