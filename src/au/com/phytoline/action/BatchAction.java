package au.com.phytoline.action;

import java.util.Date;
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
		List productList = productService.getAllProduct();
		request.put("productList",productList);
		return "newbatch";
	}
	public String doAddBatch(){
		Product product=productService.findProductById(pid);
//		if(batch.getBatchDate().equals(null)||batch.getBatchDate()==null){
//			batch.setBatchDate(new Date());
//			System.out.println(new Date());
//		}
		batch.setProduct(product);
		batchService.addBatch(batch);
		
		return "batchadd";
	}
	public String previonsBatchDetails(){
		List batchList=batchService.getAllBatchByPager(1, 10);
		request.put("batchList", batchList);
		return "previonsBatchDetails";
	}
	
	public String previewBatch(){
		batch = (Batch) session.get(batch);
		System.out.println(batch);
		request.put("batch", batch);
		return "previewBatch";	
	}
}
