<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<% String msg= request.getParameter("input");
	msg=URLEncoder.encode(msg,"utf-8");
	System.out.println(msg);%>
<style>
.img {
	width: 28px;
}

.page {
	font-size: 20px;
}
</style>
<%--Page 이전 페이지 구현 --%>
<c:choose>
	<c:when test="${search == null}">
		<%-- <c:choose>
			<c:when test="${pageInfo.currentBlock eq 1}">
				<img src="resources/img/prev1.png">
			</c:when>
			<c:otherwise>
				<a
					href="totalsearch?page=
									${(pageInfo.currentBlock-1)*pageInfo.pagesPerBlock }">
					<img src="resources/img/prev1.png">
				</a>
			</c:otherwise>
		</c:choose> --%>

		<%--Page  페이지 구현 --%>
		<c:choose>
			<c:when test="${pageInfo.currentBlock ne pageInfo.totalBlocks}">
				<c:forEach begin="1" end="${pageInfo.pagesPerBlock}" varStatus="num">
                        [<a
						href="totalsearch?page=
                        ${(pageInfo.currentBlock - 1) * pageInfo.pagesPerBlock + num.count }">
						${(pageInfo.currentBlock- 1) * pageInfo.pagesPerBlock + num.count }</a>]
                    			</c:forEach>
			</c:when>
			<c:otherwise>
				<c:forEach
					begin="${(pageInfo.currentBlock-1)*pageInfo.pagesPerBlock + 1}"
					end="${pageInfo.totalPages}" varStatus="num">
                        [<a
						href="totalsearch?page=
										${(pageInfo.currentBlock - 1) * pageInfo.pagesPerBlock + num.count }">
						${(pageInfo.currentBlock - 1) * pageInfo.pagesPerBlock + num.count }</a>]
                    </c:forEach>
			</c:otherwise>
		</c:choose>


		<%--Page 다음 페이지 구현 --%>
		<%-- <c:choose>
			<c:when test="${pageInfo.currentBlock eq pageInfo.totalBlocks}">
				<img src="resources/img/next1.png">
			</c:when>
			<c:otherwise>
				<a
					href="totalsearch?page=
									${pageInfo.currentBlock * pageInfo.pagesPerBlock + 1 }">
					<img src="resources/img/next1.png">
				</a>
			</c:otherwise>
		</c:choose> --%>
	</c:when>
	<c:otherwise>

		<%-- <c:choose>
			<c:when test="${pageInfo.currentBlock eq 1}">
				<img src="resources/img/prev1.png">
			</c:when>
			<c:otherwise>
				<a
					href="totalsearch?input=<%=msg %>&page=
									${(pageInfo.currentBlock-1)*pageInfo.pagesPerBlock }">
					<img src="resources/img/prev1.png">
				</a>
			</c:otherwise>
		</c:choose> --%>

		<%--Page  페이지 구현 --%>
		<c:choose>
			<c:when test="${pageInfo.currentBlock ne pageInfo.totalBlocks}">
				<c:forEach begin="1" end="${pageInfo.pagesPerBlock}" varStatus="num">
                        [<a
						href="totalsearch?input=<%=msg %>&page=
                        ${(pageInfo.currentBlock - 1) * pageInfo.pagesPerBlock + num.count }">
						${(pageInfo.currentBlock- 1) * pageInfo.pagesPerBlock + num.count }</a>]
                    			</c:forEach>
			</c:when>
			<c:otherwise>
				<c:forEach
					begin="${(pageInfo.currentBlock-1)*pageInfo.pagesPerBlock + 1}"
					end="${pageInfo.totalPages}" varStatus="num">
                        [<a
						href="totalsearch?input=<%=msg %>&page=
										${(pageInfo.currentBlock - 1) * pageInfo.pagesPerBlock + num.count }">
						${(pageInfo.currentBlock - 1) * pageInfo.pagesPerBlock + num.count }</a>]
                    </c:forEach>
			</c:otherwise>
		</c:choose>


		<%--Page 다음 페이지 구현 --%>
		<%-- <c:choose>
			<c:when test="${pageInfo.currentBlock eq pageInfo.totalBlocks}">
				<img src="resources/img/next1.png">
			</c:when>
			<c:otherwise>
				<a
					href="totalsearch?input=${search}&page=
									${pageInfo.currentBlock * pageInfo.pagesPerBlock + 1 }">
					<img src="resources/img/next1.png">
				</a>
			</c:otherwise>
		</c:choose> --%>
	</c:otherwise>
</c:choose>
