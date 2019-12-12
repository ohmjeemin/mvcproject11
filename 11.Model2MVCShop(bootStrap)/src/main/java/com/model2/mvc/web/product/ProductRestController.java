package com.model2.mvc.web.product;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.product.ProductService;

@RestController
@RequestMapping("/product/*")
public class ProductRestController {

	// Field
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;

	public ProductRestController() {
		System.out.println(this.getClass());
	}

	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	@Value("#{commonProperties['pageSize']}")
	int pageSize;

	
	@RequestMapping(value="json/addProduct", method = RequestMethod.POST)
	public void addProduct(@RequestBody Product product) throws Exception {
		
		System.out.println("/product/json/addProduct");
		
		if (product.getManuDate() != null) {
			product.setManuDate(product.getManuDate().replaceAll("-", ""));
		}
		
		if(product.getFileName()==null) {
			product.setFileName("BHlbAAAAvetFNwAA.jpg");
		}
		productService.addProduct(product);
	
	}
	
	
	// getProduct
	@RequestMapping(value = "json/getProduct/{prodNo}", method = RequestMethod.GET)
	public Product getProduct(@PathVariable int prodNo) throws Exception {

		System.out.println("/product/json/getProduct");

		return productService.getProduct(prodNo);

	}

	// updateProduct : GET
	@RequestMapping(value = "json/updateProduct/{prodNo}", method = RequestMethod.GET)
	public Product updateProductView(@PathVariable int prodNo) throws Exception {

		System.out.println("/product/json/updateProduct : GET");

		return productService.getProduct(prodNo);
	}

	// updateProduct : POST
	@RequestMapping(value = "json/updateProduct", method = RequestMethod.POST)
	public void updateProductView(@RequestBody Product product) throws Exception {

		System.out.println("/product/json/updateProduct : POST");

		productService.updateProduct(product);

	}

	// listProduct : GET
	@RequestMapping(value = "json/listProduct", method = RequestMethod.GET)
	public Map<String, Object> listProduct() throws Exception {

		System.out.println("/product/json/listProduct : GET");

		Search search = new Search();
		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);

		Map<String, Object> map = new HashMap<String, Object>();

		map = productService.getProductList(search);
		
		Page resultPage = new Page(search.getCurrentPage(), ((Integer) map.get("totalCount")).intValue(), pageUnit,
				pageSize);
		System.out.println(resultPage);

		Map<String, Object> hmap = new HashMap<String, Object>();

		hmap.put("list", map.get("list"));
		hmap.put("search", search);
		hmap.put("resultPage", resultPage);
		
		System.out.println(hmap);
		
		return hmap;
	}
	
	@RequestMapping(value= "json/autoProduct", method = RequestMethod.POST)
	public List<String> autoProduct(@RequestBody Map<String, String> map) throws Exception {
	
		System.out.println("/product/json/autoProduct : POST");
		List<String> list = productService.getProdAuto(map);
		
		
		
		for(String str: list) {
			System.out.println(":::::"+str);
		}
	
		return list;
	}
	
	

	
	@RequestMapping(value = "json/listProduct", method = RequestMethod.POST)
	public Map<String, Object> listProduct(@RequestBody Map<String, Object> map) throws Exception {

		System.out.println("/product/json/listProduct : POST");
		
		System.out.println("mapsize>>>>>>>>>>>>>>>>>>>>>>>"+ map.size());
		System.out.println("map>>>>>>>>>>>>>>>>>>>>"+   map);
		
		ObjectMapper objMapper = new ObjectMapper();
		Search search = objMapper.convertValue(map.get("search"), Search.class);
		
		
		//Search search =(Search)map.get("search");
		
		System.out.println("search>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"+ search);
		
		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		
		search.setPageSize(pageSize);


		/*
		 * if(search.getOrderCondition()==null) { search.setOrderCondition("0"); }
		 */
	   	
		//System.out.println("1:>>>>>>>>>>>>CurrentPage>>>>> "+ search.getCurrentPage());
		Map<String, Object> mapp = new HashMap<String, Object>();
		
	
		
		mapp = productService.getProductList(search);
		System.out.println("2:>>>>>>>>>>>>prodService.getProductList(search)°á°ú mapp>>>>> "+ mapp);
	
		Page resultPage = new Page(search.getCurrentPage(), ((Integer) mapp.get("totalCount")).intValue(), pageUnit,
				pageSize);
		
	
		System.out.println(resultPage);

		
		
		Map<String, Object> hmap = new HashMap<String, Object>();

		hmap.put("list", mapp.get("list"));
		hmap.put("search", search);
		hmap.put("resultPage", resultPage);
		
		System.out.println(hmap);
		
		return hmap;
	}

	
	
}
