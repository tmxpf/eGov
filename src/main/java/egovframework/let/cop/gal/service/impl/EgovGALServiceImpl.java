package egovframework.let.cop.gal.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.let.cop.gal.service.EgovGALService;
import egovframework.let.cop.gal.web.EgovGalVO;

@Service("EgovGALService")
public class EgovGALServiceImpl implements EgovGALService{

	@Autowired
	private EgovGALDAO egovGALDAO;
	
	@Override
	public void insertImgBoard(EgovGalVO egovGalVO) {
		egovGALDAO.insertInfo(egovGalVO);
	}
	
}
