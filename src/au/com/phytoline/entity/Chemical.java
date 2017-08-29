package au.com.phytoline.entity;


public class Chemical implements java.io.Serializable {

	// Fields
	
	private static final long serialVersionUID = 1438203747342327666L;
	private Integer cid;
	private Supplier supplier;
	private String cname;
	private Double price;

	// Constructors

	/** default constructor */
	public Chemical() {
	}

	/** full constructor */
	public Chemical(Supplier supplier, String cname, Double price) {
		this.supplier = supplier;
		this.cname = cname;
		this.price = price;
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

}