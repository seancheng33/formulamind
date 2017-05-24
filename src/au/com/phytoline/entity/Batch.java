package au.com.phytoline.entity;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * Batch entity. @author MyEclipse Persistence Tools
 */

public class Batch implements java.io.Serializable {

	// Fields

	private Integer bid;
	private Product product;
	private String batchSerials;
	private String batchCode;
	private Double batchQuantity;
	private String operatorName;
	private Date batchDate;
	private String binfo;
	private Set batchDetailses = new HashSet(0);

	// Constructors

	/** default constructor */
	public Batch() {
	}

	/** full constructor */
	public Batch(Product product, String batchSerials, String batchCode,
			Double batchQuantity, String operatorName, Date batchDate,
			String binfo, Set batchDetailses) {
		this.product = product;
		this.batchSerials = batchSerials;
		this.batchCode = batchCode;
		this.batchQuantity = batchQuantity;
		this.operatorName = operatorName;
		this.batchDate = batchDate;
		this.binfo = binfo;
		this.batchDetailses = batchDetailses;
	}

	// Property accessors

	public Integer getBid() {
		return this.bid;
	}

	public void setBid(Integer bid) {
		this.bid = bid;
	}

	public Product getProduct() {
		return this.product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public String getBatchSerials() {
		return this.batchSerials;
	}

	public void setBatchSerials(String batchSerials) {
		this.batchSerials = batchSerials;
	}

	public String getBatchCode() {
		return this.batchCode;
	}

	public void setBatchCode(String batchCode) {
		this.batchCode = batchCode;
	}

	public Double getBatchQuantity() {
		return this.batchQuantity;
	}

	public void setBatchQuantity(Double batchQuantity) {
		this.batchQuantity = batchQuantity;
	}

	public String getOperatorName() {
		return this.operatorName;
	}

	public void setOperatorName(String operatorName) {
		this.operatorName = operatorName;
	}

	public Date getBatchDate() {
		return this.batchDate;
	}

	public void setBatchDate(Date batchDate) {
		this.batchDate = batchDate;
	}

	public String getBinfo() {
		return this.binfo;
	}

	public void setBinfo(String binfo) {
		this.binfo = binfo;
	}

	public Set getBatchDetailses() {
		return this.batchDetailses;
	}

	public void setBatchDetailses(Set batchDetailses) {
		this.batchDetailses = batchDetailses;
	}

}