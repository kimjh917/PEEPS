package com.gnjk.peeps.guestbook;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.gnjk.peeps.guestbook.domain.Guestbook;
import com.gnjk.peeps.guestbook.domain.GuestbookEditRequest;
import com.gnjk.peeps.guestbook.domain.GuestbookListView;
import com.gnjk.peeps.guestbook.domain.GuestbookRequest;
import com.gnjk.peeps.guestbook.service.GuestbookDeleteService;
import com.gnjk.peeps.guestbook.service.GuestbookEditService;
import com.gnjk.peeps.guestbook.service.GuestbookInsertService;
import com.gnjk.peeps.guestbook.service.GuestbookListService;
import com.gnjk.peeps.guestbook.service.GuestbookRestService;

@RestController
@RequestMapping("/rest/guestbook")
public class GuestbookRestApiController {
	
	@Autowired
	private GuestbookRestService restService;
	@Autowired
	private GuestbookListService listService;
	@Autowired
	private GuestbookInsertService insertService;
	@Autowired
	private GuestbookDeleteService deleteService;
	private GuestbookEditService editService;
	
	/*
	 * @GetMapping public List<Guestbook> getGuestbookList(){
	 * 
	 * return listService.getGbookList(); }
	 */
	// LIST
	@GetMapping
	public GuestbookListView getlistview(@RequestParam(value = "p",defaultValue ="1")int page,Model model){
		return listService.getListView(page);
	}
	
	// 1개의 방명록 정보
	@GetMapping("/edit/{gidx}")
	public Guestbook getGuestbookInfo(@PathVariable("gidx") int gidx) {
		return restService.getGuestbook(gidx);
	}
	
	//방명록 정보 저장 
		@PostMapping("/upload")
		@ResponseBody
		public int guestbookComplete( GuestbookRequest gRequest, HttpServletRequest request,
				Model model) {
			
			return insertService.guestbook(gRequest, request);
		}
	
    //방명록 수정
	/* 수정 값 전달 */
		@PostMapping("/edit")
		@ResponseBody
		public int editGuestbook(GuestbookEditRequest editRequest, HttpServletRequest request) {
			
			return editService.editGuestbook(editRequest, request) ;
		}
		
	
	//방명록 삭제
	/* guestbook 삭제서비스 */
	@RequestMapping("/delete")
	@ResponseBody
	public int deleteMsg(@RequestParam("gidx") int gidx) {
					
			return deleteService.deleteMsg(gidx);
		}
	
	//방명록 존재 유무
	}
