<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<h3>Вы действительно хотите удалить новость?</h3>
		<table>
			<tr>
				<td>
					<div class="yes_button">
						<form action="controller" method="post">
							<input type="hidden" name="command" value="delete_news" /> 
							<input type="hidden" name="newsToDelete" value="${requestScope.idNews}" />
							<input type="submit" value="YES" />
						</form>
					</div>
				</td>
				<td>
					<div class="no_button">
						<form action="controller" method="post">
							<input type="hidden" name="command" value="go_to_view_news" /> 
							<input type="hidden" name="id" value="${requestScope.idNews[0]}" />
							<input type="submit" value="NO" />
						</form>
					</div>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>