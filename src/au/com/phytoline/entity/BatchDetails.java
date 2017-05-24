package au.com.phytoline.entity;

/**
 * BatchDetails entity. @author MyEclipse Persistence Tools
 */

public class BatchDetails implements java.io.Serializable {

	// Fields

	private Integer bdid;
	private Batch batch;
	private ProductDetails productDetails;
	private String chemName;
	private Double quantity;
	private Double qtyRequired;

	// Constructors

	/** default constructor */
	public BatchDetails() {
	}

	/** full constructor */
	public BatchDetails(Batch batch, ProductDetails productDetails,
			String chemName, Double quantity, Double qtyRequired) {
		this.batch = batch;
		this.productDetails = productDetails;
		this.chemName = chemName;
		this.quantity = quantity;
		this.qtyRequired = qtyRequired;
	}

	// Property accessors

	public Integer getBdid() {
		return this.bdid;
	}

	public void setBdid(Integer bdid) {
		this.bdid = bdid;
	}

	public Batch getBatch() {
		return this.batch;
	}

	public void setBatch(Batch batch) {
		this.batch = batch;
	}

	public ProductDetails getProductDetails() {
		return this.productDetails;
	}

	public void setProductDetails(ProductDetails productDetails) {
		this.productDetails = productDetails;
	}

	public String getChemName() {
		return this.chemName;
	}

	public void setChemName(String chemName) {
		this.chemName = chemName;
	}

	public Double getQuantity() {
		return this.quantity;
	}

	public void setQuantity(Double quantity) {
		this.quantity = quantity;
	}

	public Double getQtyRequired() {
		return this.qtyRequired;
	}

	public void setQtyRequired(Double qtyRequired) {
		this.qtyRequired = qtyRequired;
	}

}