package au.com.phytoline.entity;

/**
 * ProductDetails entity. @author MyEclipse Persistence Tools
 */

public class ProductDetails implements java.io.Serializable {

	// Fields

	private Integer pdid;
	private String pcode;
	private String pname;
	private Integer pId;
	private Integer position;
	private Integer chemId;
	private String chemName;
	private Double chemPrice;
	private Double percent;
	private Double amount;

	// Constructors

	/** default constructor */
	public ProductDetails() {
	}

	/** full constructor */
	public ProductDetails(Integer pId, Integer position, Integer chemId, String chemName,
			Double chemPrice, Double percent, Double amount) {
		//this.pcode = pcode;
		this.pId = pId;
		this.position = position;
		this.chemId = chemId;
		this.chemName = chemName;
		this.chemPrice = chemPrice;
		this.percent = percent;
		this.amount = amount;
	}

	// Property accessors

	public Integer getPdid() {
		return this.pdid;
	}

	public void setPdid(Integer pdid) {
		this.pdid = pdid;
	}

	public Integer getpId() {
		return pId;
	}

	public void setpId(Integer pId) {
		this.pId = pId;
	}
	
//	public String getPcode() {
//		return this.pcode;
//	}
//
//	public void setPcode(String pcode) {
//		this.pcode = pcode;
//	}
//
//	public String getPname() {
//		return this.pname;
//	}
//
//	public void setPname(String pname) {
//		this.pname = pname;
//	}

	public Integer getPosition() {
		return this.position;
	}

	public void setPosition(Integer position) {
		this.position = position;
	}

	public Integer getChemId() {
		return this.chemId;
	}

	public void setChemId(Integer chemId) {
		this.chemId = chemId;
	}

	public String getChemName() {
		return this.chemName;
	}

	public void setChemName(String chemName) {
		this.chemName = chemName;
	}

	public Double getChemPrice() {
		return this.chemPrice;
	}

	public void setChemPrice(Double chemPrice) {
		this.chemPrice = chemPrice;
	}

	public Double getPercent() {
		return this.percent;
	}

	public void setPercent(Double percent) {
		this.percent = percent;
	}

	public Double getAmount() {
		return this.amount;
	}

	public void setAmount(Double amount) {
		this.amount = amount;
	}

}