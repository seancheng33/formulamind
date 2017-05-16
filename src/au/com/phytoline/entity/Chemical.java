package au.com.phytoline.entity;

import java.util.HashSet;
import java.util.Set;

/**
 * Chemical entity. @author MyEclipse Persistence Tools
 */

public class Chemical implements java.io.Serializable {

	// Fields

	private Integer cid;
	private Supplier supplier;
	private String cname;
	private Double price;
	private Set productDetailses = new HashSet(0);

	// Constructors

	/** default constructor */
	public Chemical() {
	}

	/** full constructor */
	public Chemical(Supplier supplier, String cname, Double price,
			Set productDetailses) {
		this.supplier = supplier;
		this.cname = cname;
		this.price = price;
		this.productDetailses = productDetailses;
	}

	// Property accessors

	public Integer getCid() {
		return this.cid;
	}

	public void setCid(Integer cid) {
		this.cid = cid;
	}

	public Supplier getSupplier() {
		return this.supplier;
	}

	public void setSupplier(Supplier supplier) {
		this.supplier = supplier;
	}

	public String getCname() {
		return this.cname;
	}

	public void setCname(String cname) {
		this.cname = cname;
	}

	public Double getPrice() {
		return this.price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public Set getProductDetailses() {
		return this.productDetailses;
	}

	public void setProductDetailses(Set productDetailses) {
		this.productDetailses = productDetailses;
	}

}