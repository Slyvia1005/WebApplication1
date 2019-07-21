

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
            <title>JSP Page</title>
        </head>
        <body>          
            
<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
     url="jdbc:mysql://localhost:3306/weiyidata?zeroDateTimeBehavior=convertToNull"
     user="root"  password="wu1005shuang"/>

<c:set var="SiteId" value="3"/>
 
<sql:update dataSource="${snapshot}" var="count">
  UPDATE weiyi_tb1 SET param_name = '摩卡' WHERE Id = ?
  <sql:param value="${SiteId}" />
</sql:update>

    
<sql:query dataSource="${snapshot}" var="result">
SELECT * from weiyi_tb1;
</sql:query>
<h1> CoffeeShop</h1>
<table border="1" width="100%">
<tr>
   <th>ID</th>
   <th>种类</th>
   <th>价格</th>
   <th>说明</th>
</tr>
<c:forEach var="row" items="${result.rows}">
<tr>
   <td><c:out value="${row.id}"/></td>
   <td><c:out value="${row.param_name}"/></td>
   <td><c:out value="${row.param_value}"/></td>
   <td><c:out value="${row.remark}"/></td>
</tr>
</c:forEach>
</table>
            
        </body>
    </html>


