package au.com.phytoline.entity;

/**
 * ProductDetails entity. @author MyEclipse Persistence Tools
 */

public class ProductDetails implements java.io.Serializable {
	private static final long serialVersionUID = -905320498031572183L;
	
	// Fields

	private Integer pdid;
	private String pname;
	private String pcode;
	private Integer position;
	private Integer chemId;
	private String chemical;
	private Long price;
	private Double percent;
	private Double amount;

	// Constructors

	/** default constructor */
	public ProductDetails() {
	}

	/** full constructor */
	public ProductDetails(String pname, String pcode, Integer position,
			Integer chemId, String chemical, Long price, Double percent,
			Double amount) {
		this.pname = pname;
		this.pcode = pcode;
		this.position = position;
		this.chemId = chemId;
		this.chemical = chemical;
		this.price = price;
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

	public String getChemical() {
		return this.chemical;
	}

	public void setChemical(String chemical) {
		this.chemical = chemical;
	}

	public Long getPrice() {
		return this.price;
	}

	public void setPrice(Long price) {
		this.price = price;
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