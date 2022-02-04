package kr.co.controller;


import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.domain.OrdersVO;
import kr.co.domain.PageTO;
import kr.co.service.OrderService;


@Controller
@RequestMapping("seller")
public class SellerController {
	
	@Inject
	private OrderService oService;
	
	@RequestMapping(value="/sellerpage", method=RequestMethod.GET)
	public void sellerpage() {
		
	}
	@RequestMapping(value="/sellerCheckOrder/{member_id}", method=RequestMethod.GET)
	public String sellerCheckOrder(PageTO<OrdersVO> pt, @PathVariable("member_id")String member_id,Model model) {
			pt = oService.sellerCheckOrder(pt, member_id);
			model.addAttribute("pt", pt);
			model.addAttribute("member_id", member_id);
		return "/seller/sellerCheckOrder";
	}
	@RequestMapping(value="/sellerCheckOrder/{member_id}/{curPage}", method=RequestMethod.GET)
	public String sellerCheckOrder(PageTO<OrdersVO> pt, @PathVariable("member_id")String member_id, @PathVariable("curPage")int curPage, Model model) {
		pt = oService.sellerCheckOrder(pt, member_id);
		model.addAttribute("pt", pt);
		model.addAttribute("member_id", member_id);
		return "/seller/sellerCheckOrder";
	}
}

