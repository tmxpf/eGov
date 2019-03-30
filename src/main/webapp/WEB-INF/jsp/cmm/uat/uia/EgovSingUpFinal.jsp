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
<script
  src="http://code.jquery.com/jquery-3.3.1.js"
  integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
  crossorigin="anonymous"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<title>Insert title here</title>
</head>
<body>

<form name="write_form_member" method="post">
   <table width="940" style="padding:5px 0 5px 0; ">
      <tr height="2" bgcolor="#FFC8C3"><td colspan="2"></td></tr>
      <tr>
         <th> 이름</th>
         <td><input type="text" name="mbname" maxlength="10" onkeyup="name_change();"></td>
      </tr>
      <tr>
           <th> 성별 </th>
           <td>
              <input type='checkbox' name='sex' value='1' onChange="sexFun()"> 남자
              <input type='checkbox' name='sex' value='2'onChange="sexFun()"> 여자
            </td>
         </tr>
       <tr>
         <th> 생년월일 </th>
         <td>
         	<input type="text" name="dateOfBirth" maxlength="6" onkeyup="onlyNumber();"/> - 
         	<input type="text" name="dateOfBirth" maxlength="7" onkeyup="onlyNumber();"/>
         </td>
       </tr>
       <tr>
         <th>아이디</th>
         <td>
         <input type="text" id="ID" maxlength="10" onkeyup="IDFunc();"> <input type="button" value="아이디 중복확인" onClick="idCheck();">
         </td>
       </tr>
       <tr>
         <th>비밀번호</th>
         <td><input type="password" id="pw" maxlength="10" onkeyup="isSame();">&nbsp;&nbsp; ※ 영문/숫자포함 6자 이상</td>
       </tr>
       <tr>
         <th>비밀번호 확인</th>
         <td><input type="password" id="pw_chk" maxlength="10" onkeyup="isSame();">&nbsp;&nbsp; <span id="same"></span></td>
       </tr>
        <tr>
          <th>이메일</th>
          <td>
            <input type='text' id="email">@
            <input type='text' id="email_dns">
              <select id="emailaddr" onChange="checkemailaddy();">
                 <option value="1">직접입력</option>
                 <option value="daum.net">daum.net</option>
                 <option value="empal.com">empal.com</option>
                 <option value="gmail.com">gmail.com</option>
                 <option value="hanmail.net">hanmail.net</option>
                 <option value="msn.com">msn.com</option>
                 <option value="naver.com">naver.com</option>
                 <option value="nate.com">nate.com</option>
              </select>
            </td>
         </tr>
         <tr>
          <th>핸드폰 번호</th>
           <td><input type="text"name="tel_phon" onkeyup="onlyNumber();" maxlength="3"> -
               <input type="text" name="tel_phon" onkeyup="onlyNumber();" maxlength="4"> -
               <input type="text" name="tel_phon" onkeyup="onlyNumber();" maxlength="4">
           </td>
          </tr>
         <tr>
           <th>주소</th>
           <td>
             <input type="text" id="address">&nbsp;&nbsp; <input type="button" value="주소찾기" onClick="address_add();">
             <input type="text" id="detail_address" style="display:none;" placeholder="(상세주소)">
             <div id="layer" style="display:none;position:fixed;overflow:hidden;z-index:1;-webkit-overflow-scrolling:touch;">
             	<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="닫기 버튼">
             </div>
             
           </td>
         </tr>
	         <tr>
	           <th> 프로필 사진 </th>
	           <td>
	           	 <input type='file' id="imgInput" />
   				 <img id="image_section" src="#"/>
   				 <div id="image_val" style="display:none;">
	   				 <p id="path"></p>
	   				 <p id="fileName"></p>
	   				 <p id="fileSize"></p>
	   				 <p id="extension"></p>
   				 </div>
	           </td>
	         </tr>
           <tr height="2" bgcolor="#FFC8C3"><td colspan="2"></td></tr>
           <tr>
             <td colspan="2" align="center">
               <input type="submit" value="회원가입">
               <input type="reset" value="취소">
            </td>
           </tr>
           </table>
          </td>
          </tr>
          </form>

</body>

<!-- below Validator -->

<script>
var regexp_Name = /[^가-힣a-zA-Z]/g;
var regexp_onlyNumber = /[^0-9]/g;
var regexp_ID = /[^0-9a-zA-Z]/g;


/* 이름 인증 */
function name_change() {
	validate(regexp_Name);
}

/* 성별 인증 */
function sexFun() {
	var man = document.getElementsByName("sex")[0].checked;
	var woman = document.getElementsByName("sex")[1].checked;
	
	if(man == true && woman == true) {
		alert("성별은 하나만 고르세요 제발");
		document.getElementsByName("sex")[0].checked = false;
		document.getElementsByName("sex")[1].checked = false;
	}
}

