package egovframework.let.cop.gal.service.impl;

import org.springframework.stereotype.Repository;

import egovframework.let.cop.gal.web.EgovGalVO;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

@Repository("EgovGALDAO")
public class EgovGALDAOImpl extends EgovAbstractDAO implements EgovGALDAO {
	
	@Override
	public void insertInfo(EgovGalVO egovGalVO) {
		insert("EgovGALDAO.insertImgBoard", egovGalVO);
	}
}
