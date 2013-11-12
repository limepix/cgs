package org.devshots.cgs.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/demo")
public class DemoController {
	
	@RequestMapping(value = "")
	public String index(){
		return "demo/index";
	}
}