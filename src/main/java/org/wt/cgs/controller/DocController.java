package org.wt.cgs.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/doc")
public class DocController {
	
	//private static final Logger logger = LoggerFactory.getLogger(DocController.class);
	
	@RequestMapping(value = "")
	public String index(){
		return "doc/index";
	}
	
//	@RequestMapping(value = "qrtypes")
//	public @ResponseBody List<String> qrtypes(){
//		logger.debug("getting types");
//		
//		List<String> types = new ArrayList<String>();
//		for(QR_TYPE qt : QR_TYPE.values()){
//			types.add(qt.toString());
//		}
//		
//		return types;
//	}
}
