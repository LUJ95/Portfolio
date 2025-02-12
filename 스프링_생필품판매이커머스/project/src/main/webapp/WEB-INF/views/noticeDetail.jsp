<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>공지사항 상세보기</title>
    <!-- 기본 CSS 적용 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            background-color: #f9f9f9;
        }

        h2 {
            color: #333;
            text-align: center;
        }

        .notice-details {
            width: 80%;
            margin: 0 auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            border: 1px solid #ddd;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .notice-details table {
            width: 100%;
            margin-top: 20px;
            border-collapse: collapse;
        }

        .notice-details th, .notice-details td {
            padding: 10px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        .notice-details th {
            background-color: #f4f4f4;
            font-weight: bold;
        }

        .notice-details img {
            max-width: 100%;
            height: auto;
            border: 1px solid #ddd;
            padding: 5px;
            border-radius: 5px;
        }

        .button-container {
            display: flex;
            justify-content: center;
            margin-top: 20px;
        }

        .btn {
            width: 200px;
            text-align: center;
            background-color: #07f527;
            color: #fff;
            font-size: 16px;
            text-decoration: none;
            border-radius: 5px;
            padding: 10px;
            border: none;
            cursor: pointer;
        }

        .btn:hover {
            background-color: #0056b3;
        }

        .back-button {
            display: block;
            width: 200px;
            margin: 20px auto;
            padding: 10px;
            text-align: center;
            background-color: #007bff;
            color: #fff;
            font-size: 16px;
            text-decoration: none;
            border-radius: 5px;
        }

        .back-button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <h2>공지사항 상세보기</h2>
    <form action="Notice_Update" method="POST" enctype="multipart/form-data">
        <div class="notice-details">
            <table>
        				
                <tr>
                    <th><label for="ntitle">제목:</label></th>
                    <td><input type="text" id="ntitle" name="ntitle" value="${notice.ntitle}" required>
                    <input type="hidden" id="eno" name="eno" value="${notice.eno }" readonly></td>
                </tr>
                <tr>
                    <th><label for="ncontent">내용:</label></th>
                    <td><textarea id="ncontent" name="ncontent" rows="5" required>${notice.ncontent}</textarea></td>
                </tr>
                <tr>
                    <th><label for="ndate">날짜</label></th>
                    <td><input type="date" id="ndate" name="ndate" value="${notice.ndate}" required></td>
                </tr>
                <tr>
                    <th><label for="nimg">이미지:</label></th>
                    <td><input type="file" id="nimg" name="nimg" accept="image/*" value="${notice.nimg }"></td>
                </tr>
            </table>
        </div>
        <div class="button-container">
            <!-- 공지 올리기 버튼 -->
            <button type="submit">공지 올리기</button>
        </div>
    </form>
    <!-- 뒤로가기 버튼 -->
    <a href="eventpage" class="back-button">목록으로 돌아가기</a>

    
</body>
</html>
