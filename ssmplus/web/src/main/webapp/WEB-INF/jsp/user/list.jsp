<%--
  Created by IntelliJ IDEA.
  User: a
  Date: 2022/3/11
  Time: 17:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isELIgnored="false" %>
<html>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<head>
    <title><fmt:message key="list"></fmt:message></title>
    <script type="text/javascript">
        $(function () {
            $(".delete").click(function () {
                var href = $(this).attr("href");
                $("#del").attr("action", href).submit();
                return false;
            });

            $("#lang").change(function () {
                var lang = $("#lang").val();
                window.location.href = "i18n?locale=" + lang;
            });
        });

        // function downloadfile(filePath) {
        //     var path = encodeURIComponent(filePath);
        //     window.location.href = "/springmvc/downloadfile?path=" + path;
        // }
    </script>
</head>
<body>

<%-- 国际化 --%>
<select onchange="i18n()" id="lang">
    <option value="zh_CN" <c:if test="${lang == 'zh_CN'}">selected="selected"</c:if>>
        <fmt:message key="chinese"></fmt:message>
    </option>
    <option value="en_US" <c:if test="${lang == 'en_US'}">selected="selected"</c:if>>
        <fmt:message key="english"></fmt:message>
    </option>
</select>

<%-- delete 请求 --%>
<form action="" method="POST" id="del">
    <input type="hidden" name="_method" value="DELETE"/>
</form>

<%-- 文件上传 --%>
<form action="${pageContext.request.contextPath}/user/uploadfile" method="POST" enctype="multipart/form-data">
    <input type="file" name="files"/>
    <input type="file" name="files"/>
    <input type="submit" value="<fmt:message key="upload"></fmt:message>"/>
</form>

<c:if test="${!empty requestScope.list }">
    <table border="1" cellpadding="10" cellspacing="0">
        <tr>
            <th><fmt:message key="id"></fmt:message></th>
            <th><fmt:message key="head"></fmt:message></th>
            <th><fmt:message key="name"></fmt:message></th>
            <th><fmt:message key="sex"></fmt:message></th>
            <th><fmt:message key="age"></fmt:message></th>
            <th><fmt:message key="email"></fmt:message></th>
            <th><fmt:message key="birtdate"></fmt:message></th>
            <th><fmt:message key="edit"></fmt:message></th>
        </tr>
        <c:forEach items="${requestScope.list }" var="l">
            <tr>
                <th>${l.id}</th>
                <th><img src='${pageContext.request.contextPath}/user/picturePreview/${l.id}' style="width: 200px"/></th>
                <th>${l.userName}</th>
                <th>${l.sex}</th>
                <th>${l.age}</th>
                <th>${l.email}</th>
                <th>${l.birthdate}</th>
                <th>
                    <a class="delete" href="${pageContext.request.contextPath}/user/users/${l.id}"><fmt:message key="delete"></fmt:message></a>
                    <a href="${pageContext.request.contextPath}/user/users/${l.id}"><fmt:message key="update"></fmt:message></a>
                    <a href="${pageContext.request.contextPath}/user/downloadfile/${l.id}"><fmt:message key="DownloadAvatar"></fmt:message></a>
                </th>
            </tr>
        </c:forEach>
    </table>
</c:if>

<br/>
<br/>
<a href="${pageContext.request.contextPath}/user/users"><fmt:message key="add"></fmt:message></a>

</body>
</html>
