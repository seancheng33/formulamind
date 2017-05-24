package au.com.phytoline.action;

import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;

import au.com.phytoline.entity.Pager;
import au.com.phytoline.entity.Product;
import au.com.phytoline.entity.ProductDetails;
import au.com.phytoline.service.ProductDetailsService;
import au.com.phytoline.service.ProductService;

import com.opensymphony.xwork2.ActionSupport;

public class ProductAction extends ActionSupport implements RequestAware,
		SessionAware {
	private static final long serialVersionUID = -2208805501107669256L;
	ProductService productService;
	ProductDetailsService productDetailsService;
	Pager pager;
	Product product;
	public Product getProduct() {
		return product;
	}


	public void setProduct(Product product) {
		this.product = product;
	}


	public Pager getPager() {
		return pager;
	}


	public void setPager(Pager pager) {
		this.pager = pager;
	}


	public void setProductService(ProductService productService) {
		this.productService = productService;
	}
	public void setProductDetailsService(
			ProductDetailsService productDetailsService) {
		this.productDetailsService = productDetailsService;
	}
	int pid;
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

	
	public String productList(){
		int curPage = 1;
		if (pager != null) {
			curPage = pager.getCurPage();
		}
		List productList =null;
		
		productList=productService.getAllProductBypage(curPage, 10);
		pager = productService.getCountOfProduct(10);
		
		pager.setCurPage(curPage);
		request.put("productList", productList);
		return "productlist";
	}
	
	public String productDetails(){
		Product product=productService.findProductById(pid);
		List productDetailses = productDetailsService.getDetailsByProductId(product.getPid());
		request.put("product", product);
		request.put("productDetailses", productDetailses);
		return "productDetails";
	}
	
	public String toAddProduct(){
		return "addProduct";
	}
	public String addProduct(){
		return "productlist";
	}
}