/* 숫자만 입력가능 */
function onlyNumber() {
	validate(regexp_onlyNumber);
}

/* 아이디 인증 */
function IDFunc() {
	validate(regexp_ID);
}

/* 아이디 중복확인 */
 function idCheck() {
	var id = document.getElementById("ID").value;
	
	$.ajax({
	    url : "/cmm/main/idcheck.do",
	    dataType : "json",
	    type : "post", 
	    data : {idcheck : id},
	    success : function(result) {
	        var test = result;
	    }
	});
}


/* 비밀번호 확인 */
function isSame() {
	var pw = document.getElementById("pw").value;
	var pw_chk = document.getElementById("pw_chk").value;
	
	if(pw != '' && pw_chk != '') {
		if(pw === pw_chk) {
			document.getElementById("same").innerHTML = "비밀번호가 일치합니다.";
			document.getElementById("same").style.color = 'blue';
		}
		else {
			document.getElementById("same").innerHTML = "비밀번호가 일치하지 않습니다.";
			document.getElementById("same").style.color = 'red';
		}
	}
	
	if(pw == '' && pw_chk == '') {
		document.getElementById("same").innerHTML = '';
	}
}

/* 이메일 기능 */
function checkemailaddy() {
	var addr = document.getElementById("emailaddr");
	var addr_dns = document.getElementById("email_dns");
	
	if(addr.value == '1') {
		addr_dns.readOnly = false;
		addr_dns.value = "";
		addr_dns.focus();
	} else {
		addr_dns.readOnly = true;
		addr_dns.value = addr.value;
	}
}

/* 인증함수 */
function validate(regexp) {
	var str = event.target.value.replace(regexp, '');
	event.target.value = str;
}

</script>

<script>

//우편번호 찾기 화면을 넣을 element
var element_layer = document.getElementById('layer');

function closeDaumPostcode() {
    // iframe을 넣은 element를 안보이게 한다.
    element_layer.style.display = 'none';
}

function address_add() {
	 new daum.Postcode({
         oncomplete: function(data) {
             // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

             // 각 주소의 노출 규칙에 따라 주소를 조합한다.
             // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
             var addr = ''; // 주소 변수

             //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
             if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                 addr = data.roadAddress;
             } else { // 사용자가 지번 주소를 선택했을 경우(J)
                 addr = data.jibunAddress;
             }

             document.getElementById("address").value = addr;
             document.getElementById("address").readOnly = true;
             // 커서를 상세주소 필드로 이동한다.
             document.getElementById("detail_address").focus();
             document.getElementById("detail_address").style = 'block';

             // iframe을 넣은 element를 안보이게 한다.
             // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
             element_layer.style.display = 'none';
         },
         width : '100%',
         height : '100%',
         maxSuggestItems : 5
     }).embed(element_layer);

     // iframe을 넣은 element를 보이게 한다.
     element_layer.style.display = 'block';

     // iframe을 넣은 element의 위치를 화면의 가운데로 이동시킨다.
     initLayerPosition();
}

// 브라우저의 크기 변경에 따라 레이어를 가운데로 이동시키고자 하실때에는
// resize이벤트나, orientationchange이벤트를 이용하여 값이 변경될때마다 아래 함수를 실행 시켜 주시거나,
// 직접 element_layer의 top,left값을 수정해 주시면 됩니다.
function initLayerPosition(){
    var width = 300; //우편번호서비스가 들어갈 element의 width
    var height = 400; //우편번호서비스가 들어갈 element의 height
    var borderWidth = 5; //샘플에서 사용하는 border의 두께

    // 위에서 선언한 값들을 실제 element에 넣는다.
    element_layer.style.width = width + 'px';
    element_layer.style.height = height + 'px';
    element_layer.style.border = borderWidth + 'px solid';
    // 실행되는 순간의 화면 너비와 높이 값을 가져와서 중앙에 뜰 수 있도록 위치를 계산한다.
    element_layer.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width)/2 - borderWidth) + 'px';
    element_layer.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height)/2 - borderWidth) + 'px';
}

</script>

<script>

/* 프로필 업로드 */
function readURL(input) {
	 
    if (input.files && input.files[0]) {
        var reader = new FileReader();
 		var extention = input.files[0].type.split('/');
     	
     	document.getElementById('image_val').style.display = 'block';
     	
     	$('#path').text("경로 : " + input.value);
     	$('#fileName').text("파일이름 : " + input.files[0].name);
     	$('#fileSize').text("사이즈 : " + input.files[0].size + "byte");
     	$('#extension').text("확장자 : " + extention[1]);
     	
        reader.onload = function (e) {
            $('#image_section').attr('src', e.target.result);
        }
 
        reader.readAsDataURL(input.files[0]);
    }
}

$("#imgInput").change(function(){
    readURL(this);
});

</script>

</html>