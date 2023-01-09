<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<div class="body-title">
	<a href="controller?command=go_to_news_list">News >> </a> News List
</div>

<form action="controller" method="post">
	<c:forEach var="news" items="${requestScope.news}">
		<div class="single-news-wrapper">
			<div class="single-news-header-wrapper">
				<div class="news-title">
					<c:out value="${news.title}" />
				</div>
				<div class="news-date">
					<c:out value="${news.newsDate}" />
				</div>

				<div class="news-content">
					<c:out value="${news.briefNews}" />
				</div>
				<div class="news-link-to-wrapper">
					<div class="link-position">
						<c:if test="${sessionScope.role eq 'admin'}">
						      <a href="controller?command=go_to_add_news&id=${news.idNews}">editlink </a> 
						</c:if>
						
						<a href="controller?command=go_to_view_news&id=${news.idNews}">viewlink </a> 
   					     
   					    <c:if test="${sessionScope.role eq 'admin'}">
   					         <input type="checkbox" name="idNews" value="${news.idNews }" />
   					    </c:if>
					</div>
				</div>

			</div>
		</div>

	</c:forEach>
	
	 <c:if test="${sessionScope.role eq 'admin'}">
	 <div class = "delete-button-position">

		<input type="hidden" name="command" value="go_to_confirmation_page" />
		 <input type="submit" value="Delete" />
	
	</div>
	 </c:if>

<!-- 	 	<logic:notEmpty name="newsForm" property="newsList"> -->
<!-- 		<div class="delete-button-position"> -->
<!-- 			<html:submit> -->
<!-- 				<bean:message key="locale.newslink.deletebutton" /> -->
<!-- 			</html:submit> -->
<!-- 		</div> -->
<!-- 	</logic:notEmpty>  -->

	<div class="no-news">
		<c:if test="${requestScope.news eq null}">
        No news.
	</c:if>
	</div>
</form>
