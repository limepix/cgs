package org.devshots.cgs.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ImpressumController {
	
	@RequestMapping("/imprint")
	public String impressum(){
		return "imprint";
	}
}
