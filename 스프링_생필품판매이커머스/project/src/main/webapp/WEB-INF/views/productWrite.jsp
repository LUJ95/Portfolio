<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>상품 등록</title>
<style>
        body {
            font-family: Arial, sans-serif;
            max-width: 800px;
            margin: 20px auto;
        }
        form {
            display: flex;
            flex-direction: column;
            gap: 15px;
        }
        label {
            font-weight: bold;
        }
        input, textarea, select, button {
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            width: 100%;
            box-sizing: border-box;
        }
        textarea {
            resize: vertical;
        }
        .file-upload {
            display: flex;
            flex-direction: column;
            gap: 5px;
        }
        .file-upload span {
            font-size: 0.9em;
            color: #666;
        }
        button {
            background-color: #007bff;
            color: white;
            border: none;
            cursor: pointer;
        }
        button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
	 <h1>상품 등록</h1>
    <form action="/productWrite" method="POST" enctype="multipart/form-data">
        <input type="hidden" name="pdel" value="G001" />
        <input type="hidden" name="preadcnt" value=0 />
        
        <label for="name">상품 이름</label>
        <input type="text" id="pname" name="pname" placeholder="상품 이름을 입력하세요">

        <label for="brand">브랜드</label>
        <input type="text" id="bname" name="bname" placeholder="브랜드명을 입력하세요">

        <label for="description">상품 설명</label>
        <textarea id="pdes" name="pdes" placeholder="상품 설명을 입력하세요" rows="5"></textarea>

		<label for="name">용량</label>
        <input type="text" id="pvol" name="pvol" placeholder="상품 용량을 입력하세요">

        <label for="price">가격</label>
        <input type="number" id="pprice" name="pprice" placeholder="가격을 입력하세요">

        <label for="category">카테고리</label>
        <select id="pcat" name="pcat">
            <option value="">카테고리를 선택하세요</option>
            <option value="Shampoo">Shampoo</option>
            <option value="Bodywash">Bodywash</option>
            <option value="Toner">Toner</option>
            <option value="Serum">Serum</option>
            <option value="Mask">Mask</option>
            <option value="Treatment">Treatment</option>
            <option value="Set">Set</option>
        </select>

        <label for="quantity">수량</label>
        <input type="number" id="pqt" name="pqt" placeholder="수량을 입력하세요">

        <label for="options">옵션</label>
        <input type="number" id="pop1" name="pop1" placeholder="예:용량 등">
  
       	<div class="file-upload">
            <label for="multiFile">이미지 업로드 (최대 10장)</label>
            <input type="file" id="multiFile" name="multiFile" accept="image/*" multiple>
            <span>이미지를 최대 10장 업로드할 수 있습니다.</span>
        </div>

        <button type="submit">등록하기</button>
    </form>
</body>
</html>