package au.com.phytoline.entity;

/**
 * ProductDetails entity. @author MyEclipse Persistence Tools
 */

public class ProductDetails implements java.io.Serializable {

	// Fields

	private Integer pdid;
	private Product product;
	private String pcode;
	private Integer position;
	private String chemName;
	private Double chemPrice;
	private Double percent;
	private Double amount;

	// Constructors

	/** default constructor */
	public ProductDetails() {
	}

	/** full constructor */
	public ProductDetails(Product product, String pcode, Integer position,
			String chemName, Double chemPrice, Double percent, Double amount) {
		this.product = product;
		this.pcode = pcode;
		this.position = position;
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

	public Product getProduct() {
		return this.product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public String getPcode() {
		return this.pcode;
	}

	public void setPcode(String pcode) {
		this.pcode = pcode;
	}

	public Integer getPosition() {
		return this.position;
	}

	public void setPosition(Integer position) {
		this.position = position;
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