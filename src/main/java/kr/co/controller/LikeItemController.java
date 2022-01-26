package kr.co.controller;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.domain.LikeItemVO;
import kr.co.domain.PageTO;
import kr.co.service.LikeItemService;

@Controller
@RequestMapping("likeitem")
public class LikeItemController {

	@Inject
	private LikeItemService likeService;

	@RequestMapping(value = "/list/{member_id}/{curPage}", method = RequestMethod.GET)
	public String list(@PathVariable("member_id") String member_id, @PathVariable("curPage") int curPage,
			PageTO<LikeItemVO> pt, Model model) {

		pt.setCurPage(curPage);

		pt = likeService.list(pt, member_id);

		model.addAttribute("pt", pt);

		return "likeitem/list";
	}

	@RequestMapping(value = "/list/{member_id}", method = RequestMethod.GET)
	public String list(@PathVariable("member_id") String member_id, PageTO<LikeItemVO> pt, Model model) {

		pt.setCurPage(1);

		pt = likeService.list(pt, member_id);

		model.addAttribute("pt", pt);

		return "likeitem/list";
	}

	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public ResponseEntity<Integer> dislike(LikeItemVO vo) {
		ResponseEntity<Integer> entity = null;
		try {
			likeService.delete(vo);
			entity = new ResponseEntity<Integer>(HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<Integer>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	@RequestMapping(value = "/count/{item_no}/{member_id}", method = RequestMethod.GET)
	public ResponseEntity<Integer> count(@PathVariable("item_no") int item_no,
			@PathVariable("member_id") String member_id) {
		ResponseEntity<Integer> entity = null;
		LikeItemVO vo = new LikeItemVO(0, item_no, member_id);
		int checklike = 0;
		try {
			checklike = likeService.count(vo);
			entity = new ResponseEntity<Integer>(checklike, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<Integer>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	@RequestMapping(value = "/insert/{item_no}/{member_id}", method = RequestMethod.POST)
	public ResponseEntity<Integer> addlike(@PathVariable("item_no") int item_no,
			@PathVariable("member_id") String member_id) {
		ResponseEntity<Integer> entity = null;
		LikeItemVO vo = new LikeItemVO(0, item_no, member_id);
		try {
			likeService.insert(vo);
			entity = new ResponseEntity<Integer>(HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<Integer>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
}
