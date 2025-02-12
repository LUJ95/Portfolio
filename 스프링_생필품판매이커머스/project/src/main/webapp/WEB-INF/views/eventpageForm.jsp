<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>공지사항 업로드</title>
    <link rel="stylesheet" href="<c:url value='/resources/css/style.css' />">
    <style>
        /* 기본 페이지 스타일 */
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            flex-direction: column;
        }

        h1 {
            font-size: 24px;
            color: #333;
            margin-bottom: 20px;
        }

        /* 폼 스타일 */
        form {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 600px;
        }

        div {
            margin-bottom: 15px;
        }

        label {
            font-size: 16px;
            color: #333;
            display: block;
            margin-bottom: 5px;
        }

        input[type="text"],
        textarea {
            width: 100%;
            padding: 10px;
            font-size: 14px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
        }

        textarea {
            resize: vertical;
        }

        input[type="file"] {
            padding: 5px;
        }

        /* 제출 버튼 스타일 */
        button {
            background-color: #007bff;
            color: white;
            border: none;
            padding: 10px 20px;
            font-size: 16px;
            cursor: pointer;
            border-radius: 4px;
            width: 100%;
        }

        button:hover {
            background-color: #0056b3;
        }

        /* 결과 메시지 스타일 */
        .msg {
            background-color: #d4edda;
            color: #155724;
            padding: 10px;
            border-radius: 4px;
            margin-top: 20px;
            width: 100%;
            max-width: 600px;
        }

        .msg strong {
            font-weight: bold;
        }
    </style>
</head>
<body>
    <h1>공지사항 업로드</h1>

    <!-- 공지사항 업로드 폼 -->
    <form action="<c:url value='/eventpageForm' />" method="post" enctype="multipart/form-data">
        <!-- 제목 -->
        <div>
            <label for="ntitle">제목:</label>
            <input type="text" id="ntitle" name="ntitle" required>
        </div>

        <!-- 내용 -->
        <div>
            <label for="ncontent">내용:</label>
            <textarea id="ncontent" name="ncontent" rows="5" cols="50" required></textarea>
        </div>

        <!-- 파일 업로드 -->
        <div>
            <label for="multiFile">파일 업로드:</label>
            <input type="file" id="multiFile" name="multiFile" multiple>
        </div>

        <!-- 제출 버튼 -->
        <div>
            <button type="submit">공지사항 등록</button>
        </div>
    </form>

    <!-- 업로드 결과 메시지 표시 -->
    <c:if test="${not empty msg}">
        <div class="msg">
            <strong>${msg}</strong>
        </div>
    </c:if>
</body>
</html>
