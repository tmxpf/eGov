package egovframework.let.main.web;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import egovframework.com.cmm.ComDefaultVO;
import egovframework.com.cmm.LoginVO;
import egovframework.let.cop.bbs.service.BoardVO;
import egovframework.let.cop.bbs.service.EgovBBSManageService;
import egovframework.let.cop.com.service.MemberVO;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

/**
 * 템플릿 메인 페이지 컨트롤러 클래스(Sample 소스)
 * @author 실행환경 개발팀 JJY
 * @since 2011.08.31
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2011.08.31  JJY            최초 생성
 *
 * </pre>
 */
@Controller@SessionAttributes(types = ComDefaultVO.class)
public class EgovMainController {
	
	
	private static final String SAVE_PATH = "D:\\eGovFrameDev-3\\eGovFrameDev-3.8.0-64bit\\upload"; 
	
	/**
	 * EgovBBSManageService
	 */
	@Resource(name = "EgovBBSManageService")
    private EgovBBSManageService bbsMngService;

	@Autowired
	private SignUpService signUpService;
	
	/**
	 * 메인 페이지에서 각 업무 화면으로 연계하는 기능을 제공한다.
	 *
	 * @param request
	 * @param commandMap
	 * @exception Exception Exception
	 */
	@RequestMapping(value = "/cmm/forwardPage.do")
	public String forwardPageWithMenuNo(HttpServletRequest request, @RequestParam Map<String, Object> commandMap)
	  throws Exception{
		return "";
	}

	/**
	 * 템플릿 메인 페이지 조회
	 * @return 메인페이지 정보 Map [key : 항목명]
	 *
	 * @param request
	 * @param model
	 * @exception Exception Exception
	 */
	@RequestMapping(value = "/cmm/main/mainPage.do")
	public String getMgtMainPage(HttpServletRequest request, ModelMap model)
	  throws Exception{

		// 공지사항 메인 컨텐츠 조회 시작 ---------------------------------
		BoardVO boardVO = new BoardVO();
		boardVO.setPageUnit(5);
		boardVO.setPageSize(10);
		boardVO.setBbsId("BBSMSTR_AAAAAAAAAAAA");

		PaginationInfo paginationInfo = new PaginationInfo();

		paginationInfo.setCurrentPageNo(boardVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(boardVO.getPageUnit());
		paginationInfo.setPageSize(boardVO.getPageSize());

		boardVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		boardVO.setLastIndex(paginationInfo.getLastRecordIndex());
		boardVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

		Map<String, Object> map = bbsMngService.selectBoardArticles(boardVO, "BBSA02");
		model.addAttribute("notiList", map.get("resultList"));

		boardVO.setBbsId("BBSMSTR_BBBBBBBBBBBB");
		map = bbsMngService.selectBoardArticles(boardVO, "BBSA02");
		model.addAttribute("galList", map.get("resultList"));

		// 공지사항 메인컨텐츠 조회 끝 -----------------------------------

		// 방문자 분석을 위한 기능 -----------------------------
		String ip = request.getHeader("X-FORWARDED-FOR"); 
        
        //proxy 환경일 경우
        if (ip == null || ip.length() == 0) {
            ip = request.getHeader("Proxy-Client-IP");
        }

        //웹로직 서버일 경우
        if (ip == null || ip.length() == 0) {
            ip = request.getHeader("WL-Proxy-Client-IP");
        }

        if (ip == null || ip.length() == 0) {
            ip = request.getRemoteAddr() ;
        }
		
        
		
		return "main/EgovMainView";
	}
	
	
	/**
	 * 회원가입(약관동의)
	 */
	@RequestMapping(value = "/cmm/main/egovSignUp.do")
	public String singUp(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		return "cmm/uat/uia/EgovSingUp";
	}
	
	/**
	 * 회원가입
	 */
	@RequestMapping(value = "/cmm/main/egovSignUp_2.do")
	public String singUp_2(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		return "cmm/uat/uia/EgovSingUpFinal";
	}
	
	
	/**
	 * 최종 회원가입
	 */
	@RequestMapping(value = "/cmm/main/egovSingUpFinal.do")
	public String egovSingUpFinal(@ModelAttribute MemberVO memberVO, HttpServletRequest request, HttpServletResponse response, ModelMap model,
			@RequestParam("dateOfBirth") List<String> dateOfBirth,
			@RequestParam("phone") List<String> phone,
			@RequestParam("imgInput") MultipartFile file) throws Exception {
		
		String sex = "";
		String originalFilename = file.getOriginalFilename();
		
		if(!"".equals(originalFilename)) {
			String extName = originalFilename.substring(originalFilename.lastIndexOf("."), originalFilename.length());
			
			Long size = file.getSize();
			
			String saveFileNmae = getSaveFileName(extName);
			
			writeFile(file, saveFileNmae);
			
			String imagePath = SAVE_PATH + "\\" + saveFileNmae;
			memberVO.setImagePath(imagePath);
			model.addAttribute("saveFileNmae", saveFileNmae);
		}
		
		memberVO.setDateOfBirth_1(dateOfBirth.get(0));
		memberVO.setDateOfBirth_2(dateOfBirth.get(1));
		
		signUpService.insertMemberInfo(memberVO);
		
		if(memberVO.getSex() == 1)
			sex = "남";
		else
			sex = "여";
		
		model.addAttribute("member", memberVO);
		model.addAttribute("phone_1", phone.get(0));
		model.addAttribute("phone_2", phone.get(1));
		model.addAttribute("phone_3", phone.get(2));
		model.addAttribute("sex", sex);
		
		return "cmm/uat/uia/EgovSingUpResult";
	}
	
	/**
	 * 아이디 중복확인.
	 * @return String
	 * @exception Exception
	 */
	@ResponseBody
	@RequestMapping(value = "/cmm/main/idcheck.do")
	public String idCheck(@ModelAttribute MemberVO memberVO, HttpServletRequest request, ModelMap model) throws Exception {

		MemberVO memberId = signUpService.selectMemberInfo(memberVO);
		
		if(memberId == null)
			return "";
		
		return memberId.getId();
	}
	
	@RequestMapping(value = "/cmm/main/excelDown.do")
	public String test(@ModelAttribute MemberVO memberVO, HttpServletRequest request, ModelMap model) throws Exception {

		MemberVO memberId = signUpService.selectMemberInfo(memberVO);
		
		if(memberId == null)
			return "";
		
		return memberId.getId();
	}
	
////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	private String getSaveFileName(String extName) {
		
		String fileName = "";
		
		Calendar calendar = Calendar.getInstance();
		fileName += calendar.get(Calendar.YEAR);
		fileName += calendar.get(Calendar.MONTH);
		fileName += calendar.get(Calendar.DATE);
		fileName += calendar.get(Calendar.HOUR);
		fileName += calendar.get(Calendar.MINUTE);
		fileName += calendar.get(Calendar.SECOND);
		fileName += calendar.get(Calendar.MILLISECOND);
		fileName += extName;
		
		return fileName;
	}
	
	private boolean writeFile(MultipartFile file, String fileName) throws IOException{
		
		boolean result = false;
		
		byte[] data = file.getBytes();
		FileOutputStream fos = new FileOutputStream(SAVE_PATH + "\\" + fileName);
		fos.write(data);
		fos.close();
		
		return result;
	}
}