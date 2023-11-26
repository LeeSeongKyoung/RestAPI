<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>멤버 관리</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<div class="container mt-5">
    <div class="row">
        <div class="col-12">
            <h2 class="mb-4">멤버 관리</h2>
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
            <button type="button" class="btn btn-primary mb-3" data-toggle="modal" data-target="#addMemberModal" data-dismiss="modal">
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
                            <button type="button" class="btn btn-warning mb-4 updtBtn" data-id="${member.id}" data-dismiss="modal">
                                수정
                            </button>
                            <button type="button" class="btn btn-danger mb-4 delBtn" data-id="${member.id}">
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
            <div class="modal-header">
                <h4 class="modal-title">멤버 등록</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body">
                <form id="addMemberForm">
                    <div class="form-group">
                        <label for="id">아이디:</label>
                        <input type="text" class="form-control" id="id" name="id" required>
                    </div>
                    <div class="form-group">
                        <label for="passwd">비밀번호:</label>
                        <input type="password" class="form-control" id="passwd" name="passwd" required>
                    </div>
                    <div class="form-group">
                        <label for="name">이름:</label>
                        <input type="text" class="form-control" id="name" name="name" required>
                    </div>
                    <div class="form-group">
                        <label for="age">나이:</label>
                        <input type="number" class="form-control" id="age" name="age" required>
                    </div>
                    <button type="button" class="btn btn-primary" id="memRgstBtn">등록</button>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- 멤버 수정 모달 -->
<div class="modal" id="updtMemberModal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">멤버 수정</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body">
                <form id="updtMemberForm">
                    <div class="form-group">
                        <label for="id">아이디:</label>
                        <input type="text" class="form-control" id="updt_id" name="id" readonly>
                    </div>
                    <div class="form-group">
                        <label for="name">이름:</label>
                        <input type="text" class="form-control" id="updt_name" name="name" required>
                    </div>
                    <div class="form-group">
                        <label for="age">나이:</label>
                        <input type="number" class="form-control" id="updt_age" name="age" required>
                    </div>
                    <button type="button" class="btn btn-primary" id="updtMemBtn">수정</button>
                </form>
            </div>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

<script>

    $(document).ready(function(){
        $("#updtMemberModal").hide();
    });

    // 멤버 등록
    $("#memRgstBtn").on("click", function () {
        $.ajax({
            type: "post",
            url: "/rgstMember.do",
            data: $("#addMemberForm").serialize(),
            dataType: "json",
            success: function (data) {
                if (data.result) {
                    confirm("등록 성공", function (res) {
                        if (res) {
                            location.reload();
                        }
                    });
                }
            },
            error: function (request) {
                alert("등록 실패!");
            }
        });
    });


    // 수정 - 멤버 정보 조회
    $(".updtBtn").on("click", function () {
        let id = $(this).data("id");
        $.ajax({
            type: "get",
            url: "/selMemberById.do",
            data: { id: id },
            dataType: "json",
            success: function (data) {
                $("#updt_id").val(data.id);
                $("#updt_name").val(data.name);
                $("#updt_age").val(data.age);

                $("#updtMemberModal").show();

            },
            error: function (request) {
                alert("삭제 실패!");
            }
        });
    });

    // 멤버 수정
    $("#updtMemBtn").on("click", function () {
        $.ajax({
            type: "patch",
            url: "/updtMember.do",
            data: {
                id : $("#updt_id").val(),
                name: $("#updt_name").val(),
                age: $("#updt_age").val()
            },
            dataType: "json",
            success: function (data) {
                if (data.result) {
                    confirm("수정 성공", function (res) {
                        if (res) {
                            location.reload();
                        }
                    });
                }
            },
            error: function (request) {
                alert("수정 실패!");
            }
        });
    });

    // 멤버 삭제
    $(".delBtn").on("click", function () {
        let id = $(this).data("id");
        $.ajax({
            type: "post",
            url: "/delMember.do",
            data: { id: id },
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
