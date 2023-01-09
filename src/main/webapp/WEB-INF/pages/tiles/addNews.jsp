<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script type="text/javascript">
<%@include file="/script/validation.js"%>
</script>

<div class="body-title">
	<a href="controller?command=go_to_news_list">News >> </a> Add News
</div>
<form name="form" action="controller" method="post" onsubmit="return validate()">
	<div class="add-table-margin">

		<table class="news_text_format">
			<tr>
				<td class="space_around_title_text">News Title</td>
				<td>
					<div class="title_field">
						<input type="text" name="title" value="${requestScope.news.title}"
							class="text_field" required /><br />
					</div>
				</td>

			</tr>
			<tr>
				<td class="space_around_title_text">News Date</td>
				<td><input type="date" name="date"
					value="${requestScope.news.newsDate}" class="date_field" required /><br />

				</td>
			</tr>
			<tr>
				<td class="space_around_title_text">Brief</td>
				<td>
					<div class="brief_field_format">
						<input type="text" name="brief"
							value="${requestScope.news.briefNews}" class="brief_field"
							required /><br />
					</div>
				</td>
			</tr>
			<tr>
				<td class="space_around_title_text">Content</td>
				<td>
					<div class="content_field_format">
						<input type="text" name="content"
							value="${requestScope.news.content}" class="content_field"
							required /><br />
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="button_field">
						<input type="hidden" name="command" value="save_news" /> <input
							type="submit" value="Save" />
					</div>
				</td>

			</tr>
		</table>
	</div>
</form>

<table>
	<tr>
		<td><c:choose>
				<c:when test="${not (requestScope.news eq null)}">
					<form action="controller" method="post">
						<input type="hidden" name="command" value="go_to_view_news" /> 
						<input type="hidden" name="id" value="${requestScope.news.idNews}" /> 
						<input type="submit" value="Cancel" />
					</form>
				</c:when>
				<c:otherwise>
					<form action="controller" method="post">
						<input type="hidden" name="command" value="go_to_news_list" />
						 <input type="submit" value="Cancel" />
					</form>
				</c:otherwise>
			</c:choose></td>
	</tr>
</table>





