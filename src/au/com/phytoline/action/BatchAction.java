package au.com.phytoline.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;

import au.com.phytoline.entity.Batch;
import au.com.phytoline.entity.BatchDetails;
import au.com.phytoline.entity.Product;
import au.com.phytoline.entity.ProductDetails;
import au.com.phytoline.service.BatchDetailsService;
import au.com.phytoline.service.BatchService;
import au.com.phytoline.service.ProductDetailsService;
import au.com.phytoline.service.ProductService;
import com.opensymphony.xwork2.ActionSupport;

public class BatchAction extends ActionSupport implements RequestAware,
		SessionAware {
	private static final long serialVersionUID = -329127563999276279L;
	BatchService batchService;
	ProductService productService;
	ProductDetailsService productDetailsService;
	BatchDetailsService batchDetailsService;
	public void setBatchDetailsService(BatchDetailsService batchDetailsService) {
		this.batchDetailsService = batchDetailsService;
	}
	public void setProductDetailsService(ProductDetailsService productDetailsService) {
		this.productDetailsService = productDetailsService;
	}
	public void setBatchService(BatchService batchService) {
		this.batchService = batchService;
	}
	public void setProductService(ProductService productService) {
		this.productService = productService;
	}
	int pid;
	int bid;
	Batch batch;
	BatchDetails batchDetails;
	
	public BatchDetails getBatchDetails() {
		return batchDetails;
	}
	public void setBatchDetails(BatchDetails batchDetails) {
		this.batchDetails = batchDetails;
	}
	public Batch getBatch() {
		return batch;
	}
	public void setBatch(Batch batch) {
		this.batch = batch;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public int getPid() {
		return pid;
	}
	public void setBid(int bid) {
		this.bid = bid;
	}
	public int getBid() {
		return bid;
	}
	
	Map<String, Object> session;
	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

	Map<String, Object> request;

	@Override
	public void setRequest(Map<String, Object> request) {
		this.request = request;
	}

	public String toAddBatch(){
		List<?> productList = productService.getAllProduct();
		int serials =batchService.getLastBatchSerials()+1;
		request.put("productList",productList);
		request.put("serials",serials);
		return "newbatch";
	}
	public String doAddBatch(){
		Product product=productService.findProductById(pid);
		batch.setProduct(product);
		batchService.addBatch(batch);
		List<?> chemList = productDetailsService.getDetailsByProductId(pid);
		for(int i=0;i<chemList.size();i++){
			batchDetails = new BatchDetails();
		batchDetails.setBserials(batch.getBatchSerials());
		ProductDetails productDetails = (ProductDetails) chemList.get(i);
		batchDetails.setChemName(productDetails.getChemName());
		batchDetails.setBcode(batch.getBatchCode());
		batchDetails.setPname(batch.getProduct().getPname());
		batchDetails.setQuantity(batch.getBatchQuantity());
		batchDetails.setQtyRequired(productDetails.getPercent()*batch.getBatchQuantity()/100);
		batchDetailsService.addBatchDetails(batchDetails);
		}
		return "batchadd";
	}
	public String previonsBatchDetails(){
		List<?> batchList=batchService.getAllBatchByPager(1, 10);
		request.put("batchList", batchList);
		return "previonsBatchDetails";
	}
	
	public String previewBatch(){
		Product product=productService.findProductById(pid);
		batch.setProduct(product);
		List<?> chemList = productDetailsService.getDetailsByProductId(pid);
		List<BatchDetails> details = new ArrayList<BatchDetails>();
		for(int i=0;i<chemList.size();i++){
			batchDetails = new BatchDetails();
		batchDetails.setBserials(batch.getBatchSerials());
		ProductDetails productDetails = (ProductDetails) chemList.get(i);
		batchDetails.setChemName(productDetails.getChemName());
		batchDetails.setBcode(batch.getBatchCode());
		batchDetails.setPname(batch.getProduct().getPname());
		batchDetails.setQuantity(batch.getBatchQuantity());
		batchDetails.setQtyRequired(productDetails.getPercent()*batch.getBatchQuantity()/100);
		details.add(batchDetails);
		}
		request.put("details", details);
		return "previewBatch";	
	}
	
	public String batchDetails(){
		batch = batchService.getBatchById(bid);
		List<?> batchDetailsList=batchDetailsService.getBatchDetailsByBatchNo(batch.getBatchCode());
		request.put("batch", batch);
		request.put("batchDetailsList", batchDetailsList);
		return "batchDetails";	
	}
}
