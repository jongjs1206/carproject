<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<!-- 브라우저 최상단 탭 명 -->

<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>관리자페이지</title>
     <!-- css파일 import -->
    <link href="../resources/css/admin/styles.css" rel="stylesheet" type="text/css" />
    <link href="../resources/css/admin/admin.css" rel="stylesheet" type="text/css" />
    
    <link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet"
        crossorigin="anonymous" />
     
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/js/all.min.js"
        crossorigin="anonymous"></script>
  
</head>
     
     <!-- 대시보드 내용 -->
     <c:choose>
     <c:when test="${auth eq 'ROLE_ADMIN'}">
      <div id="layoutSidenav_content" class="borderBoxGold">
	</c:when>
     <c:when test="${user.state eq 'black'}">
      <div id="layoutSidenav_content" class="borderBoxRed">
    </c:when>
     <c:otherwise>
     <div id="layoutSidenav_content" class="borderBoxGreen">
    </c:otherwise>
     </c:choose>
       
            <main>
                <form method="post" action="updateUserEtc.do" id="updateUserEtc">
                  <input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" />
                    <div id="adminStatus" class="form-group row">
         			<!-- 변수 -->         			
         			<c:set var="state" value="${user.state}" />
         			 <c:set var="auth" value="${auth}" />
         			 
         			 
         			 
         			 
                        <!-- 아이디 -->                       
                        <div class="form-group col-md-12">
                         <div class="form-group col-md-12">
                                                
                            <img id='profileImg' onerror="this.parentNode.style.display='none'" src="https://storage.cloud.google.com/car_image_for_analysis/profile/${user.m_id}.jpg" alt="profile" />
                       	   
                        </div>    
                        
                        
                          <div class="form-group col-md-6">  
                        
                        <c:choose>
                        <c:when test="${auth eq 'ROLE_ADMIN'}">                        
                        <a href="member_status.do?id=${user.m_id}&stateChange=user"><input type="button" class="btn btn-primary" value="관리자 해제"></a>
                        </c:when>
                        <c:when test="${auth eq 'ROLE_USER' and state eq 'normal'}">
                        <a href="member_status.do?id=${user.m_id}&stateChange=admin"><input type="button" class="btn btn-primary" value="관리자 전환"></a>
                        </c:when>                        
                        </c:choose>
                        
                         
                        
                        <c:choose>
                        <c:when test="${auth eq 'ROLE_USER' and state eq 'normal'}">
                         <a href="member_status.do?id=${user.m_id}&stateChange=black"><input type="button" class="btn btn-primary" value="블랙리스트 전환"></a>
                        </c:when>
                        <c:when test="${state eq 'black'}">
                        <a href="member_status.do?id=${user.m_id}&stateChange=normal"><input type="button" class="btn btn-primary" value="블랙리스트 해제"></a>
                        </c:when>
                        </c:choose>                                  
                        </div>
                        
                        

                         <label for="inputID">ID</label>
                            <input type="text" class="form-control" id="m_id" name="m_id" readonly="readonly" value="${user.m_id}">
                        </div>
   
                        <div class="form-group col-md-6">
                            <label for="inputPassword4">가입일</label>
                            <input type="text" class="form-control" id="m_name" readonly="readonly" value="${user.w_date}">
                        </div>
                        
                        
                         <c:choose>
                         <c:when test="${auth eq 'ROLE_ADMIN'}">
                        <div class="form-group col-md-6">
                            <label for="inputPassword4">상태변경</label>                                      
                            <input type="text" class="form-control" id="userStatus" readonly="readonly" value="${auth}">                         
                        </div>                           
                         </c:when>
                         <c:when test="${auth eq 'ROLE_USER'}">
                        <div class="form-group col-md-6">
                            <label for="inputPassword4">상태변경</label>                                      
                            <input type="text" class="form-control" id="userStatus" readonly="readonly" value="${user.state}">                         
                        </div>                         
                         </c:when>
                         </c:choose>
                    
                        <div class="form-group col-md-6">
                            <label for="inputPassword4">이름</label>
                            <input type="성" class="form-control" id="lastname" readonly="readonly" value="${user.m_name}">
                        </div>
                        <div class="form-group col-md-6">
                            <label for="inputPassword4">생년월일</label>
                            <input type="이름" class="form-control" id="firstname" readonly="readonly" value="${user.birth}">
                        </div>
                                               
                                            
                        <div class="form-group col-md-12">
                            <label for="inputAddress">이메일</label>
                            <input type="text" class="form-control" id="inputAddress" size="40px" readonly="readonly" value="${user.email}">
                        </div>
             
                        <div class="form-group col-md-6">
                            <label for="inputAddress">휴대폰번호</label>
                            <input type="text" class="form-control" id="inputbirthday" size="40px" readonly="readonly" value="${user.tel}"> 
                        </div>     
                        
                        <!-- 생년월일 -->                        
                        <div class="form-group col-md-6">
                            <label for="inputAddress">코인</label>
                            <input type="text" class="form-control" id="inputbirthday" size="40px" readonly="readonly" value="${user.coin}">
                        </div>
 
                        <div class="form-group col-md-12"></div>                         
                    
						<textarea id="etc" name="etc" class="form-group col-md-12" rows="5" cols="">${user.etc}</textarea>  	
						
						
						<div class="form-group col-md-3">
                          <input type="submit" id="confirm" class="btn btn-primary" value="저장">
                        </div>  				       
                      
                                           
                    </div>
	
                </form> 
            </main>
</div>
    
    <!-- javascript 파일 import -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
        crossorigin="anonymous"></script>
  <script type="text/javascript" src="../resources/js/admin/admin_status.js"></script>  
</body>

</html>