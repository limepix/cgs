package org.devshots.cgs.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.devshots.cgs.config.Config;
import org.devshots.cgs.service.QrGeneratorService;
import org.devshots.cgs.service.RenderService;
import org.devshots.cgs.service.QrGeneratorService.QR_TYPE;

@Controller
public class RenderController {
	
	@Autowired
	private RenderService renderService;
	
	@Autowired
	private QrGeneratorService qrGeneratorService;
	
	@Autowired
	private Config config;

	private static final Logger logger = LoggerFactory.getLogger(RenderController.class);
	
	@RequestMapping(value = "/qr", method = RequestMethod.GET)
	public void qr(@RequestParam(value = "type", required = true) QR_TYPE type,
									   @RequestParam(value = "size", required = false) Integer size,
									   HttpServletRequest request,
									   HttpServletResponse response) {
		
		size = (size == null) ? config.getDefaultSize() : size.intValue();
				
		logger.info(request.getRemoteHost() + "(" + request.getRemoteAddr() + ")" + ": " + request.getRequestURI() + "?" + request.getQueryString());
		
		@SuppressWarnings("unchecked")
		String text = qrGeneratorService.generate(type, request.getParameterMap());	
		
		if(text == null){
			response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
			return;
		}
		
		renderService.renderQrCode(text, size, response);
	}
	
}