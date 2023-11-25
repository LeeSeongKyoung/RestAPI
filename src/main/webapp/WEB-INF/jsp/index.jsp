<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>멤버 리스트</title>
    <!-- 부트스트랩 CDN 추가 -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<div class="container mt-5">
    <div class="row">
        <div class="col-8">
            <h2 class="mb-4">멤버 리스트</h2>
        </div>
        <div class="col-4 text-right">
            <!-- 멤버 등록 버튼 -->
            <button type="button" class="btn btn-primary mb-3" data-toggle="modal" data-target="#addMemberModal">
                멤버 등록
            </button>
        </div>
    </div>

    <!-- 멤버 리스트 테이블 -->
    <table class="table">
        <thead>
        <tr>
            <th>ID</th>
            <th>이름</th>
            <th>나이</th>
            <th>관리</th>
            <!-- 필요한 다른 컬럼들 추가 -->
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>hong12</td>
            <td>홍길동</td>
            <td>12</td>
            <td>
                <button type="button" class="btn btn-warning mb-4" data-toggle="modal" data-target="#addMemberModal">
                    수정
                </button>
                <button type="button" class="btn btn-danger mb-4" data-toggle="modal" data-target="#addMemberModal">
                    삭제
                </button>
            </td>
        </tr>
        <tr>
            <td>hong12</td>
            <td>홍길동</td>
            <td>12</td>
            <td>
                <button type="button" class="btn btn-warning mb-4" data-toggle="modal" data-target="#addMemberModal">
                    수정
                </button>
                <button type="button" class="btn btn-danger mb-4" data-toggle="modal" data-target="#addMemberModal">
                    삭제
                </button>
            </td>
        </tr>
        <tr>
            <td>hong12</td>
            <td>홍길동</td>
            <td>12</td>
            <td>
                <button type="button" class="btn btn-warning mb-4" data-toggle="modal" data-target="#addMemberModal">
                    수정
                </button>
                <button type="button" class="btn btn-danger mb-4" data-toggle="modal" data-target="#addMemberModal">
                    삭제
                </button>
            </td>
            <!-- 필요한 다른 컬럼들 추가 -->
        </tr>
        </tbody>
    </table>
</div>

<!-- 멤버 등록 모달 -->
<div class="modal" id="addMemberModal">
    <div class="modal-dialog">
        <div class="modal-content">
            <!-- 모달 내용 -->
            <!-- 필요한 폼 요소들을 추가 -->
        </div>
    </div>
</div>

<!-- 부트스트랩 및 jQuery CDN 추가 -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
