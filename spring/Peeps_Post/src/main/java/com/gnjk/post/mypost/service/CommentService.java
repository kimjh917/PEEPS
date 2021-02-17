package com.gnjk.post.mypost.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gnjk.post.mypost.dao.PostDao;
import com.gnjk.post.mypost.domain.Comment;
import com.gnjk.post.mypost.domain.CommentRequest;

// 21.02.17 댓글 서비스 추가 한경
@Service
public class CommentService {

	private PostDao dao;

	@Autowired
	private SqlSessionTemplate template;

	// 댓글 조회
	// 인덱스로 아이디 검사해서 list.add
	public List<Comment> cmtSelect(int post_idx) {

		dao = template.getMapper(PostDao.class);

		return dao.selectCmtList(post_idx);
	}
	
	public int findCmt_idx(int post_idx, int idx) {
		
		List<Comment> comment = dao.selectCmtList(post_idx);

		int cmt_idx = comment.get(idx).getCmt_idx();
		
		return cmt_idx;
	}

	// 댓글 작성
	public int cmtInsert(CommentRequest request) {

		dao = template.getMapper(PostDao.class);

		int result = 0;

		Comment comment = request.GetCmt();

		result = dao.insertCmt(comment);

		return result;
	}

	// 댓글 수정
	public int cmtEdit(int post_idx, int idx, String cmt_content) {

		dao = template.getMapper(PostDao.class);

		int result = 0;

		List<Comment> comment = dao.selectCmtList(post_idx);

		int cmt_idx = comment.get(idx).getCmt_idx();
		
		System.out.println("댓글 수정 : " + cmt_content);

		result = dao.updateCmt(cmt_idx, cmt_content);

		return result;
	}

	// 댓글 삭제
	public int cmtDel(int idx, int post_idx) {

		dao = template.getMapper(PostDao.class);

		int result = 0;

		List<Comment> comment = dao.selectCmtList(post_idx);

		int cmt_idx = comment.get(idx).getCmt_idx();

		result = dao.deleteCmt(cmt_idx);

		return result;
	}

	// 댓글 수 조회
	public int CountCmt(int post_idx) {

		dao = template.getMapper(PostDao.class);

		int result = 0;

		result = dao.CountCmt(post_idx);

		return result;
	}

}