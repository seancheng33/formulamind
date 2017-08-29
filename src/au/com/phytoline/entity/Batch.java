package au.com.phytoline.entity;

import java.util.Date;

public class Batch implements java.io.Serializable {

	// Fields
	private static final long serialVersionUID = -1359638526878098340L;
	private Integer bid;
	private Product product;
	private Integer batchSerials;
	private String batchCode;
	private Double batchQuantity;
	private String operatorName;
	private Date batchDate;
	private String binfo;

	// Constructors

	/** default constructor */
	public Batch() {
	}

	/** full constructor */
	public Batch(Product product, Integer batchSerials, String batchCode,
			Double batchQuantity, String operatorName, Date batchDate,
			String binfo) {
		this.product = product;
		this.batchSerials = batchSerials;
		this.batchCode = batchCode;
		this.batchQuantity = batchQuantity;
		this.operatorName = operatorName;
		this.batchDate = batchDate;
		this.binfo = binfo;
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

	public Integer getBatchSerials() {
		return this.batchSerials;
	}

	public void setBatchSerials(Integer batchSerials) {
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

}