package au.com.phytoline.entity;

/**
 * BatchDetails entity. @author MyEclipse Persistence Tools
 */

public class BatchDetails implements java.io.Serializable {

	private static final long serialVersionUID = -2614479252914940989L;
	// Fields

	private Integer bdid;
	private String bserials;
	private String pname;
	private String batch;
	private Double quantity;
	private Double qtyRequired;

	// Constructors

	/** default constructor */
	public BatchDetails() {
	}

	/** full constructor */
	public BatchDetails(String bserials, String pname, String batch,
			Double quantity, Double qtyRequired) {
		this.bserials = bserials;
		this.pname = pname;
		this.batch = batch;
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

	public String getBserials() {
		return this.bserials;
	}

	public void setBserials(String bserials) {
		this.bserials = bserials;
	}

	public String getPname() {
		return this.pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public String getBatch() {
		return this.batch;
	}

	public void setBatch(String batch) {
		this.batch = batch;
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