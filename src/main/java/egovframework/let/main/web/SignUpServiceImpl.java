package egovframework.let.main.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.let.cop.com.service.MemberVO;

@Service("SignUpService")
public class SignUpServiceImpl implements SignUpService{

	@Autowired
	SignUpDAO signUpDAO;
	
	@Override
	public void insertMemberInfo(MemberVO vo) {
		signUpDAO.insertSignUp(vo);
	}

	@Override
	public MemberVO selectMemberInfo(MemberVO vo) {
		return signUpDAO.selectMemberId(vo);
	}
}
