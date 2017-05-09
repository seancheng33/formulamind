package au.com.phytoline.entity;

import java.util.Date;

/**
 * Product entity. @author MyEclipse Persistence Tools
 */

public class Product implements java.io.Serializable {
	private static final long serialVersionUID = 3275517595917557153L;
	// Fields

	private Integer pid;
	private String pname;
	private String pcode;
	private Date pdate;
	private String pinfo;

	// Constructors

	/** default constructor */
	public Product() {
	}

	/** full constructor */
	public Product(String pname, String pcode, Date pdate, String pinfo) {
		this.pname = pname;
		this.pcode = pcode;
		this.pdate = pdate;
		this.pinfo = pinfo;
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

}