<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <title>MonA Login</title>
    <link rel="stylesheet" href="./CSS/main.css">
    <link rel="stylesheet" href="./CSS/login.css">
</head>
<body>
<div class="header">
        <div class="header-logo">
            <a href="/index.html">MonA</a>
        </div>
        <ul class="header-sign">
            <li><a href="/login.html">로그인</a></li>
            <li><a href="#">회원가입</a></li>

        </ul>

    </div>
    <main class="loginform">  
        <div class="loginform-con">
            <h2>Login</h2>
            <form class="input" action="LoginCon" method="post">
                <h3>Username</h3>
                <div class="inputlogin" >
                    <input type="text" style="border: none; background-color: transparent;" name="id" >
                </div>
                <h3>Password</h3>
                <div class="inputlogin">
                    <input type="text" style="border: none; background-color: transparent;" maxlength="15" name="pw">
                    <!-- input type="text" style="border: none; background: transparent;" -->
                </div>
                <div class="inputspan">
                    <span>Forgot your login information?</span>
                </div>
                <button class="inputsubmit" type="submit">
                    <span>Login</span>
                </button>
            </form>
            <div class="kana">
                <button>
                    <a href="#">Kakao Login</a>
                </button>
                <button>
                    <a href="#">Naver Login</a>
                </button>
                
                <div class="signUp">
                    <p class="signUp-p">
                        <a href="#">
                            Would you like to join. . .?</a>
                    </p>
                </div>
            </div>
        </div>
    </main>   

</body>
</html>