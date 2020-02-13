<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%--Page ���� ������ ���� --%>
<c:choose>
	<c:when test="${searchType == null}">
		<c:choose>
			<c:when test="${pageInfo.currentBlock eq 1}">
				<img src="resources/img/prev.png">
			</c:when>
			<c:otherwise>
				<a
					href="housedetail?hNo=${hvo.hNo}&page=
									${(pageInfo.currentBlock-1)*pageInfo.pagesPerBlock}&id=webdevelopment">
					<img src="resources/img/prev.png">
				</a>
			</c:otherwise>
		</c:choose>

		<%--Page  ������ ���� --%>
		<c:choose>
			<c:when test="${pageInfo.currentBlock ne pageInfo.totalBlocks}">
				<c:forEach begin="1" end="${pageInfo.pagesPerBlock}" varStatus="num">
                        [<a
						href="housedetail?hNo=${hvo.hNo}&page=
                        ${(pageInfo.currentBlock - 1) * pageInfo.pagesPerBlock + num.count }&id=webdevelopment">
						${(pageInfo.currentBlock- 1) * pageInfo.pagesPerBlock + num.count }</a> ]
                    			</c:forEach>
			</c:when>
			<c:otherwise>
				<c:forEach
					begin="${(pageInfo.currentBlock-1)*pageInfo.pagesPerBlock + 1}"
					end="${pageInfo.totalPages}" varStatus="num">
                        [<a
						href="housedetail?hNo=${hvo.hNo}&page=
										${(pageInfo.currentBlock - 1) * pageInfo.pagesPerBlock + num.count }&id=webdevelopment">
						${(pageInfo.currentBlock - 1) * pageInfo.pagesPerBlock + num.count }</a> ]
                    </c:forEach>
			</c:otherwise>
		</c:choose>


		<%--Page ���� ������ ���� --%>
		<c:choose>
			<c:when test="${pageInfo.currentBlock eq pageInfo.totalBlocks}">
				<img src="resources/img/next.png">
			</c:when>
			<c:otherwise>
				<a
					href="housedetail?hNo=${hvo.hNo}&page=
									${pageInfo.currentBlock * pageInfo.pagesPerBlock + 1 }">
					<img src="resources/img/next.png">
				</a>
			</c:otherwise>
		</c:choose>
	</c:when>

	<c:otherwise>
		<c:choose>
			<c:when test="${pageInfo.currentBlock eq 1}">
				<img src="resources/img/prev.png">
			</c:when>
			<c:otherwise>
				<a
					href="housedetail?hNo=${hvo.hNo}&page=
									${(pageInfo.currentBlock-1)*pageInfo.pagesPerBlock }">
					<img src="resources/img/prev.png">
				</a>
			</c:otherwise>
		</c:choose>

		<%--Page  ������ ���� --%>
		<c:choose>
			<c:when test="${pageInfo.currentBlock ne pageInfo.totalBlocks}">
				<c:forEach begin="1" end="${pageInfo.pagesPerBlock}" varStatus="num">
                        [<a
						href="housedetail?hNo=${hvo.hNo}&page=
                        ${(pageInfo.currentBlock - 1) * pageInfo.pagesPerBlock + num.count }">
						${(pageInfo.currentBlock- 1) * pageInfo.pagesPerBlock + num.count }</a> ]
                    			</c:forEach>
			</c:when>
			<c:otherwise>
				<c:forEach
					begin="${(pageInfo.currentBlock-1)*pageInfo.pagesPerBlock + 1}"
					end="${pageInfo.totalPages}" varStatus="num">
                        [<a
						href="housedetail?hNo=${hvo.hNo}&page=
										${(pageInfo.currentBlock - 1) * pageInfo.pagesPerBlock + num.count }">
						${(pageInfo.currentBlock - 1) * pageInfo.pagesPerBlock + num.count }</a> ]
                    </c:forEach>
			</c:otherwise>
		</c:choose>


		<%--Page ���� ������ ���� --%>
		<c:choose>
			<c:when test="${pageInfo.currentBlock eq pageInfo.totalBlocks}">
				<img src="resources/img/next.png">
			</c:when>
			<c:otherwise>
				<a
					href="housedetail?hNo=${hvo.hNo}&page=
									${pageInfo.currentBlock * pageInfo.pagesPerBlock + 1 }">
					<img src="resources/img/next.png">
				</a>
			</c:otherwise>
		</c:choose>
	</c:otherwise>
</c:choose>
