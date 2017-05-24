package au.com.phytoline.entity;

import java.util.HashSet;
import java.util.Set;

/**
 * ProductDetails entity. @author MyEclipse Persistence Tools
 */

public class ProductDetails implements java.io.Serializable {

	// Fields

	private Integer pdid;
	private Chemical chemical;
	private Product product;
	private Integer position;
	private Double percent;
	private Double amount;
	private Set batchDetailses = new HashSet(0);

	// Constructors

	/** default constructor */
	public ProductDetails() {
	}

	/** full constructor */
	public ProductDetails(Chemical chemical, Product product, Integer position,
			Double percent, Double amount, Set batchDetailses) {
		this.chemical = chemical;
		this.product = product;
		this.position = position;
		this.percent = percent;
		this.amount = amount;
		this.batchDetailses = batchDetailses;
	}

	// Property accessors

	public Integer getPdid() {
		return this.pdid;
	}

	public void setPdid(Integer pdid) {
		this.pdid = pdid;
	}

	public Chemical getChemical() {
		return this.chemical;
	}

	public void setChemical(Chemical chemical) {
		this.chemical = chemical;
	}

	public Product getProduct() {
		return this.product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public Integer getPosition() {
		return this.position;
	}

	public void setPosition(Integer position) {
		this.position = position;
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

	public Set getBatchDetailses() {
		return this.batchDetailses;
	}

	public void setBatchDetailses(Set batchDetailses) {
		this.batchDetailses = batchDetailses;
	}

}