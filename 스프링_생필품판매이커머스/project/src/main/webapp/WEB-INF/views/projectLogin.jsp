<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
@charset "UTF-8";

*{
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: monospace;
}

body {
	padding-top: 10%;
	background-color: #CCD5AE;
	background: linear-gradient(to right, #FAEDCE, #CCD5AE);
	display: flex;
	align-items: center;
	justify-content: cneter;
	flex-direction: column;
	height: 100vh;
}

.container{
	background-color: white;
	border-radius: 30px;
	box-shadow: 0 5px 15px rgba(0,0,0,0.35);
	position: relative;
	overflow: hidden;
	width: 780px;
	max-width: 100%;
	min-height: 600px;
}

.container p{
	font-size: 14px;
	line-height: 20px;
	letter-spacing: 0.3px;
	margin: 20px 0;
}

.container span{
	font-size: 12px;
}

.container a{
	color: gray;
	font-size: 13px;
	text-decoration: none;
	margin:15px 0 10px;
}

.container button{
	background-color: #CCD5AE;
	color: gray;
	font-size: 12px;
	padding: 10px 45px;
	border: 1px solid transparent;
	border-radius: 8px;
	font-weight: 600;
	letter-spacing: 0.5px;
	text-transform: uppercase;
	margin-top: 10px;
	cursor: pointer;
}

.container button.hidden {
	background-color: white;
	border-color: white;
}

.container form{
	background-color: white;
	display: flex;
	align-items: cetner;
	justify-content: center;
	flex-direction: column;
	padding: 0 40px;
	height: 100%;
}

.container input{
	background-color: #CCD5AE;
	color: gray;
	border: none;
	margin: 8px 0;
	padding: 10px 15px;
	font-size: 13px;
	border-radius: 8px;
	width: 100%;
	outline: none;
}

.form-container{
	position: absolute;
	top: 0;
	height: 100%;
	transition: all 0.6s ease-in-out;
}

.sign-in{
	left: 0;
	width: 50%;
	z-index: 2;
}

.container.active .sign-in{
	transform: translateX(100%);
}

.sign-up{
	left: 0;
	width: 50%;
	opacity: 0;
	z-index: 1;
}

.container.active .sign-up {
	transform: translateX(100%);
	opacity: 1;
	z-index: 5;
	animation: move 0.6s;
}

@keyframes move{
	0%,49.99%{
	opacity: 0;
	z-index: 1;
	}
	50%, 100% {
	opacity: 1;
	z-index: 5;
	}
}

.social-icons{
	margin: 20px 0;
}

.social-icons a{
	border: 1px solid white;
	border-radius: 20%;
	display: inline-flex;
	justify-content: center;
	align-items: center;
	margin: 0 3px;
	width: 40px;
	height: 40px;	
}

.toggle-container{
	position: absolute;
	top: 0;
	left: 50%;
	width: 50%;
	height: 100%;
	overflow: hidden;
	transition: all 0.6s ease-in-out;
	border-radius: 150px 0 0 100px;
	z-index: 1000;
}

.container.active .toggle-container{
	transform: translateX(-100%);
	border-radius: 0 150px 100px 0;
}

.toggle{
	background-color: #CCD5AE;
	height: 100%;
	background: #CCD5AE;
	color: gray;
	position: relative;
	left:-100%;
	height: 100%;
	width: 200%;
	transform: translateX(0);
	transition: all 0.6s ease-in-out;
}

.container.active .toggle{
	transform: translateX(50%);
}

.toggle-panel{
	position: absolute;
	width: 50%;
	height: 100%;
	align-items: center;
	justify-content: center;
	flex-direction: column;
	padding: 0 30px;
	text-align: center;
	top:0;
	transform: translateX(0);
	transition: all 0.6s ease-in-out;
}

.toggle-left{
	padding-top: 25%;
	transform: translateX(-200%);
}

.container.active .toggle-left{
	transform: translateX(0);
}

.toggle-right{
	padding-top: 25%;
	right: 0;
	transform: translateX(0);
}


.container.active .toggle-right{
	transform: translateX(200%);
}

.radio-group {
    display: flex;
    gap: 10px;
}

.radio {
    display: flex;
    align-items: center;
    cursor: pointer;
    font-size: 16px;
    color: #333;
}

.radio input[type="radio"] {
    display: none; /* 기본 라디오 버튼 숨기기 */
}

.custom-radio {
    width: 20px;
    height: 20px;
    border: 2px solid #999;
    border-radius: 50%;
    margin-right: 10px;
    display: inline-block;
    position: relative;
    background-color: #fff;
    transition: border-color 0.2s ease, background-color 0.2s ease;
}

.radio input[type="radio"]:checked + .custom-radio {
    border-color: #007bff;
    background-color: #007bff;
}

.radio input[type="radio"]:checked + .custom-radio::after {
    content: "";
    width: 10px;
    height: 10px;
    background-color: #fff;
    border-radius: 50%;
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
}


</style>
</head>
<body>

<c:if test="${not empty msg}">
   <script>
      alert("${msg}");
   </script>
</c:if>

<div class="container" id="container">
	<div class="form-container sign-up">
		<form method="post" action="projectLogin/join">
			<h1>Create Account</h1>
			<div class="social-icons">
				<a href="#" class="icon">
				<i class="fa-brands fa-google"></i>
				</a>
				<a href="#" class="icon">
				<i class="fa-brands fa-facebook"></i>
				</a>
				<a href="#" class="icon">
				<i class="fa-brands fa-github"></i>
				</a>
				<a href="#" class="icon">
				<i class="fa-brands fa-linkedin-in"></i>
				</a>
			</div>
			<span>or use your email for registration</span>
			<!-- 유저 히든정보 -->
			<input type="hidden" name="cadd2" value=null />
			<input type="hidden" name="cadd3" value=null />
			<input type="hidden" name="cdateq" value="" />
			<input type="hidden" name="cgrade" value="M001" />
			<input type="hidden" name="userStatus" value="A001" />
			
			<!-- 유저 사용 정보 -->
			<input type="text" placeholder="ID" name="cid">
			<input type="password" placeholder="Password" name="cpass">
			<input type="text" placeholder="Name" name="cname">
			<input type="text" placeholder="Email" name="cemail">
			<input type="text" placeholder="Address" name="cadd1">
			<input type="text" placeholder="Phone" name="cphone">
			<div class="radio-group">
    			<label class="radio">
      			  	<input type="radio" name="cgender" value=1 checked />
        			<span class="custom-radio"></span>
        		남성
    			</label>
    			<label class="radio">
     				<input type="radio" name="cgender" value=2 />
        			<span class="custom-radio"></span>
        		여성
    			</label>
			</div>
			<button type="submit" ><b>Sign Up</b></button>
		</form>
	</div>
	<div class="form-container sign-in">
		<form method="post">
			<h1>Sign In</h1>
			<div class="social-icons">
				<a href="#" class="icon">
				<i class="fa-brands fa-google"></i>
				</a>
				<a href="#" class="icon">
				<i class="fa-brands fa-facebook"></i>
				</a>
				<a href="#" class="icon">
				<i class="fa-brands fa-github"></i>
				</a>
				<a href="#" class="icon">
				<i class="fa-brands fa-linkedin-in"></i>
				</a>
			</div>
			<span>or use your email password</span>
			
			<input type="text" placeholder="Email" name="cid">
			<input type="password" placeholder="Password" name="cpass">
			<a href="#">Forgot Your Password?</a>
			<button type="submit" ><b>Sign In</b></button>
		</form>
	</div>
	<div class="toggle-container">
		<div class="toggle">
			<div class="toggle-panel toggle-left">
				<h1>Welcome Back!</h1>
				<p>Enter your personal details to use all of our site features</p>
				<button class="hidden" id="login"><b>Sign In</b></button>
			</div>
			<div class="toggle-panel toggle-right">
				<h1>Hello, ${cname}</h1>
				<p>Enter your personal details to use all of our site features</p>
				<button class="hidden" id="register"><b>Sign Up</b></button>
			</div>
		</div>
	</div>
</div>

<script>
    // JavaScript to set the current date and time in ISO format
    const registrationDateField = document.getElementById("registrationDate");
    const now = new Date();
    registrationDateField.value = now.toISOString(); // Format: 2024-11-17T15:34:00.000Z
</script>


<script>


const container = document.getElementById('container');
const registerBtn = document.getElementById('register');
const loginBtn = document.getElementById('login');


registerBtn.addEventListener('click', () => {
	container.classList.add("active");
} )
loginBtn.addEventListener('click', () => {
	container.classList.remove("active");
})
</script>
</body>
</html>