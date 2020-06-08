<%@ page import="BBS.BBSList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    BBSList list = (BBSList)request.getAttribute("BBS_LIST");
    int pageSize = list.getPage().length;
    String res = (String)request.getAttribute("RETURN");
    String strPage = (String)request.getParameter("PAGE");
    int pageNum = 1;
    if(strPage != "" && strPage != null) pageNum = Integer.parseInt(strPage);
    pageContext.setAttribute("pageNum", pageNum);
    String loginId = (String)session.getAttribute("ID");
    pageContext.setAttribute("loginId", loginId);
%>
<h1 class="h3 mb-3 font-weight-normal">도서관리 시스템</h1>
<table  class="table table-striped">
    <thead>
        <tr>
            <th scope="col">id</th>
            <th scope="col">name</th>
            <th scope="col">writer</th>
            <th scope="col">price</th>
            <th scope="col">rent</th>
            <th scope="col">rent_num</th>
            <c:if test="${param.SORT eq 2}">
                <th scope="col">rented By</th>
            </c:if>
            <c:if test="${param.RETURN eq true}">
                <th scope="col">return</th>
            </c:if>
        </tr>
    </thead>

    <% if (list.getListSize() != 0){%>
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
            <button type="button" class="btn btn-secondary" onclick="location='/library/?path=list?SORT=${param.SORT}&PAGE=${BBS_LIST.page[0]-1}&RETURN=${param.RETURN}'">◀</button>
        </c:if>
        <c:forEach var="cnt" begin="0" end="<%=pageSize-1%>">

            <c:if test="${pageScope.pageNum eq BBS_LIST.page[cnt]}">
                <button type="button" class="btn btn-secondary active" onclick="location='/library/?path=list?SORT=${param.SORT}&PAGE=${BBS_LIST.page[cnt]}&RETURN=${param.RETURN}'">${BBS_LIST.page[cnt]}</button>
            </c:if>
            <c:if test="${pageScope.pageNum ne BBS_LIST.page[cnt]}">
                <button type="button" class="btn btn-secondary" onclick="location='/library/?path=list?SORT=${param.SORT}&PAGE=${BBS_LIST.page[cnt]}&RETURN=${param.RETURN}'">${BBS_LIST.page[cnt]}</button>
            </c:if>
        </c:forEach>
        <%}%>
        <c:if test = "${BBS_LIST.button[1]}">
            <c:set var="test" value="<%=pageSize%>" />
            <button type="button" class="btn btn-secondary" onclick="location='/library/?path=list?SORT=${param.SORT}&PAGE=${BBS_LIST.page[test-1]+1}&RETURN=${param.RETURN}'">▶</button>
        </c:if>
    </div>
</div>

