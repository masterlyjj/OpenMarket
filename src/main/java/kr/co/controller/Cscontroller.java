package kr.co.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("cs")
public class Cscontroller {
	

	@RequestMapping(value="/cspage", method = RequestMethod.GET)
	public void cspage() {
	}
}
