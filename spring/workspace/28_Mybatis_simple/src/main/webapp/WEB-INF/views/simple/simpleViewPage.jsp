<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8" />
	<title>Document</title>
	<c:if test="${not empty updateResult}">
		<script>
			if('${updateResult}' > 0) {
				alert('수정이 성공하였습니다.');
			} else {
				alert('수정이 실패하였습니다.');
			}
		</script>
	</c:if>
</head>
<body>
	<h3>${simpleDto.no}번 게시글입니다</h3>
	작성자: ${simpleDto.writer}<br/>
	제목: ${simpleDto.title}<br/>
	내용<br/>
	<pre>${simpleDto.content}</pre><br/>
	작성일: ${simpleDto.regDate}<br/><br />
	<form method="post">
		<input type="hidden" name="no" value="${simpleDto.no}" />
		<input type="hidden" name="writer" value="${simpleDto.writer}" />
		<input type="hidden" name="title" value="${simpleDto.title}" />
		<input type="hidden" name="content" value="${simpleDto.content}" />
		<input type="hidden" name="page" value="${page}" />
		<input type="button" value="수정하러가기" onclick="fn_simpleUpdatePage(this.form)" />
		<input type="button" value="삭제하기" onclick="fn_simpleDelete(this.form)" />
		<input type="button" value="목록으로돌아가기" onclick="location.href='simpleList.do?page=${page}'" />
	</form>
	<script type="text/javascript">
		function fn_simpleUpdatePage(f) {
			f.action = 'simpleUpdatePage.do';
			f.submit();
		}
		
		function fn_simpleDelete(f) {
			if(confirm('정말 삭제하시겠습니까?')) {
				f.action = "simpleDelete.do";
				f.submit();
			}
		}
	</script>
</body>
</html>