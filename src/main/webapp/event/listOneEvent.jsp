<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ page import="com.event.model.*"%>
<%-- 此頁暫練習採用 Script 的寫法取值 --%>

<%
  EventVO eventVO = (EventVO) request.getAttribute("eventVO"); //EventServlet.java(Concroller), 存入req的eventVO物件
%>

<html>
<head>
<title>活動資料 - listOneEvent.jsp</title>

<style>
  table#table-1 {
	background-color: #CCCCFF;
    border: 2px solid black;
    text-align: center;
  }
  table#table-1 h4 {
    color: red;
    display: block;
    margin-bottom: 1px;
  }
  h4 {
    color: blue;
    display: inline;
  }
</style>

<style>
  table {
	width: 600px;
	background-color: white;
	margin-top: 5px;
	margin-bottom: 5px;
  }
  table, th, td {
    border: 1px solid #CCCCFF;
  }
  th, td {
    padding: 5px;
    text-align: center;
  }
</style>

</head>
<body bgcolor='white'>

<h4>此頁暫練習採用 Script 的寫法取值:</h4>
<table id="table-1">
	<tr><td>
		 <h3>活動資料 - listOneEvent.jsp</h3>
		 <h4><a href="select_page.jsp"><img src="images/back1.gif" width="100" height="32" border="0">回首頁</a></h4>
	</td></tr>
</table>

<table>
	<tr>
		<th>活動流水號</th>
		<th>活動名稱</th>
		<th>活動開始日期</th>
		<th>活動結束日期</th>
		<th>活動折數</th>
		<th>活動圖片</th>
		<th>活動狀態</th>
		<th>活動文案內容</th>
		<th>建檔者</th>
		<th>建檔時間</th>
		<th>最後更新者</th>
		<th>最後更新時間</th>
	</tr>
	<tr>
		<td><%=eventVO.getEventId()%></td>
		<td><%=eventVO.getEventName()%></td>
		<td><%=eventVO.getStartDt()%></td>
		<td><%=eventVO.getEndDt()%></td>
		<td><%=eventVO.getEventDiscount()%></td>
		<td><img src="<%=request.getContextPath()%>/event/DBGifReader?eventId=${eventVO.eventId}" width="100px"></td>
		<td><%=eventVO.getStatus()%></td>
		<td><%=eventVO.getEventContent()%></td>
		<td><%=eventVO.getCreatedBy()%></td>
		<td><%=eventVO.getDateCreated()%></td>
		<td><%=eventVO.getLastUpdatedBy()%></td>
		<td><%=eventVO.getLastUpdated()%></td>
	</tr>
</table>

</body>
</html>