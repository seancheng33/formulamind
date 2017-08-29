package au.com.phytoline.entity;

public class BatchDetails implements java.io.Serializable {

	// Fields

	private static final long serialVersionUID = 7070994756662384079L;
	private Integer bdid;
	private Integer bserials;
	private String pname;
	private String bcode;
	private String chemName;
	private Double quantity;
	private Double qtyRequired;

	// Constructors

	/** default constructor */
	public BatchDetails() {
	}

	/** full constructor */
	public BatchDetails(Integer bserials, String pname, String bcode,
			String chemName, Double quantity, Double qtyRequired) {
		this.bserials = bserials;
		this.pname = pname;
		this.bcode = bcode;
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

	public Integer getBserials() {
		return this.bserials;
	}

	public void setBserials(Integer bserials) {
		this.bserials = bserials;
	}

	public String getPname() {
		return this.pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public String getBcode() {
		return this.bcode;
	}

	public void setBcode(String bcode) {
		this.bcode = bcode;
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