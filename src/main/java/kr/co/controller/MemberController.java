package kr.co.controller;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.io.ResolverUtil.IsA;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ser.std.FileSerializer;

import kr.co.domain.MemberVO;
import kr.co.domain.OrdersVO;
import kr.co.service.FileService;
import kr.co.service.ItemService;
import kr.co.service.MemberService;
import kr.co.service.OrderService;
import kr.co.service.ReviewService;

@Controller
@RequestMapping("member")
public class MemberController {

	@Inject
	private MemberService mService;
	
	@Inject
	private OrderService oService;
	
	@RequestMapping(value = "/mypage/{member_id}", method = RequestMethod.GET)
	public String mypage(@PathVariable("member_id") String member_id, Model model) {
		List<OrdersVO> ovo = oService.list(member_id);
		
		model.addAttribute("ovo", ovo);
			
		return "mypage/mypage";
	}


	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout() {
		return "redirect:/";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String loginPost(MemberVO vo, Model model) {
		MemberVO login = mService.login(vo);
		model.addAttribute("login", login);
		return "member/read";
	}

	@RequestMapping(value = "/loginUI", method = RequestMethod.GET)
	public String login() {
		return "member/login";
	}
	
	@RequestMapping(value="/requestResist/{member_id}", method=RequestMethod.GET)
	public String requestResist(@PathVariable("member_id")String member_id) {
		mService.requestResist(member_id);
		return "/cs/cspage";
	}

	@RequestMapping(value = "/idcheck", method = RequestMethod.POST, produces = "text/html; charset=UTF-8")
	@ResponseBody
	public String idcheck(String member_id) {
		MemberVO vo = mService.idcheck(member_id);
		if (vo == null) {
			return "사용이 가능한 아이디 입니다";
		} else {
			return "사용이 불가능한 아이디 입니다";
		}
	}

	@RequestMapping(value = "/insert", method = RequestMethod.GET)
	public void insertUI() {
	}

	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public String insert(MemberVO vo) {
		mService.insertMember(vo);
		return "redirect:/";
	}

	@RequestMapping(value = "/read/{member_id}", method = RequestMethod.GET)
	public String read(@PathVariable("member_id") String member_id, Model model) {
		MemberVO vo = mService.read(member_id);
		model.addAttribute("vo", vo);
		return "member/read";
	}

	@RequestMapping(value = "/update/{member_id}", method = RequestMethod.GET)
	public String updateUI(@PathVariable("member_id") String member_id, Model model) {
		MemberVO vo = mService.updateUI(member_id);
		model.addAttribute("vo", vo);
		return "/member/update";
	}

	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(MemberVO vo) {
		mService.update(vo);
		return "redirect:/member/read/" + vo.getMember_id();
	}

	@RequestMapping(value = "/delete/{member_id}", method = RequestMethod.GET)
	public String deleteUI(@PathVariable("member_id") String member_id, Model model) {
		MemberVO vo = mService.deleteUI(member_id);
		model.addAttribute("vo", vo);

		return "member/delete";
	}

	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String delete(MemberVO vo) {
		mService.delete(vo);
		return "redirect:/";
	}

	@RequestMapping(value = "/passChk", method = RequestMethod.POST)
	@ResponseBody
	public int passChk(MemberVO vo) {
		int result = mService.passChk(vo);
		return result;
	}
	
}
