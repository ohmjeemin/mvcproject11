package com.model2.mvc.web.purchase;

import java.util.HashMap;
import java.util.Map;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.Purchase;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.product.ProductService;
import com.model2.mvc.service.purchase.PurchaseService;
import com.model2.mvc.service.user.UserService;

@RestController
@RequestMapping("/purchase/*")
public class PurchaseRestController {

	//Field
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	
	@Autowired
	@Qualifier("purchaseServiceImpl")
	private PurchaseService purchaseService; 
	
	public PurchaseRestController() {
		System.out.println(this.getClass());
	}
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	@RequestMapping(value="json/addPurchase/{prodNo}", method = RequestMethod.GET)
	public Product addPurchase(@PathVariable int prodNo) throws Exception {
		
		System.out.println("/purchase/json/addPurchaseView/{prodNo}:  GET");
		
		System.out.println("    prodNo ::: "+prodNo);
		
		return productService.getProduct(prodNo);
		
	}
	
	//addPurchase 
	@RequestMapping(value="json/addPurchase", method=RequestMethod.POST)
	public Purchase addPurchase(@RequestBody Map<String, Object> map) throws Exception {
		
		System.out.println("/purchase/addPurchase:  POST");
		System.out.println(map);
		int prodNo = (Integer)(map.get("prodNo"));
		String userId = (String)(map.get("userId"));
		
		Product purchaseProd = productService.getProduct(prodNo);
		//System.out.println("@@@@@@@@@@@@purchaseProd"+purchaseProd);
	
		
		User buyer = userService.getUser(userId);
		//System.out.println("$$$$$$$$$$$$buyer"+ buyer);
		
		ObjectMapper objMapper = new ObjectMapper();
		Purchase purchase = objMapper.convertValue(map.get("purchase"), Purchase.class);
		
		//Purchase purchase = (Purchase)map.get("purchase");
		purchase.setBuyer(buyer);
		
		purchase.setPurchaseProd(purchaseProd);
		
		System.out.println(purchase);
		purchaseService.addPurchase(purchase);
		
		return purchase;
	}
	
	//getPurchase by tranNo
	@RequestMapping(value = "json/getPurchase/{tranNo}", method = RequestMethod.GET)
	public Purchase getPurchase(@PathVariable int tranNo) throws Exception {

		System.out.println("/purchase/json/getPurchase by tranNo");

		
		return purchaseService.getPurchase(tranNo);
	}
	
	//updatePurchase : GET
	@RequestMapping(value = "json/updatePurchase/{tranNo}", method = RequestMethod.GET)
	public Purchase updatePurchase(@PathVariable int tranNo) throws Exception {

		System.out.println("/purchase/json/updatePurchase : GET");

		return  purchaseService.getPurchase(tranNo);
	}

	
	//updatePurchase : POST 
	@RequestMapping(value="json/updatePurchase", method = RequestMethod.POST)
	public void updatePurchase(@RequestBody Purchase purchase) throws Exception {
		System.out.println("/purchase/json/updatePurchase : POST");
		purchaseService.updatePurchase(purchase);

	}
	
	//updateTranCode : POST 
	@RequestMapping(value="json/updateTranCode")
	public void updateTranCode(@RequestBody Purchase purchase) throws Exception {
		System.out.println("/purchase/json/updateTranCode : POST");
		purchase.setTranCode("3");
		purchaseService.updateTranCode(purchase);
		
	}
	
	//updateTranCodeByProd : POST 
	@RequestMapping(value="json/updateTranCodeByProd")
	public void updateTranCodeByProd(@RequestBody Purchase purchase) throws Exception {
		System.out.println("/purchase/json/updateTranCodeByProd : POST");
	//	Product product = productService.getProduct(prodNo);
		purchase.setTranCode("2");
		purchaseService.updateTranCode2(purchase);
		
	}
	
