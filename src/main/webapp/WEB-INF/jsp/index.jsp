<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <div class="col-12">
            <h2 class="mb-4">멤버 리스트</h2>
        </div>
    </div>

    <div class="row">
        <div class="col-md-8">
            <!-- 검색창 -->
<%--            <form class="form-inline">--%>
<%--                <div class="form-group">--%>
<%--                    <select class="form-control" id="searchType">--%>
<%--                        <option value="name">이름</option>--%>
<%--                        <option value="id">아이디</option>--%>
<%--                    </select>--%>
<%--                </div>--%>
<%--                <div class="form-group mx-sm-3">--%>
<%--                    <input type="text" class="form-control" id="searchInput" placeholder="검색어를 입력하세요">--%>
<%--                </div>--%>
<%--                <button type="submit" class="btn btn-primary">검색</button>--%>
<%--            </form>--%>
        </div>

        <div class="col-md-4 text-right">
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
        <c:choose>
            <c:when test="${not empty memberList}">
                <c:forEach items="${memberList}" var="member">
                    <tr>
                        <td>${member.id}</td>
                        <td>${member.name}</td>
                        <td>${member.age}</td>
                        <td>
                            <button type="button" class="btn btn-warning mb-4" data-toggle="modal" data-target="#addMemberModal">
                                수정
                            </button>
                            <button type="button" class="btn btn-danger mb-4" data-id="${member.id}" id="delBtn">
                                삭제
                            </button>
                        </td>
                    </tr>
                </c:forEach>
            </c:when>
            <c:otherwise>
                <tr>
                    <td colspan="3">조회된 멤버가 없습니다.</td>
                </tr>
            </c:otherwise>
        </c:choose>
        </tbody>
    </table>
</div>

<!-- 멤버 등록 모달 -->
<div class="modal" id="addMemberModal">
    <div class="modal-dialog">
        <div class="modal-content">
            <!-- 모달 내용 -->
            <div class="modal-header">
                <h4 class="modal-title">멤버 등록</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body">
                <!-- 등록 폼 -->
                <form id="addMemberForm">
                    <div class="form-group">
                        <label for="memberId">아이디:</label>
                        <input type="text" class="form-control" id="memberId" name="memberId" required>
                    </div>
                    <div class="form-group">
                        <label for="memberPassword">비밀번호:</label>
                        <input type="password" class="form-control" id="memberPassword" name="memberPassword" required>
                    </div>
                    <div class="form-group">
                        <label for="memberName">이름:</label>
                        <input type="text" class="form-control" id="memberName" name="memberName" required>
                    </div>
                    <div class="form-group">
                        <label for="memberAge">나이:</label>
                        <input type="number" class="form-control" id="memberAge" name="memberAge" required>
                    </div>
                    <button type="submit" class="btn btn-primary">등록</button>
                </form>
            </div>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>

    // 멤버 삭제
    $("#delBtn").on("click", function () {
        let id = $(this).data("id");
        $.ajax({
            type: "post",
            url: "/delMember.do",  // 변경된 URL
            data: { id: id },     // 변경된 데이터 전송 방식
            dataType: "json",
            success: function (data) {
                if (data.result) {
                    confirm("삭제 성공", function (res) {
                        if (res) {
                            location.reload();
                        }
                    });
                }
            },
            error: function (request) {
                alert("삭제 실패!");
            }
        });
    });

</script>
</body>
</html>
