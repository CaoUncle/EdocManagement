<%--
  Created by IntelliJ IDEA.
  User: 一叶知秋
  Date: 2019/3/21
  Time: 16:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <form action="${pageContext.request.contextPath}/entry/updateEntry" method="post">
        标题：<input name="title" type="text" value="${entry.title}"><br>
        文档分类：<select name="category.id">
        <c:forEach items="${categoryList}" var="list">
            <c:choose>
                <c:when test="${list.id eq entry.category.id}">
                    <option value="${list.id}" selected = "selected">${list.name}</option>
                </c:when>
                <c:otherwise>
                    <option value="${list.id}">${list.name}</option>
                </c:otherwise>
            </c:choose>
        </c:forEach>
    </select><br>
        摘要：<input name="summary" type="text" value="${entry.summary}"><br>
        作者：<input name="uploaduser" type="text" value="${entry.uploaduser}"><br>
        <input type="submit" value="提交">
        <input type="reset" value="重置">
    </form>
</body>
</html>
