<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>공지사항 목록</title>
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

        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
            background-color: #fff;
        }

        table, th, td {
            border: 1px solid #ddd;
        }

        th {
            background-color: #f4f4f4;
            text-align: center;
            padding: 10px;
            font-weight: bold;
        }

        td {
            text-align: center;
            padding: 10px;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        img {
            border: 1px solid #ddd;
            border-radius: 5px;
            padding: 5px;
        }

        /* 가운데 정렬을 위한 스타일 */
        .button-container {
            text-align: center;
            margin-top: 20px;
        }

        button, a {
            display: inline-block;
            padding: 10px 20px;
            margin: 10px;
            font-size: 14px;
            text-decoration: none;
            color: #fff;
            background-color: #007bff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            text-align: center;
        }

        button:hover, a:hover {
            background-color: #0056b3;
        }

        a {
            text-align: center;
        }
    </style>
</head>
<body>
    <h2>공지사항 목록</h2>

    <form action="" method="post" enctype="multipart/form-data">
        <table>
            <tr>
            	<th>Checkbox</th>
                <th>번호</th>
                <th>제목</th>
                <th>내용</th>
                <th>날짜</th>
                <th>이미지</th>
            </tr>
            <c:forEach var="notice" items="${noticelist}">
                <tr>
                	<td><input type="checkbox"></td>
                    <td>${notice.eno}</td>
                    <td><a class="origin-a" href="noticeDetail?eno=${notice.eno}"/>${notice.ntitle}</td>
                    <td>${notice.ncontent}</td>
                    <td>${notice.ndate}</td>
                    <td>
                        <c:if test="${notice.nimg != null}">
                            <img src="${notice.nimg}"  width="100" height="100"/>
                        </c:if>
                    </td>
                </tr>
            </c:forEach>
        </table>

        <!-- 가운데 정렬을 위한 버튼들 -->
        <div class="button-container">
            <button type="submit">공지사항 업로드</button>
            <a href="eventpageForm">공지사항 등록하기</a>
            <a href="admin_home">뒤로가기</a>
        </div>
    </form>
</body>
</html>
