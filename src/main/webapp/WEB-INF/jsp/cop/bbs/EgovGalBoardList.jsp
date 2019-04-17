<%--
  Class Name : EgovNoticeList.jsp
  Description : 게시물 목록화면
  Modification Information
 
      수정일         수정자                   수정내용
    -------    --------    ---------------------------
     2009.03.19   이삼섭          최초 생성
     2011.08.31   JJY       경량환경 버전 생성
 
    author   : 공통서비스 개발팀 이삼섭
    since    : 2009.03.19  
--%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="egovframework.com.cmm.service.EgovProperties" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<c:set var="ImgUrl" value="/images/egovframework/cop/bbs/"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" >
<meta http-equiv="content-language" content="ko">
<script
  src="http://code.jquery.com/jquery-3.3.1.js"
  integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
  crossorigin="anonymous"></script>
  
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link href="<c:url value='/'/>css/common.css" rel="stylesheet" type="text/css" >
<c:if test="${anonymous == 'true'}"><c:set var="prefix" value="/anonymous"/></c:if>
<script type="text/javascript" src="<c:url value='/js/EgovBBSMng.js' />" ></script>
<c:choose>
<c:when test="${preview == 'true'}">

<script type="text/javascript">

    function press(event) {
    }

    function fn_egov_addNotice() {
    }
    
    function fn_egov_select_noticeList(pageNo) {
    }
    
    function fn_egov_inqire_notice(nttId, bbsId) {      
    }

</script>
</c:when>
<c:otherwise>
<script>

	function ajaxBoardList(pageNo) {
		
		$('input[name=pageIndex]').val(pageNo);
		
		$.ajax({
		    url : "/cop/bbs/ajaxselectBoardList.do",
		    dataType : "html",
		    type : "post", 
		    data : $('#frm').serialize(),
		    success : function(result) {
		        $(".default_tablestyle").html(result);
		    }
		});
	}

    function press(event) {
        if (event.keyCode==13) {
            fn_egov_select_noticeList('1');
        }
    }

    function fn_egov_addNotice() {
        document.frm.action = "<c:url value='/cop/bbs${prefix}/addBoardArticle.do'/>";
        document.frm.submit();
    }
    
    function fn_egov_select_noticeList(pageNo) {
    	/* document.frm.pageIndex.value = pageNo;
        document.frm.action = "<c:url value='/cop/bbs${prefix}/selectBoardList.do'/>";
        document.frm.submit(); */

		
		ajaxBoardList(pageNo);
    }
    
    $(document).ready(function() {
    	
    	var pageNo = $('input[name=pageIndex]').val();
    	
    	ajaxBoardList(pageNo);
    });
    
    function fn_egov_inqire_notice(nttId, bbsId) {
        document.subForm.nttId.value = nttId;
        document.subForm.bbsId.value = bbsId;
        document.subForm.action = "<c:url value='/cop/bbs${prefix}/selectBoardArticle.do'/>";
        document.subForm.submit();          
    }
    
    function chk_change() {
    	var chk_size = document.getElementsByName("delete_check").length;
    	var chk_count = 0;
    	
    	for(var i = 0; i < chk_size; i++) {
    		if(document.getElementsByName("delete_check")[i].checked)
    			chk_count++;
    	}
    	
    	if(chk_count == chk_size)
    		document.getElementById("all_chk").checked = true;
    	else
    		document.getElementById("all_chk").checked = false;
    }
    
    function check_all() {
    	var chk_size = document.getElementsByName("delete_check").length;
    	
    	for(i = 0; i < chk_size; i++) {
    		if(document.getElementById("all_chk").checked == true)
    			document.getElementsByName("delete_check")[i].checked = true;
    		else
    			document.getElementsByName("delete_check")[i].checked = false;
    	}
    }
    
    function fn_egov_delete_noticeList() {
    	var size = document.getElementsByName("delete_check").length;
    	var delete_check = [];
    	
    	for(var i = 0; i < size; i++) {
    		if(document.getElementsByName("delete_check")[i].checked == true) {
    			delete_check.push(document.getElementsByName("delete_check")[i].value);
    		}
    	}
    	
    	var test = $('#frm').serialize() + "&chk_delete=" + delete_check;
    	
    	$.ajax({
		    url : "/cop/bbs/ajaxdeleteBoardList.do",
		    dataType : "html",
		    type : "post", 
		    data : test,
		    success : function(result) {
		        $(".default_tablestyle").html(result);
		    }
		});
    	
    }
    
    function excelDownload() {
    	/* document.frm.action = '/cop/bbs/execlDownload.do'; */
        
    	document.getElementById('frm2').submit();
    	
    	/* $.ajax({
		    url : "/cop/bbs/execlDownload.do",
		    type : "post", 
		    data : $('#frm').serialize(),
		    success : function(result) {
		    	alert("Excel 다운로드 성공");
		    },
		    error : function(result) {
		    	alert("error : " + result);
		    }
		}); */
    }
    
