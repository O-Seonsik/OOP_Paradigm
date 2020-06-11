<%@ page import="BBS.BBSList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    BBSList list = (BBSList)request.getAttribute("BBS_LIST");
    int pageSize = list.getPage().length;
    String res = (String)request.getAttribute("RETURN");
    String strPage = (String)request.getParameter("PAGE");
    String search = (String)request.getParameter("SEARCH");
    int pageNum = 1;
    if(strPage != "" && strPage != null) pageNum = Integer.parseInt(strPage);
    pageContext.setAttribute("pageNum", pageNum);
    String loginId = (String)session.getAttribute("ID");
    pageContext.setAttribute("loginId", loginId);
%>
<% if(search == null || search == "") {%>
<h1 class="h3 mb-3 font-weight-normal">도서관리 시스템</h1>
<%}else{%>
<h1 class="h3 mb-3 font-weight-normal">도서관리 시스템 - 검색결과</h1>
<%}%>
<% if (list.getListSize() != 0){%>
<%-- 모바일 화면 --%>
<div id="mobile_table">
    <c:forEach var="cnt" begin="0" end="${BBS_LIST.listSize-1}">
        <div class="container marketing">
            <div class="jumbotron mt-3">
                <h2>제목: ${BBS_LIST.name[cnt]}</h2>
                <p>도서번호: ${BBS_LIST.id[cnt]}</p>
                <p>저자: ${BBS_LIST.writer[cnt]}</p>
                <p>가격: ${BBS_LIST.price[cnt]}</p>
                <c:if test="${BBS_LIST.rent[cnt]}">
                    <p>대여 가능 여부: T</p>
                </c:if>
                <c:if test="${!BBS_LIST.rent[cnt]}">
                    <p>대여 가능 여부: F</p>
                </c:if>
                <p>대여 횟수${BBS_LIST.rentNum[cnt]}</p>
                <c:if test="${param.SORT eq 2}">
                    <p>대여자: <a href="?path=MemberInfo?USERID=${BBS_LIST.rentBy[cnt]}">${BBS_LIST.rentBy[cnt]}</a></p>
                </c:if>
                <% if(!(res==null || res=="")){ %>
                <c:if test = "${pageScope.loginId eq BBS_LIST.rentBy[cnt]}">
                    <p><a href="/library/return?ID=${BBS_LIST.id[cnt]}">반납</a></p>
                </c:if>
                <% }%>
            </div>
        </div>
    </c:forEach>
</div>


<table id="table" class="table table-striped">
    <thead>
        <tr>
            <th scope="col">id</th>
            <th scope="col">이름</th>
            <th scope="col">저자</th>
            <th scope="col">가격</th>
            <th scope="col">대여가능 여부</th>
            <th scope="col">대여횟수</th>
            <c:if test="${param.SORT eq 2}">
                <th scope="col">대여자</th>
            </c:if>
            <c:if test="${param.RETURN eq true}">
                <th scope="col">반납하기</th>
            </c:if>
        </tr>
    </thead>
    <c:forEach var="cnt" begin="0" end="${BBS_LIST.listSize-1}">
        <tr>
            <td>${BBS_LIST.id[cnt]}</td>
            <td>${BBS_LIST.name[cnt]}</td>
            <td>${BBS_LIST.writer[cnt]}</td>
            <td>${BBS_LIST.price[cnt]}</td>
            <td>
                <c:if test="${BBS_LIST.rent[cnt]}">
                    T
                </c:if>
                <c:if test="${!BBS_LIST.rent[cnt]}">
                    F
                </c:if>
            </td>
            <td>${BBS_LIST.rentNum[cnt]}</td>
            <c:if test="${param.SORT eq 2}">
                <td><a href="?path=MemberInfo?USERID=${BBS_LIST.rentBy[cnt]}">${BBS_LIST.rentBy[cnt]}</a></td>
            </c:if>
            <% if(!(res==null || res=="")){ %>
            <c:if test = "${pageScope.loginId eq BBS_LIST.rentBy[cnt]}">
                <td><a href="/library/return?ID=${BBS_LIST.id[cnt]}">반납</a></td>
            </c:if>
            <c:if test = "${pageScope.loginId ne BBS_LIST.rentBy[cnt]}">
                <td></td>
            </c:if>
            <% }%>
        </tr>
    </c:forEach>
</table>
<div class="btn-toolbar mb-3" role="toolbar" aria-label="Toolbar with button groups">
    <div class="btn-group mr-2" role="group" aria-label="First group">
        <c:if test = "${BBS_LIST.button[0]}">
            <button type="button" class="btn btn-secondary" onclick="location='/library/?path=list?SEARCH=${param.SEARCH}&SORT=${param.SORT}&PAGE=${BBS_LIST.page[0]-1}&RETURN=${param.RETURN}'">◀</button>
        </c:if>
        <c:forEach var="cnt" begin="0" end="<%=pageSize-1%>">

            <c:if test="${pageScope.pageNum eq BBS_LIST.page[cnt]}">
                <button type="button" class="btn btn-secondary active" onclick="location='/library/?path=list?SEARCH=${param.SEARCH}&SORT=${param.SORT}&PAGE=${BBS_LIST.page[cnt]}&RETURN=${param.RETURN}'">${BBS_LIST.page[cnt]}</button>
            </c:if>
            <c:if test="${pageScope.pageNum ne BBS_LIST.page[cnt]}">
                <button type="button" class="btn btn-secondary" onclick="location='/library/?path=list?SEARCH=${param.SEARCH}&SORT=${param.SORT}&PAGE=${BBS_LIST.page[cnt]}&RETURN=${param.RETURN}'">${BBS_LIST.page[cnt]}</button>
            </c:if>
        </c:forEach>
        <c:if test = "${BBS_LIST.button[1]}">
            <c:set var="test" value="<%=pageSize%>" />
            <button type="button" class="btn btn-secondary" onclick="location='/library/?path=list?SEARCH=${param.SEARCH}&SORT=${param.SORT}&PAGE=${BBS_LIST.page[test-1]+1}&RETURN=${param.RETURN}'">▶</button>
        </c:if>
    </div>
</div>
 <%}else{%>
    <div style="text-align: center;" class="alert alert-dark" role="alert">
        <span>도서가 없습니다.</span>
    </div>
 <%}%>
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