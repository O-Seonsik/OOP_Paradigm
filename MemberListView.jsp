<%@ page import="BBS.InfoList" %>
<%@ page import="javax.sound.sampled.Line" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    InfoList list = (InfoList) request.getAttribute("MEMBER_INFO");
    int pageSize = list.getPage().length;
    String strPage = (String)request.getParameter("PAGE");
    int pageNum = 1;
    if(strPage != "" && strPage != null) pageNum = Integer.parseInt(strPage);
    pageContext.setAttribute("pageNum", pageNum);
%>
<h1 class="h3 mb-3 font-weight-normal">회원 리스트</h1>
<%-- 모바일 화면 --%>
<div id="mobile_table">
    <c:if test="${MEMBER_INFO.listSize ne 0}">
        <c:forEach var="cnt" begin="0" end="${MEMBER_INFO.listSize-1}">
            <div class="container marketing">
                <div class="jumbotron mt-3">
                    <p>아이디: ${MEMBER_INFO.id[cnt]}</p>
                    <p>이름: ${MEMBER_INFO.name[cnt]}</p>
                    <p>학번: ${MEMBER_INFO.stuNum[cnt]}</p>
                    <p>휴대전화: ${MEMBER_INFO.phone[cnt]}</p>
                    <p>e-mail: ${MEMBER_INFO.mail[cnt]}</p>
                </div>
            </div>
        </c:forEach>
    </c:if>
</div>

<div id = "table">
    <table  class="table table-striped">
        <thead>
            <tr>
                <th scope="col">아이디</th>
                <th scope="col">이름</th>
                <th scope="col">학번</th>
                <th scope="col">휴대전화</th>
                <th scope="col">e-mail</th>
            </tr>
        </thead>
        <c:if test="${MEMBER_INFO.listSize ne 0}">
            <c:forEach var="cnt" begin="0" end="${MEMBER_INFO.listSize-1}">
                <tr>
                    <td>${MEMBER_INFO.id[cnt]}</td>
                    <td>${MEMBER_INFO.name[cnt]}</td>
                    <td>${MEMBER_INFO.stuNum[cnt]}</td>
                    <td>${MEMBER_INFO.phone[cnt]}</td>
                    <td>${MEMBER_INFO.mail[cnt]}</td>
                </tr>
            </c:forEach>
        </c:if>
    </table>
</div>

<div class="btn-toolbar mb-3" role="toolbar" aria-label="Toolbar with button groups">
    <div class="btn-group mr-2" role="group" aria-label="First group">
        <c:if test = "${MEMBER_INFO.button[0]}">
            <button type="button" class="btn btn-secondary" onclick="location='?path=MemberInfo?PAGE=${MEMBER_INFO.page[0]-1}'">◀</button>
        </c:if>
        <c:forEach var="cnt" begin="0" end="<%=pageSize-1%>">
            <c:if test="${pageScope.pageNum eq MEMBER_INFO.page[cnt]}">
                <button type="button" class="btn btn-secondary active" onclick="location='?path=MemberInfo?PAGE=${MEMBER_INFO.page[cnt]}'">${MEMBER_INFO.page[cnt]}</button>
            </c:if>
            <c:if test="${pageScope.pageNum ne MEMBER_INFO.page[cnt]}">
                <button type="button" class="btn btn-secondary" onclick="location='?path=MemberInfo?PAGE=${MEMBER_INFO.page[cnt]}'">${MEMBER_INFO.page[cnt]}</button>
            </c:if>
        </c:forEach>
        <c:if test = "${MEMBER_INFO.button[1]}">
            <c:set var="test" value="<%=pageSize%>" />
            <button type="button" class="btn btn-secondary" onclick="location='?path=MemberInfo?PAGE=${MEMBER_INFO.page[test-1]+1}'">▶</button>
        </c:if>
    </div>
</div>

<script>
    const wrapper = document.getElementById('body');
    window.addEventListener("resize", function(){
        if(window.innerWidth < 991){
            const table = document.getElementById("table")
            const mobile = document.getElementById("mobile_table")
            table.style.display="none"
            mobile.style.display="block"
        }
        else{
            const table = document.getElementById("table")
            const mobile = document.getElementById("mobile_table")
            table.style.display="block"
            mobile.style.display="none"
        }
    });
    window.onpageshow = (event) => {
        if ( event.persisted || (window.performance && window.performance.navigation.type == 2)) location.reload();
        if(window.innerWidth < 991){
            const table = document.getElementById("table")
            const mobile = document.getElementById("mobile_table")
            table.style.display="none"
            mobile.style.display="block"
        }
        else{
            const table = document.getElementById("table")
            const mobile = document.getElementById("mobile_table")
            table.style.display="block"
            mobile.style.display="none"
        }
    }
</script>
