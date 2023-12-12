package org.team.faq;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.team.mapper.FaqBoardMapper;

import lombok.extern.log4j.Log4j;

@Log4j
@Service

public class FaqServiceImpl implements FaqService {
	@Autowired
	private FaqBoardMapper FAQMapper;

	// FAQ 불러오기
	@Override
	public List<FaqBoardVO> getList() {
		log.info("getList");
		return FAQMapper.getList();
	}

	// FAQ 작성
	@Override
	public void faqInsert(FaqBoardVO fVO) {
		log.info("insert");
		FAQMapper.faqInsert(fVO);
	}

	// 각 FAQ 보기
	@Override
	public FaqBoardVO faqDetail(int faqId) {
		return FAQMapper.faqDetail(faqId);
	}

	// 각 FAQ 수정
	@Override
	public void faqEdit(FaqBoardVO fVO) {
		FAQMapper.faqEdit(fVO);
	}

	// 각 FAQ 삭제
	@Override
	public void faqDelete(int faqId) {
		FAQMapper.faqDelete(faqId);
	}

	// FAQ 개수 구하기
	@Override
	public int faqCount() {
		return FAQMapper.faqCount();
	}

	// 목록 + 페이징
	public List<FaqBoardVO> faqListPage(int displayPost, int postNum) {
		return FAQMapper.faqListPage(displayPost, postNum);
	}
	
	public int updateViewCount(int faqId) {
		return FAQMapper.updateViewCount(faqId);
	}
	
	public void faqReplyInsert(FaqReplyVO rVO) {
		FAQMapper.faqReplyInsert(rVO);
		
	}
	
	public List<FaqReplyVO> faqReplyList(int faqId) {
		return FAQMapper.faqReplyList(faqId);
	}
}