</script>

</c:otherwise>
</c:choose>
<title><c:out value="${brdMstrVO.bbsNm}"/> 목록</title>

<style type="text/css">
    h1 {font-size:12px;}
    caption {visibility:hidden; font-size:0; height:0; margin:0; padding:0; line-height:0;}
</style>


</head>
<body>
<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>
<!-- 전체 레이어 시작 -->
<div id="wrap">
    <!-- header 시작 -->
    <div id="header_mainsize"><c:import url="/EgovPageLink.do?link=main/inc/EgovIncHeader" /></div>
    <div id="topnavi"><c:import url="/EgovPageLink.do?link=main/inc/EgovIncTopnav" /></div>        
    <!-- //header 끝 --> 
    
    <!-- container 시작 -->
    <div id="container">
     <!-- 좌측메뉴 시작 -->
     <div id="leftmenu"><c:import url="/EgovPageLink.do?link=main/inc/EgovIncLeftmenu" /></div>
     <!-- //좌측메뉴 끝 -->
     
     <!-- 현재위치 네비게이션 시작 -->
     <div id="content">
         <div id="cur_loc">
             <div id="cur_loc_align">
                 <ul>
                     <li>HOME</li>
                     <li>&gt;</li>
                     <li>알림마당</li>
                     <li>&gt;</li>
                     <li><strong>${brdMstrVO.bbsNm}</strong></li>
                 </ul>
             </div>
         </div>
    
    <div class="row">
	    <div class="pull-left">
	    	<select name="dataTable_length" aria-controls="dataTable" class="custom-select custom-select-sm form-control form-control-sm">
		    	<option value="10">10</option>
		    	<option value="25">25</option>
		    	<option value="50">50</option>
		    	<option value="100">100</option>
	    	</select>
	    </div>
	    <div class="pull-right">
	    	<input type="search" class="form-control form-control-sm" placeholder="" aria-controls="dataTable">
	    </div>
    </div>
   	<table class="table table-striped">
   		<thead>
   		<tr>
   			<th>번호</th>
   			<th>제목</th>
   			<th>이미지</th>
   			<th>작성자</th>
   			<th>날짜</th>
   			<th>조회수</th>
   		</tr>
   		</thead>
   		<tbody>
   		<tr>
   			<th>165</th>
   			<th>이제 곧 제목입니다.</th>
   			<th>사진1234</th>
   			<th>길라임</th>
   			<th>2018.09.05</th>
   			<th>32</th>
   		</tr>
   		<tr>
   			<th>165</th>
   			<th>이제 곧 제목입니다.</th>
   			<th>사진1234</th>
   			<th>길라임</th>
   			<th>2018.09.05</th>
   			<th>32</th>
   		</tr>
   		<tr>
   			<th>165</th>
   			<th>이제 곧 제목입니다.</th>
   			<th>사진1234</th>
   			<th>길라임</th>
   			<th>2018.09.05</th>
   			<th>32</th>
   		</tr>
   		<tr>
   			<th>165</th>
   			<th>이제 곧 제목입니다.</th>
   			<th>사진1234</th>
   			<th>길라임</th>
   			<th>2018.09.05</th>
   			<th>32</th>
   		</tr>
   		<tr>
   			<th>165</th>
   			<th>이제 곧 제목입니다.</th>
   			<th>사진1234</th>
   			<th>길라임</th>
   			<th>2018.09.05</th>
   			<th>32</th>
   		</tr>
   		</tbody>
   	</table>
    <hr/>

    <div class="row">
    	<a href="#" class="btn btn-default pull-right" onclick="writeWTF();">글쓰기</a>
	</div>
	
    <div class="row">
	    <div class="pull-right">
	    	<div class="dataTables_paginate paging_simple_numbers" id="dataTable_paginate">
	    		<ul class="pagination">
	    			<li class="paginate_button page-item previous disabled" id="dataTable_previous">
	    				<a href="#" aria-controls="dataTable" data-dt-idx="0" tabindex="0" class="page-link">Previous</a>
	    			</li>
	    			<li class="paginate_button page-item active">
	    				<a href="#" aria-controls="dataTable" data-dt-idx="1" tabindex="0" class="page-link">1</a>
	    			</li>
	    			<li class="paginate_button page-item ">
	    				<a href="#" aria-controls="dataTable" data-dt-idx="2" tabindex="0" class="page-link">2</a>
	    			</li>
	    			<li class="paginate_button page-item ">
	    				<a href="#" aria-controls="dataTable" data-dt-idx="3" tabindex="0" class="page-link">3</a>
	    			</li>
	    			<li class="paginate_button page-item ">
	    				<a href="#" aria-controls="dataTable" data-dt-idx="4" tabindex="0" class="page-link">4</a>
	    			</li>
	    			<li class="paginate_button page-item ">
	    				<a href="#" aria-controls="dataTable" data-dt-idx="5" tabindex="0" class="page-link">5</a>
	    			</li>
	    			<li class="paginate_button page-item ">
	    				<a href="#" aria-controls="dataTable" data-dt-idx="6" tabindex="0" class="page-link">6</a>
	    			</li>
	    			<li class="paginate_button page-item next" id="dataTable_next">
	    				<a href="#" aria-controls="dataTable" data-dt-idx="7" tabindex="0" class="page-link">Next</a>
	    			</li>
	    		</ul>
	    	</div>
	    </div>
    </div>

    <!-- //content 끝 -->    
    </div>
        <!-- //container 끝 -->
        <!-- footer 시작 -->
        <div id="footer"><c:import url="/EgovPageLink.do?link=main/inc/EgovIncFooter" /></div>
        <!-- //footer 끝 -->
    </div>
    <!-- //전체 레이어 끝 -->
    
