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
</head>
<body>
	<table width="940" style="padding:5px 0 5px 0; ">
      <tr height="2" bgcolor="#FFC8C3"><td colspan="2"></td></tr>
      <tr>
         <th> 이름</th>
         <td>${member.mbname}</td>
      </tr>
      <tr>
           <th> 성별 </th>
           <td>
              ${sex}
            </td>
         </tr>
       <tr>
         <th> 생년월일 </th>
         <td>
         	${member.dateOfBirth_1} - 
         	${member.dateOfBirth_2}
         </td>
       </tr>
       <tr>
         <th>아이디</th>
         <td>
         	${member.id}
         </td>
       </tr>
        <tr>
          <th>이메일</th>
          <td>
          	 ${member.email}@${member.emaildns}
          </td>
         </tr>
         <tr>
          <th>핸드폰 번호</th>
           <td>
           	${phone_1} - ${phone_2} - ${phone_3}
           </td>
          </tr>
         <tr>
           <th>주소</th>
           <td>
            ${member.address} ${member.detailaddress}
           </td>
         </tr>
	         <tr>
	           <th> 프로필 사진 </th>
	           <td>
	           	 <%-- <img src="${member.imagePath}" > --%>
	           	 <img src="<c:url value="/upload/${saveFileNmae}"/>"/>	
	           </td>
	           <td>
	           	이름 : ${member.fileName}
	           </td>
	           <td>
	                     사이즈 : ${member.fileSize}
	           </td>
	           <td>
	           	확장자 : ${member.extention}
	           </td>
	         </tr>
           <tr height="2" bgcolor="#FFC8C3"><td colspan="2"></td></tr>
           <tr>
             <td colspan="2" align="center">
               <input type="button" id="ok" value="확인">
            </td>
           </tr>
           </table>
           
<script>

	var ok = document.getElementById("ok");
	
	ok.addEventListener('click', function(e) {
		location.href = '/';
	})

</script>
</body>
</html>