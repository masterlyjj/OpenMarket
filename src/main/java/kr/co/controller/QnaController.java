package kr.co.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.domain.PageTO;
import kr.co.domain.QnaVO;
import kr.co.service.QnaService;

@Controller
@RequestMapping("qna")
public class QnaController {

	@Autowired
	private QnaService qService;

	@RequestMapping(value = "/answer", method = RequestMethod.GET)
	public void answerui() {

	}

	@RequestMapping(value = "/answer", method = RequestMethod.POST)
	public void answer(QnaVO vo) {
		qService.answer(vo);
	}

	@RequestMapping(value = "/insert", method = RequestMethod.GET)
	public void insertui() {
	}

	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public void insert(QnaVO qvo) {
		qService.insert(qvo);
	}

	@RequestMapping(value = "/list/{board_no}/{curPage}", method = RequestMethod.GET)
	public ResponseEntity<PageTO<QnaVO>> list(@PathVariable("curPage") int curPage,
			@PathVariable("board_no") int board_no, PageTO<QnaVO> qpt) {
		ResponseEntity<PageTO<QnaVO>> entity = null;
		qpt.setCurPage(curPage);
		try {
			List<QnaVO> qlist = qService.list(qpt, board_no);
			qpt.setList(qlist);
			entity = new ResponseEntity<PageTO<QnaVO>>(qpt, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<PageTO<QnaVO>>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	@RequestMapping(value = "/listForMember/{member_id}", method = RequestMethod.GET)
	public String getMyAllReplies(@PathVariable("member_id") String member_id, PageTO<QnaVO> pt, Model model) {

		pt.setCurPage(1);

		pt = qService.listForMember(pt, member_id);

		model.addAttribute("pt", pt);

		return "mypage/myqna";
	}

	@RequestMapping(value = "/listForMember/{member_id}/{curPage}", method = RequestMethod.GET)
	public String getMyRepliesPage(@PathVariable("curPage") int curPage, @PathVariable("member_id") String member_id,
			PageTO<QnaVO> pt, Model model) {

		pt.setCurPage(curPage);

		pt = qService.listForMember(pt, member_id);

		model.addAttribute("pt", pt);

		return "mypage/myqna";
	}

	@RequestMapping(value = "/listOfAll", method = RequestMethod.GET)
	public String listOfAll(PageTO<QnaVO> pt, Model model) {

		pt.setCurPage(1);

		pt = qService.listOfAll(pt);

		model.addAttribute("pt", pt);

		return "qna/listOfAll";
	}

	@RequestMapping(value = "/listOfAll/{curPage}", method = RequestMethod.GET)
	public String listOfAll(@PathVariable("curPage") int curPage, PageTO<QnaVO> pt, Model model) {

		pt.setCurPage(curPage);

		pt = qService.listOfAll(pt);

		model.addAttribute("pt", pt);

		return "qna/listOfAll";
	}

	@RequestMapping(value = "/update/{qna_no}", method = RequestMethod.GET)
	public String updateUI(@PathVariable("qna_no") int qna_no, Model model) {

		QnaVO vo = qService.updateUI(qna_no);

		model.addAttribute("vo", vo);

		return "/qna/update";
	}

	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(QnaVO vo) {

		qService.update(vo);

		return "redirect:/qna/listOfAll/";
	}

	@RequestMapping(value = "/delete/{qna_no}", method = RequestMethod.GET)
	public String delete(@PathVariable("qna_no") int qna_no) {
		qService.delete(qna_no);

		return "redirect:/qna/listOfAll/";
	}
}
