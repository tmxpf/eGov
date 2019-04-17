package egovframework.let.cop.gal.web;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Calendar;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import egovframework.let.cop.bbs.service.BoardVO;
import egovframework.let.cop.gal.service.EgovGALService;

@Controller
public class EgovGALController {

	@Autowired
	private EgovGALService egovGALService;
	
	private static final String IMG_PATH = "D:\\eGovFrameDev-3\\eGovFrameDev-3.8.0-64bit\\img_file";
	
	@RequestMapping("/cop/bbs/selectGalBoard.do")
    public String selectGalBoard(@ModelAttribute("searchVO") BoardVO boardVO, ModelMap model) throws Exception {
		
		return "cop/bbs/EgovGalBoardList";
	}
	
	@RequestMapping("/cop/bbs/insertGalBoard.do")
    public String insertGalBoard(@ModelAttribute("egovGalVO") EgovGalVO egovGalVO, ModelMap model,
    		@RequestParam("path") MultipartFile file) throws Exception {
		
		String originalFilename = file.getOriginalFilename();
		
		if(!"".equals(originalFilename)) {
			
			String saveFileNmae = getSaveFileName(egovGalVO.getImgType());
			
			writeFile(file, saveFileNmae);
			String imagePath = IMG_PATH + "\\" + saveFileNmae;
			egovGalVO.setImgPath(imagePath);
			egovGALService.insertImgBoard(egovGalVO);
			model.addAttribute("imgFile", imagePath);
		}
		
		
		return "redirect:/cop/bbs/selectGalBoard.do";
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
		fileName += "." + extName;
		
		return fileName;
	}
	
	private void writeFile(MultipartFile file, String fileName) throws IOException {
		
		byte[] data = file.getBytes();
		FileOutputStream fos = new FileOutputStream(IMG_PATH + "\\" + fileName);
		fos.write(data);
		fos.close();

	}
}
