<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>wishlist</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f9f9f9;
            color: #333;
        }

        .container {
            max-width: 900px;
            margin: 50px auto;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
        }

        h1 {
            text-align: center;
            font-size: 28px;
            margin-bottom: 20px;
            color: #111;
        }

        form {
            display: flex;
            justify-content: space-between;
            margin-bottom: 20px;
        }

        input[type="text"] {
            width: 75%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 16px;
        }

        button {
            padding: 10px 20px;
            font-size: 16px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            background-color: #007aff;
            color: #fff;
            transition: background-color 0.3s ease;
        }

        button:hover {
            background-color: #0056c1;
        }

        ul {
            list-style: none;
            padding: 0;
            margin: 0;
        }

        li {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px 15px;
            border: 1px solid #ddd;
            border-radius: 5px;
            margin-bottom: 10px;
            background-color: #fefefe;
        }

        li:hover {
            background-color: #f0f8ff;
        }

        .remove-btn {
            padding: 5px 15px;
            font-size: 14px;
            border: none;
            border-radius: 5px;
            background-color: #ff3b30;
            color: #fff;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .remove-btn:hover {
            background-color: #c1271a;
        }

        .back-btn {
            display: block;
            text-align: center;
            margin-top: 20px;
            text-decoration: none;
            font-size: 16px;
            color: #007aff;
            transition: color 0.3s ease;
        }

        .back-btn:hover {
            color: #0056c1;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>찜 목록</h1>

    <!-- 제품 추가 폼 -->
    <form action="${contextPath}/wishlist/add" method="post">
        <input type="text" name="product" placeholder="추가할 제품명을 입력하세요" required>
        <button type="submit">추가</button>
    </form>

    <!-- 찜 목록 -->
    <ul>
        <c:forEach var="item" items="${wishlist}">
            <li>
                ${item}
                <form action="${contextPath}/wishlist/remove" method="post" style="margin: 0;">
                    <input type="hidden" name="product" value="${item}">
                    <button type="submit" class="remove-btn">삭제</button>
                </form>
            </li>
        </c:forEach>
    </ul>

    <!-- 뒤로가기 버튼 -->
    <a href="/" class="back-btn">홈으로 돌아가기</a>
</div>
</body>
</html>