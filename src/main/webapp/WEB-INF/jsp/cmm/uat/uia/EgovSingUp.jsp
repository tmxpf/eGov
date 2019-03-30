<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- <style type="text/css">
    #css {
        background-color: #ffffff;
    }
</style> -->
</head>
<body>
<div>
	<fieldset style="background-color: #ffffff">
		<p>
		전자정부 표준프레임워크는 실행환경, 개발환경, 관리환경, 운영환경 등 4개의 표준프레임워크 환경과 공통컴포넌트로 구성된다. 
		전자정부 및 공공사업에서 웹 어플리케이션 시스템 구축 시 어플리케이션 아키텍처와 기본 기능 및 공통컴포넌트를 표준으로 제공하는 
		개발프레임워크로서 다음과 같이 실행, 개발, 운영, 관리환경과 공통컴포넌트로 구성됨
		</p>
		<p style="float:right">필수<input type="checkbox" style="float : right" name="check" onchange="chk_count();"/></p>	
	</fieldset>
	
	
	<fieldset style="background-color: #ffffff">
		<p>
		전자정부 사업에서 개발하는 업무 프로그램의 실행에 필요한 공통모듈 등 업무 프로그램 개발 시 화면,서버 프로그램, 데이터 개발을 표준화가 용이하도록 지원하는 응용프로그램 환경
		</p>
		<p style="float:right">선택<input type="checkbox" style="float : right" name="check" onchange="chk_count();"/></p>
	</fieldset>
</div>
<p style="float:right">전체동의<input type="checkbox" style="float : right" name="check_all" onchange="chk_All();"/></p>

<center><button onClick="checkbox_chk();">다음</button></center>
</body>

<script>

function chk_count() {
	var check_1 = document.getElementsByName("check")[0].checked;
	var check_2 = document.getElementsByName("check")[1].checked;
	
	if(check_1 && check_2) {
		document.getElementsByName("check_all")[0].checked = true;
	} else {
		document.getElementsByName("check_all")[0].checked = false;
	}
	
}

function chk_All() {
	var chk = document.getElementsByName("check_all")[0].checked;
	
	if(chk == true) {
		document.getElementsByName("check")[0].checked = true;
		document.getElementsByName("check")[1].checked = true;
	} else {
		document.getElementsByName("check")[0].checked = false;
		document.getElementsByName("check")[1].checked = false;
	}
}

function checkbox_chk() {
	var chk = document.getElementsByName("check")[0].checked;
	
	if(chk == true) {
		document.location.href = "<c:url value='/cmm/main/egovSignUp_2.do'/>"; 
		/* document.location.href = "<c:url value='/cmm/forwardPage.do'/>"; */
	} else {
		alert("필수약관은 동의해주세요.!!");
	}
}

</script>

</html>