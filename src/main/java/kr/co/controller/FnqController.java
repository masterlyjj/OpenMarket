package kr.co.controller;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.domain.FnqVO;
import kr.co.domain.PageTO;
import kr.co.service.FnqService;

@Controller
@RequestMapping("fnq")
public class FnqController {

	@Inject
	private FnqService fService;

	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public String insert(FnqVO vo) {
		fService.insert(vo);

		return "redirect:/fnq/read/" + vo.getFnq_no();
	}

	@RequestMapping(value = "/insertui", method = RequestMethod.GET)
	public String insertui() {
		return "fnq/insert";
	}

	@RequestMapping(value = "/read/{fnq_no}", method = RequestMethod.GET)
	public String read(@PathVariable("fnq_no") int fnq_no, Model model) {
		FnqVO vo = fService.read(fnq_no);

		model.addAttribute("vo", vo);
		model.addAttribute("curPage", 1);

		return "fnq/read";
	}

	@RequestMapping(value = "/read/{fnq_no}/{curPage}", method = RequestMethod.GET)
	public String read(@PathVariable("fnq_no") int fnq_no, @PathVariable("curPage") int curPage, Model model) {
		FnqVO vo = fService.read(fnq_no);

		model.addAttribute("vo", vo);
		model.addAttribute("curPage", curPage);

		return "fnq/read";
	}

	@RequestMapping(value = "/updateui/{fnq_no}/{curPage}", method = RequestMethod.GET)
	public String updateui(@PathVariable("fnq_no") int fnq_no, @PathVariable("curPage") int curPage, Model model) {

		FnqVO vo = fService.updateUI(fnq_no);

		model.addAttribute("vo", vo);
		model.addAttribute("curPage", curPage);

		return "fnq/update";
	}

	@RequestMapping(value = "/update/{fnq_no}/{curPage}", method = RequestMethod.POST)
	public String update(@PathVariable("fnq_no") int fnq_no, @PathVariable("curPage") int curPage, FnqVO vo) {
		vo.setFnq_no(fnq_no);

		fService.update(vo);

		return "redirect:/fnq/read/" + fnq_no + "/" + curPage;
	}

	@RequestMapping(value = "/delete/{fnq_no}/{curPage}", method = RequestMethod.POST)
	public String delete(@PathVariable("fnq_no") int fnq_no, @PathVariable("curPage") int curPage) {

		fService.delete(fnq_no);

		return "redirect:/fnq/list/" + curPage;

	}

	@RequestMapping(value = "/list/{curPage}", method = RequestMethod.GET)
	public ResponseEntity<PageTO<FnqVO>> list(@PathVariable("curPage") int curPage, PageTO<FnqVO> pt, Model model) {
		ResponseEntity<PageTO<FnqVO>> entity = null;
		
		pt.setCurPage(curPage);
		try {
			pt = fService.list(pt);
			entity = new ResponseEntity<PageTO<FnqVO>>(pt,HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<PageTO<FnqVO>>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void list(PageTO<FnqVO> pt, Model model) {
		pt = fService.list(pt);

		model.addAttribute("pt", pt);
	}

}
