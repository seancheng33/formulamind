package au.com.phytoline.entity;

import java.util.Date;

/**
 * Batch entity. @author MyEclipse Persistence Tools
 */

public class Batch implements java.io.Serializable {
	private static final long serialVersionUID = 5847725769209015842L;
	// Fields

	private Integer bid;
	private String batchSerials;
	private String productCode;
	private String productName;
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
	public Batch(String batchSerials, String productCode, String productName,
			String batchCode, Double batchQuantity, String operatorName,
			Date batchDate, String binfo) {
		this.batchSerials = batchSerials;
		this.productCode = productCode;
		this.productName = productName;
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

	public String getBatchSerials() {
		return this.batchSerials;
	}

	public void setBatchSerials(String batchSerials) {
		this.batchSerials = batchSerials;
	}

	public String getProductCode() {
		return this.productCode;
	}

	public void setProductCode(String productCode) {
		this.productCode = productCode;
	}

	public String getProductName() {
		return this.productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
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