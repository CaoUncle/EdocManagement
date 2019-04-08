<%--
  Created by IntelliJ IDEA.
  User: 一叶知秋
  Date: 2019/3/21
  Time: 14:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
    <style>
    .container {
        text-align:center;
        width:700px;
        height:250px;
        margin:0px auto; /*让div水平居中*/
        border: 1px solid black;
    }
    form {wdith:100%;
        margin: 0px auto;}

</style>
<script src="${pageContext.request.contextPath}/statics/js/jquery-1.8.3.min.js"></script>
<script>

</script>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <div class="container">
        <form action="${pageContext.request.contextPath}/entry/addEntry" method="POST">
            标题：<input name="title" type="text"><br>
            文档分类：<select name="category.id">
                <c:forEach items="${categoryList}" var="list">
                    <option value="${list.id}">${list.name}</option>
                </c:forEach>
            </select><br>
            摘要：<input name="summary" type="text"><br>
            作者：<input name="uploaduser" type="text"><br>
            <input type="submit" value="提交">
            <input type="reset" value="重置">
        </form>
    </div>
</body>
</html>
