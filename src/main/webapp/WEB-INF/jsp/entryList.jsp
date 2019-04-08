<%--
  Created by IntelliJ IDEA.
  User: 一叶知秋
  Date: 2019/3/20
  Time: 15:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
    .container {
        text-align:center;
        width:700px;
        height:250px;
        margin:0px auto; /*让div水平居中*/
    }
    table {wdith:100%;
        margin: 0px auto;}

</style>
<script src="${pageContext.request.contextPath}/statics/js/jquery-1.8.3.min.js"></script>
<script>
    function pageNav(currPageNo) {
        //将当前页码赋值给form表单的 currPageNo
        document.getElementById("myform").currPageNo.value = currPageNo;
        document.getElementById("myform").submit(); //将form表单进行提交
    }
    function submitForm() {
        document.getElementById("myform").submit(); //将form表单进行提交
    }
    $(function () {
        $("tr:odd").css("background-color", "yellow");
    });
        function del(id) {
            if (confirm("确认删除吗？")) {
                    $.ajax({
                        url : "${pageContext.request.contextPath}/entry/del?id="+id,
                        type : "GET",
                        success:(function(data) {
                            if(data > 0){
                                alert("删除成功！")
                                location.href = "${pageContext.request.contextPath}/entry/list";
                            }else{
                                alert("删除失败！")
                                location.href = "${pageContext.request.contextPath}/entry/list";
                            }
                        }),
                        error:(function (data) {
                            alert(data);
                        })
                    })
            }
        }
</script>
<html>
<head>
    <title>电子文档信息列表</title>
</head>
<body>
    <div class="container">
        <h2>电子文档信息列表</h2>
        <form id="myform" action="${pageContext.request.contextPath}/entry/list">
            <span>请选择文档分类</span>
            <select name="categoryId" onchange="submitForm()">
                <option value="0">全部</option>
                <c:forEach items="${categoryList}" var="list">
                    <c:choose>
                        <c:when test="${categoryId eq list.id}">
                            <option value="${list.id}" selected = "selected">${list.name}</option>
                        </c:when>
                        <c:otherwise>
                            <option value="${list.id}">${list.name}</option>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
            </select>
            <input type="hidden" name="currPageNo" value="1">
        </form>
        <a href="${pageContext.request.contextPath}/entry/doAdd">新增文档</a>
        <table border="1">
            <tr>
                <th>文档编号</th>
                <th>文档名称</th>
                <th>文档摘要</th>
                <th>上传人</th>
                <th>上传时间</th>
                <th>操作</th>
            </tr>
            <c:forEach items="${entryList}" var="list">
                <tr>
                    <td>${list.id}</td>
                    <td>${list.category.name}</td>
                    <td>${list.summary}</td>
                    <td>${list.uploaduser}</td>
                    <td><fmt:formatDate value="${list.createDate}" pattern="yyyy-MM-dd"/></td>
                    <td><a href="javascript:del(${list.id})">删除</a><a href="${pageContext.request.contextPath}/entry/toUpdate?id=${list.id}">修改</a> </td>
                </tr>
            </c:forEach>
        </table>
        <div class="pager">
                <a href="javascript:pageNav(1)">首页</a>
            <c:if test="${page.currentPageNo != 1}">
                <a href="javascript:pageNav(${page.currentPageNo - 1})">上一页</a>
            </c:if>
                <a href="javascript:pageNav(${page.currentPageNo + 1})">下一页</a>
                <a href="javascript:pageNav(${page.totalPageCount})">末页</a>
            <span>第${page.currentPageNo}页/共${page.totalPageCount}页</span>
        </div>
    </div>
</body>
</html>