	@RequestMapping(value="json/listPurchase", method = RequestMethod.POST)
	public Map<String,Object> listPurchase(@RequestBody Map<String, Object> map) throws Exception {
		
		System.out.println("purchase/json/listPurchase  :  POST");
		
		ObjectMapper objMapper = new ObjectMapper();
		Search search = objMapper.convertValue(map.get("search"), Search.class);
		
		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
	
		search.setPageSize(pageSize);
		
		String buyerId = (String)map.get("buyerId");
		
		Map<String, Object> resultMap =  purchaseService.getPurchaseList(search, buyerId);
		Page resultPage = new Page(search.getCurrentPage(), ((Integer) resultMap.get("totalCount")).intValue(), pageUnit,
				pageSize);
		
		System.out.println("resultMap:::::::::::::::::::::::"+resultMap);
		System.out.println("¾ß!!!!!!!!!!!!!!!!!!!!!!!!!!"+resultMap.size());
		
		System.out.println("========resultPage?=========="+resultPage);
		System.out.println("========list?=========="+resultMap.get("list"));
		System.out.println("========search?=========="+search);

		Map<String, Object> returnMap = new HashMap<String, Object>();

		returnMap.put("list", resultMap.get("list"));
		returnMap.put("search", search);
		returnMap.put("resultPage", resultPage);
		
		
		return returnMap;
	}
	
	
	
	@RequestMapping(value="json/listPurchase/{buyerId}", method = RequestMethod.GET)
	public Map<String,Object> listPurchase(@PathVariable String buyerId) throws Exception {
		
		System.out.println("purchase/json/listPurchase/{buyerId}  :  GET");
		
		ObjectMapper objMapper = new ObjectMapper();
		Search search = new Search();
		
		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
	
		search.setPageSize(pageSize);
		
		Map<String, Object> resultMap =  purchaseService.getPurchaseList(search, buyerId);
		Page resultPage = new Page(search.getCurrentPage(), ((Integer) resultMap.get("totalCount")).intValue(), pageUnit,
				pageSize);
		
		System.out.println("resultMap:::::::::::::::::::::::"+resultMap);
		
		System.out.println("========resultPage?=========="+resultPage);
		System.out.println("========list?=========="+resultMap.get("list"));
		System.out.println("========search?=========="+search);

		Map<String, Object> returnMap = new HashMap<String, Object>();

		returnMap.put("list", resultMap.get("list"));
		returnMap.put("search", search);
		returnMap.put("resultPage", resultPage);
		
		
		return returnMap;
	}
	
	
	
	
	@RequestMapping(value="json/listSale", method = RequestMethod.POST)
	public Map<String,Object> listSale(@RequestBody Map<String, Object> map) throws Exception {
		
		System.out.println("purchase/json/listPurchase");
		
		ObjectMapper objMapper = new ObjectMapper();
		Search search = objMapper.convertValue(map.get("search"), Search.class);
		
		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
	
		search.setPageSize(pageSize);
		
		//String buyerId = (String)map.get("buyerId");
		
		Map<String, Object> resultMap =  purchaseService.getSaleList(search);
		Page resultPage = new Page(search.getCurrentPage(), ((Integer) resultMap.get("totalCount")).intValue(), pageUnit,
				pageSize);
		
		System.out.println("resultMap:::::::::::::::::::::::"+resultMap);
		System.out.println("¾ß!!!!!!!!!!!!!!!!!!!!!!!!!!"+resultMap.size());
		
		System.out.println("========resultPage?=========="+resultPage);
		System.out.println("========list?=========="+resultMap.get("list"));
		System.out.println("========search?=========="+search);

		Map<String, Object> returnMap = new HashMap<String, Object>();

		returnMap.put("list", resultMap.get("list"));
		returnMap.put("search", search);
		returnMap.put("resultPage", resultPage);
		
		
		return returnMap;
	}
	
	@RequestMapping(value="json/listPurchase", method = RequestMethod.GET)
	public Map<String,Object> listSale() throws Exception {
		
		System.out.println("purchase/json/listPurchase/");
		
		ObjectMapper objMapper = new ObjectMapper();
		Search search = new Search();
		
		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
	
		search.setPageSize(pageSize);
		  
		Map<String, Object> resultMap =  purchaseService.getSaleList(search);
		Page resultPage = new Page(search.getCurrentPage(), ((Integer) resultMap.get("totalCount")).intValue(), pageUnit,
				pageSize);
		
		System.out.println("resultMap:::::::::::::::::::::::"+resultMap);
		System.out.println("¾ß!!!!!!!!!!!!!!!!!!!!!!!!!!"+resultMap.size());
		
		System.out.println("========resultPage?=========="+resultPage);
		System.out.println("========list?=========="+resultMap.get("list"));
		System.out.println("========search?=========="+search);

		Map<String, Object> returnMap = new HashMap<String, Object>();

		returnMap.put("list", resultMap.get("list"));
		returnMap.put("search", search);
		returnMap.put("resultPage", resultPage);
		
		
		return returnMap;
	}
	
	
	
}