<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">게시물 등록</h4>
      </div>
      <div class="modal-body">
	      <tbody>
	        <form action="/cop/bbs/insertGalBoard.do" id="galleryInfo" method="post" enctype="multipart/form-data">
	        	<input type="hidden" name="imgName"/>
	        	<input type="hidden" name="imgSize"/>
	        	<input type="hidden" name="imgType"/>
	            <tr>
	                <th>제목</th>
	                <td><input type="text" placeholder="제목을 입력하세요. " name="title" class="form-control"/></td>
	            </tr>
	            <tr>
	                <th>내용</th>
	                <td><textarea cols="10" rows="10" placeholder="내용을 입력하세요." name="content" class="form-control"></textarea></td>
	            </tr>
	            <tr>
	                <th><label for="path">파일 업로드</label></th>
	                <td>
		                <input type="file" name="path" id="path">
		                <div id="uploadImg"> 
		                
		                </div>
	                </td>
	            </tr>
	        </form>
	      </tbody>
      </div>
      <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
          <button type="button" class="btn btn-primary" onClick="modalSubmit();">등록</button>
      </div>
    </div>
  </div>
</div>
    
<script>

function writeWTF() {
	$('#myModal').modal();
}

function modalSubmit() {
	document.getElementById('galleryInfo').submit();
}

$('#path').change(function() {
	var test = this;
});

$('#path').on("change", function() {
	var file = this.files[0];
	var inputImage = document.getElementById('uploadImg');
	
	if(file) {
		var reader = new FileReader();
		var img = new Image();
		
		reader.onload = function(e) {
			img.src = e.target.result;
			
			img.width = 180;
			
			$('input[name=imgName]').val(file.name);
			$('input[name=imgSize]').val(file.size);
			$('input[name=imgType]').val(file.type.split('/')[1]);
			
			inputImage.innerHTML = '<hr/>';
			inputImage.appendChild(img);
		}
		
		reader.readAsDataURL(file);
	}
});

</script>
    
 </body>
</html>