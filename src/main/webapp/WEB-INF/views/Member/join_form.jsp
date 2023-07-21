<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ page trimDirectiveWhitespaces="true" %>
<link rel="stylesheet" href="/css/Member/join_form.css">

<div id="page-nav-wrap">
     <div id="page-nav">
         HOME > 회원가입
     </div>
</div>

<div class="join-step">
     <span class="step-font">STEP1.약관동의</span>
     <img src="/img/icons/arrow.png" class="step-font" width="7px" height="18px">
     <span id="step-font" class="step-font">STEP2.회원정보 입력</span>
     <img src="/img/icons/arrow.png" class="step-font" width="7px" height="18px">
     <span class="step-font">STEP3.가입완료</span>
</div>

<div id="joinwrap">
            <div id="joinform-top">
                <span>회원기본정보</span>
            </div>
    
            <div>
                <form action="signUp" method="get" onsubmit="return validation()">                
                <table class="joinform-table">
                    <tr class="joinform-tr">
                        <td class="joinform-subtitle">
                            이름
                        </td>
                        <td>
                            <input class="joinform-input" type="text" name="user_name" id="user_name" placeholder="이름 입력"  >
                        </td>
                    </tr>
                    <tr class="joinform-tr">
                        <td class="joinform-subtitle">
                            아이디
                        </td>
                        <td class="btndiv">
                            <input class="joinform-input2" name="user_id" id="user_id" type="text" placeholder="5~6자, 영문, 숫자 또는 영문+숫자 조합" required > <button class="checkbutton idCheckBtn">
                            <!--  onclick="IdCheckAjax"-->중복확인</button>
                        </td>
                    </tr>
                    <tr class="joinform-tr">
                        <td class="joinform-subtitle">
                            비밀번호
                        </td>
                        <td>
                            <input class="joinform-input" type="text" name="user_pw" id="user_pw" pattern="(?=.*\d)(?=.*[a-z])(?=.*).{8,}" placeholder="비밀번호 입력" ><br>
                            
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td style="font-size: 13.5px; color:#d7d7d7">
                            * 6~16자 이내, 영문 대/소문자, 특수문자 중 2가지 조합으로 사용해주세요.<br>
                            가능 특수문자 : ! @ # $ % ^ ? _ ~<br>
                            * 아이디와 동일한 비밀번호는 사용할 수 없습니다.
                        </td>
                    </tr>
                    <tr class="joinform-tr">
                        <td class="joinform-subtitle">
                            비밀번호 확인
                        </td>
                        <!-- 특수문자 / 문자 / 숫자 포함 형태의 8~15자리 이내의 암호 정규식var regex = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/; 
                        숫자와 문자 포함 형태의 6~12자리 이내의 암호 정규식var regex = /^[A-Za-z0-9]{6,12}$/;
 -->
                        <td>
                            <input class="joinform-input" type="text" name="user_pw_check" id="user_pw_check" pattern="(?=.*\d)(?=.*[a-z])(?=.*).{8,}" placeholder="비밀번호 재입력" >
                        </td>
                    </tr>
                    <tr class="joinform-tr">
                        <td class="joinform-subtitle">
                            이메일
                        </td>
                        <td>
                            <input class="joinform-input" type="email"  maxlength="30"  name="user_email" id="user_email" pattern="[^ @]*@[^ @]*" placeholder="이메일 입력" ><br>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td class="joinform-check">
                            <input type="checkbox" name="user_email_receive" id="yellowCheckbox1" class="checkinput" value="1">
                            <label for="yellowCheckbox1"  class="yellowCheckbox"></label> <span class="joinform-span">정보/이벤트 SMS 수신에 동의합니다.</span>
                        </td>
                    </tr>
                    <tr class="joinform-tr">
                        <td class="joinform-subtitle">
                            휴대폰 번호
                        </td>
                        <td>
                            <input class="joinform-input" type="text" maxlength="11" name="user_phone" id="user_phone" pattern="(010)\d{3,4}\d{4}" placeholder="숫자만 입력(11자리)" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" />
                        </td>
                    </tr>
                </table>
                <table id="joinform-table">
                    <tr class="joinform-tr">
                        <td class="joinform-subtitle">
                            생년월일
                        </td>
                        <td>                          
                            <input type="date" name="user_birth_date" value=<fmt:formatDate value="${usersdto.user_birth_date}" pattern="yyyy-MM-dd" /> >                  
                        </td>
                    </tr>
                    <tr class="joinform-tr">
                        <td class="joinform-subtitle">
                            성별
                        </td>
                        <td class="joinform-check2">
                            <input type="radio" name="user_gender" id="yellowCheckbox2" class="checkinput" value="0" checked />
                            <label for="yellowCheckbox2" class="yellowCheckbox"></label> <span class="joinform-span">여자</span>
                            <input type="radio" name="user_gender" id="yellowCheckbox3" class="checkinput" value="1">
                            <label for="yellowCheckbox3" class="yellowCheckbox"></label> <span class="joinform-span">남자</span>
                        </td>
                    </tr>
                    <tr class="joinform-tr">
                        <td class="joinform-subtitle">
                            주소
                        </td>
                        <td>
                            <input class="joinform-input" name="user_address" id="user_address" type="text" >
                        </td>
                    </tr>
                	
                </table>
                <div class="joinform-buttonwrap">
                    <button class="joinform-button joinform-cancel">취소</button>
                    <button class="joinform-button joinform-confirm">회원가입</button>
                </div>
                
                </form>
            </div>
        </div>

        <script>
            function validation(){
                var name = document.getElementById("user_name").value;
                if(name || name!=" "){namecheck(name)};

                var id = document.getElementById("user_id").value;
                if(id || id!=" "){idcheck(id)};

                var pw = document.getElementById("user_pw").value;
                var pwch = document.getElementById("user_pw_check").value;
                if(pw || pw!=" " && !pwch || pwch != " "){pwcheck(pw, pwch)};

                var email = document.getElementById("user_email").value;
                if(email || email!=" "){emailcheck(email)};

                var phone = document.getElementById("user_phone").value;
                if(phone || phone!=" "){phonecheck(phone)};

                var birth = document.getElementById("user_birth_date").value;
                if(birth || birth!=" "){birthcheck(birth)};

                var gender = document.getElementById("user_gender").value;
                if(gender || gender!=" "){gendercheck(gender)};

                var address = document.getElementById("user_address").value;
                if(address || address!=" "){addresscheck(address)};
            }
            function namecheck( name ){
                
            }
            function idcheck( id ){

            }
            function pwcheck( pw, pwch ){

            }
            function emailcheck( email ){

            }
            function phonecheck( phone ){

            }
            function birthcheck( birth ){

            }
            function gendercheck( gender ){

            }
            function addresscheck( address ){

            }
            
    
		//idCheckBtn
		 function IdCheckAjax(){

				
				$.ajax({
					type : "POST", // http 방식 
					url : "http://3.39.54.14:8090/join_form", // ajax 통신 url
					data : { // ajax 내용 => 파라미터 : 값 이라고 생각해도 무방
						"type" : "user_id",
						"id" : $("#user_id").val()
					},
					success : function(data) {
						if (data >= 1) { // 1이면 중복
							idchk = false;
							alert("중복아이디");
							//$id.html("<span id='check'>이미 존재하는 아이디입니다</span>")
							//$("#check").css({
							//	"color" : "#FA3E3E",
							//	"font-weight" : "bold",
							//	"font-size" : "10px"

							})
							//console.log("중복아이디");
						} else { // 아니면 중복아님
							idchk = true;
						alert("중복아이디ㅏㅇ님");
							//$id.html("<span id='check'>사용가능한 아이디입니다</span>")

							//$("#check").css({
							//	"color" : "#0D6EFD",
							//	"font-weight" : "bold",
							//	"font-size" : "10px"

							})
							//console.log("중복아닌 아이디");
						}
					}
				})
		 }
		</script>                                                                                
