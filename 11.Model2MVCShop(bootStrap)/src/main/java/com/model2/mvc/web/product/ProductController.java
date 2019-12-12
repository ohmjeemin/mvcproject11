package com.model2.mvc.web.product;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.fileupload.DiskFileUpload;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.product.ProductService;

@Controller
@RequestMapping("/product/*")
public class ProductController {

	//Field
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
	
	public ProductController() {
		System.out.println(this.getClass());
	}
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	
	
	
	//@RequestMapping("/addProductView")
	@RequestMapping(value="addProduct" , method=RequestMethod.GET)
	public String addProductView() throws Exception {
	
		System.out.println("/product/addProductView   :   GET");
		
		return "redirect:/product/addProductView.jsp";
	}
	
	//@RequestMapping("/addProduct")
	@RequestMapping(value="addProduct" , method=RequestMethod.POST)
	public String addProduct(@ModelAttribute("product") Product product, Model model) throws Exception{
	
		System.out.println("/product/addProduct    :   POST");
		String filesName ="";
		String defaultFile ="default.PNG";
		//String filePath = "C:\\workspace\\09.Model2MVCShop(jQuery)\\WebContent\\images\\uploadFiles";
		String filePath = "C:\\workspace\\11.Model2MVCShop(bootStrap)\\WebContent\\images\\uploadFiles";
		
		
		List<MultipartFile> fileList = product.getFiles();
		List<String> fn = new ArrayList();
		
		if(product.getManuDate()!=null) {
			product.setManuDate(product.getManuDate().replaceAll("-", ""));		
		}
		
		
		System.out.println("전!!!!!!!!!!!!!!!!!!!!!");
		System.out.println(product.getManuDate().replaceAll("-", ""));
		
		System.out.println(product.getFiles().get(0).isEmpty());
		
		System.out.println("::::::::::::::::"+fileList);
		
		if(fileList.get(0).isEmpty()==false && fileList.size()>0 ) {
			
			System.out.println("널 이 아닐때!!!!!!!!");
			System.out.println("::::::::::::::::"+fileList);
			
						
			 for (int i = 0; i < fileList.size(); i++) {
				
				filesName += fileList.get(i).getOriginalFilename()+",";
				fn.add(fileList.get(i).getOriginalFilename());
			}
		
		
			
				for (int i = 0; i < fileList.size(); i++) {
					String fileName = fn.get(i);
					fileList.get(i).transferTo(new File(filePath, fileName));
				}
				
			
			product.setFileName(filesName);
			
			System.out.println(filesName);	
			System.out.println(fileList);
		
		
		}else if(fileList.get(0).isEmpty()==true) {
			
			product.setFileName(defaultFile);
			
		}
		
		
		productService.addProduct(product);
		System.out.println(product);
		model.addAttribute("product", product);
		
		
		//MultipartFile file = product.getFile();
		//String fileName = file.getOriginalFilename();
		//String filePath = "C:\\Users\\user\\git\\repository\\07.Model2MVCShop(URI,pattern)\\07.Model2MVCShop(URI,pattern)\\WebContent\\images\\uploadFiles";
		//file.transferTo(new File(filePath, fileName));
		
		
		//product.setFileName(fileName);
		//productService.addProduct(product);
		//model.addAttribute("product",product);
		
				
		
		return "forward:/product/addProduct.jsp";
	} 
	
	
	
	//@RequestMapping("/getProduct")
	@RequestMapping(value="getProduct", method = RequestMethod.GET)
	public String getProduct(@ModelAttribute("product") Product product , Model model ) throws Exception {
		
		System.out.println("/product/getProduct   :   GET");
	
		product = productService.getProduct(product.getProdNo());
		String[] fileNameArr = product.getFileName().split(",");
	
		for(String a : fileNameArr) {
			System.out.println(a);
		}
		
		model.addAttribute("fileNameArr",fileNameArr);
		model.addAttribute("product", product);
		
		return "forward:/product/readProduct.jsp";
	}
	
	
	
	//@RequestMapping("/updateProductView")
	@RequestMapping(value = "updateProduct", method =RequestMethod.GET)
	public String updateProductView(@ModelAttribute Product product , Model model ) throws Exception {

		System.out.println("/product/updateProduct>>>>>GET 컨트롤러 왔어요");
		
		System.out.println("updateProdct 의 prodNo>>>>>>>>>>>>>>"+product.getProdNo());
		//System.out.println("updateProdct 의 prodNo>>>>>>>>>>>>>>"+product.getFileName());
		
		
		product = productService.getProduct(product.getProdNo());
		model.addAttribute("product", product);
		
		return "forward:/product/updateProduct.jsp";
	}
	
	
	//@RequestMapping("/updateProduct")
	@RequestMapping(value = "updateProduct", method =RequestMethod.POST)
	public String updateProduct( @ModelAttribute("product") Product product) throws Exception{
		System.out.println(product);
		System.out.println("/product/updateProduct>>>>>POST  컨트롤러 왔어요");
		System.out.println("updateProdct 의 prodNo>>>>>>>>>>>>>>"+product.getProdNo());
		
	   	productService.updateProduct(product);
	
		return "redirect:/product/getProduct?prodNo="+product.getProdNo();
	}
	
	
	
	
	//@RequestMapping("/listProduct")
	@RequestMapping(value="listProduct")
	public String listProduct(@ModelAttribute("Search") Search search, @RequestParam("menu") String menu, Model model) throws Exception{

		System.out.println("/product/listProduct     :    POST /  GET");
		//Business Logic
		System.out.println(">>>>>>>>>>>>>Search>>>>>>>>>>>>>>>>확인하라>>>>>>>>>>" + search);
		
	   	if(search.getCurrentPage()==0) {
	   		search.setCurrentPage(1);
	   	}
	   	search.setPageSize(pageSize);
	   	
	   	//이거 밑에 두줄 지워보기... 
	   	if(search.getOrderCondition()==null) {
	   		search.setOrderCondition("0");
	   	}
	   	
	   	Map<String, Object> map = productService.getProductList(search);
	   	
	  	Page resultPage	= 
				new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
	  	
	  	List<Product> list = (List<Product>)map.get("list");
	  	
		  	for (Product prod : list) {
		  		//System.out.println(":::::::::::::::::::::::"+prod.getFileName());
		  		if(prod.getFileName()!=null && prod.getFileName().indexOf(",")!=-1){
		  			prod.setFileName(prod.getFileName().split(",")[0]);
		  		}
		  	}
		  	
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		model.addAttribute("menu", menu);
		

		return "forward:/product/listProduct.jsp";
	}
	
	
}
