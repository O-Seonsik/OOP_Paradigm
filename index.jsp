<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String strPath = (String)request.getParameter("path");
    if(strPath==null || strPath=="") strPath = "index";
    String strSort = (String)request.getParameter("SORT");
    int sort = 0;
    if(strSort != "" && strSort != null) sort = Integer.parseInt(strSort);
    String returnVal = (String)request.getParameter("RETURN");
    if(returnVal == "" || returnVal == null) returnVal = "";
%>
<html>
    <head>
        <script>
            window.onpageshow = (event) => {
                if ( event.persisted || (window.performance && window.performance.navigation.type == 2)) location.reload();
            }
        </script>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
        <link rel="stylesheet" href="style/index.css">
        <title>도서관리 시스템</title>
    </head>
    <body class="d-flex flex-column h-100">
        <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
            <div class="container">
                <a class="navbar-brand" href="/library">책방</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarsExampleDefault">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item <%if(strPath.equals("BBSListView.jsp") && sort == 0) out.println("active");%>">
                            <a class="nav-link" href="/library/?path=list">목록<span class="sr-only">(current)</span></a>
                        </li>
                        <li class="nav-item <%if(strPath.equals("Rent.jsp")) out.println("active");%>">
                            <a class="nav-link" href="/library/?path=Rent.jsp">대여</a>
                        </li>
                        <li class="nav-item <%if(strPath.equals("BBSListView.jsp") && sort == 2 && returnVal.equals("true")) out.println("active");%>">
                            <a class="nav-link" href="/library/?path=list?SORT=2&RETURN=true">반납</a>
                        </li>
                        <li class="nav-item <%if(strPath.equals("AddBook.jsp")) out.println("active");%>">
                            <a class="nav-link" href="/library/?path=AddBook.jsp">추가</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link <%if(strPath.equals("MemberListView.jsp")) out.println("active");%>" href="?path=MemberInfo">회원 리스트</a>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle <%if(strPath.equals("BBSListView.jsp") && sort != 0 && !returnVal.equals("true")) out.println("active");%>" href="#" id="dropdown01" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">정렬</a>
                            <div class="dropdown-menu" aria-labelledby="dropdown01">
                                <a class="dropdown-item <%if(strPath.equals("BBSListView.jsp") && sort == 1) out.println("bg-dark active");%>" href="/library/?path=list?SORT=1">대여량 기준</a>
                                <a class="dropdown-item <%if(strPath.equals("BBSListView.jsp") && sort == 2 && !returnVal.equals("true")) out.println("bg-dark active");%>" href="/library/?path=list?SORT=2">대여된 책</a>
                                <a class="dropdown-item <%if(strPath.equals("BBSListView.jsp") && sort == 3) out.println("bg-dark active");%>" href="/library/?path=list?SORT=3">대여 가능한 책</a>
                            </div>
                        </li>
                    </ul>
                    <a id="logout" href="/library/Logout.jsp">로그아웃</a>
                </div>
            </div>
        </nav>
        <main role="main" class="container" style="margin-top:56px; background:#fff;">
            <% if (strPath.equals("index")){ %>
            <div id="myCarousel" class="carousel slide" data-ride="carousel">
                <ol class="carousel-indicators">
                    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                    <li data-target="#myCarousel" data-slide-to="1"></li>
                    <li data-target="#myCarousel" data-slide-to="2"></li>
                </ol>
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <svg class="bd-placeholder-img" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img">
                            <img src="https://cdn.pixabay.com/photo/2017/08/07/19/49/library-2607146_960_720.jpg" alt=""></svg>
                        <div class="container">
                            <div class="carousel-caption text-left" style="background-color: rgba(0,0,0, 0.2); padding-left: 50px;">
                                <h1>도서대여 시스템</h1>
                                <p>회원가입 한 사용자만 이용할 수 있어요.</p>
                                <p>또한, 도서를 누가 대여했는지 쉽게 확인할 수 있습니다.</p>
                                <p><a class="btn btn-lg btn-primary" href="https://test.oseonsik.com/library/?path=list?SORT=2" role="button">대여된 책 보러가기</a></p>
                            </div>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <svg class="bd-placeholder-img"  width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img">
                            <img src="https://cdn.pixabay.com/photo/2016/08/24/16/20/books-1617327_1280.jpg" alt=""></svg>
                        </svg>
                        <div class="container">
                            <div class="carousel-caption" style="background-color: rgba(0,0,0, 0.4);">
                                <h1>쉬운 회원관리</h1>
                                <p>회원 리스트를 통해 회원들의 정보를 빠르고 쉽게 찾을 수 있습니다.</p>
                                <p><a class="btn btn-lg btn-primary" href="https://test.oseonsik.com/library/?path=MemberInfo" role="button">회원리스트 보러가기</a></p>
                            </div>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <svg class="bd-placeholder-img" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img">
                            <img src="https://cdn.pixabay.com/photo/2017/08/06/22/01/books-2596809_1280.jpg" alt=""></svg>
                        </svg>
                        <div class="container">
                            <div class="carousel-caption text-right" style="background-color: rgba(0,0,0, 0.3); padding-right: 50px;">
                                <h1>도서반납</h1>
                                <p>도서를 빌린 사람만이 반납을 할 수 있는게 맞습니다.<br> 따라서 로그인 한 사용자만이 대여된 책을 직접 반납합니다.</p>
                                <p><a class="btn btn-lg btn-primary" href="https://test.oseonsik.com/library/?path=list?SORT=2&RETURN=true" role="button">반납하러 가기</a></p>
                            </div>
                        </div>
                    </div>
                </div>
                <a class="carousel-control-prev" href="#myCarousel" role="button" data-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" href="#myCarousel" role="button" data-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
            <div class="container marketing">
                <div class="row">
                    <div class="col-lg-4">
                        <img class="rounded-circle" width="140" height="140" src="./img/lock.png" />
                        <h2>암호화</h2>
                        <p>비밀번호를 평문으로 데이터베이스에 보관하는<br> 방식은 상당히 위험합니다. <br>따라서 SHA256방식으로 암호화하여 <br>데이터베이스에 보관합니다.</p>
                    </div><!-- /.col-lg-4 -->
                    <div class="col-lg-4">
                        <img width="140" height="140" src="./img/document.png" />
                        <h2>SSL</h2>
                        <p>기존의 http 통신보다 보안이 한층 강화된 <br>인증서를 사용한 https통신을 활용하여 <br>보안성을 높였습니다.</p>
                    </div>
                    <div class="col-lg-4">
                        <img style="width:140px; height: 140px;"src="./img/monitor.png" />
                        <h2>반응형 웹</h2>
                        <p>모바일 기기에서도 혹은 화면이 태블릿에서<br> 또한, 화면크기가 작은 데스크탑 역시<br> 최적의 UI를 제공해 사용성을 향상시켰습니다.</p>
                    </div>
                    <div class="col-lg-4">
                        <img style="width:140px; height: 140px;"src="./img/shield.png" />
                        <h2>XSS</h2>
                        <p>사용자의 모든 데이터 입력 중<br> 불순한 의도가 보이는 문장은 정규식을 통해<br> 사전에 차단되어 보안성을 높였습니다.</p>
                    </div>
                    <div class="col-lg-4">
                        <img style="width:140px; height: 140px;"src="./img/injection.png" />
                        <h2>SQL Injection</h2>
                        <p>Prepared Statement를 통해 SQL문을<br> DB에 전달하기 전 미리 컴파일하여<br> SQL Injection으로 부터 사용자의 <br> 데이터를 안전하게 지켜냅니다.</p>
                    </div>
                    <div class="col-lg-4">
                        <img style="width:140px; height: 140px;"src="./img/member.png" />
                        <h2>회원가입 제도</h2>
                        <p>로그인한 사용자만 사용 가능한 제약을 통해<br> 도서의 정확한 추적을 도와 사이트의<br> 운영에 안정성과 사용성을 향상시켰습니다.</p>
                    </div>
                </div>
            <%}else{%>
                <jsp:include page="<%=strPath%>"/>
            <%}%>
        </main>

        <footer class="footer mt-auto py-3 bg-dark">
            <div class="container" style="text-align: center">
                <span class="text-muted">About: 2020 가톨릭대학교 객체지향 패러다임 개인 프로젝트</span><br>
                <span class="text-muted">Contact me: dhtjstlr777@gmail.com</span><br>
                <span class="text-muted">Copyrightⓒ 2020 O's All rights reserved.</span><br>
            </div>
        </footer>
    </body>
    <script>
        const checkBlank = (value) => {
            let blank_pattern = /^\s+|\s+$/g;
            if (value.replace(blank_pattern, "") == "") {
                alert("공백 문자는 사용할 수 없습니다.");
                return false;
            }
            return true;
        };

        const checkSpecial = (value) => {
            let special_pattern = /[\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(\'\"]/gi;
            if (special_pattern.test(value) == true) return false;
            return true;
        };

        const checkInteger = (value) => {
            if (!(/^(\-|\+)?([0-9]+)$/.test(value) && parseInt(value) > 0)) return false;
            return true;
        };
    </script>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
</html>
