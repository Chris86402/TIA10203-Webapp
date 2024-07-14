<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.event.model.*"%>
<%-- �����m�߱ĥ� EL ���g�k���� --%>

<%
    EventService eventSvc = new EventService();
    List<EventVO> list = eventSvc.getAll();
    pageContext.setAttribute("list", list);
%>


<html>
<head>
<title>�Ҧ����ʸ�� - listAllEvent.jsp</title>

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
	width: 800px;
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

<h4>�����m�߱ĥ� EL ���g�k����:</h4>
<table id="table-1">
	<tr><td>
		 <h3>�Ҧ����ʸ�� - listAllEvent.jsp</h3>
		 <h4><a href="select_page.jsp"><img src="images/back1.gif" width="100" height="32" border="0">�^����</a></h4>
	</td></tr>
</table>

<table>
	<tr>
		<th>���ʬy����</th>
		<th>���ʦW��</th>
		<th>���ʶ}�l���</th>
		<th>���ʵ������</th>
		<th>���ʧ��</th>
		<th>���ʹϤ�</th>
		<th>���ʪ��A</th>
		<th>���ʤ�פ��e</th>
		<th>���ɪ�</th>
		<th>���ɮɶ�</th>
		<th>�̫��s��</th>
		<th>�̫��s�ɶ�</th>
		<th>�ק�</th>
		<th>�R��</th>
	</tr>
	<%@ include file="page1.file" %> 
	<c:forEach var="eventVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
		
		<tr>
			<td>${eventVO.eventId}</td>
			<td>${eventVO.eventName}</td>
			<td>${eventVO.startDt}</td>
			<td>${eventVO.endDt}</td>
			<td>${eventVO.eventDiscount}</td>
			<td><img src="<%=request.getContextPath()%>/event/DBGifReader?eventId=${eventVO.eventId}" width="100px"></td>
			<td>${eventVO.status}</td> 
			<td>${eventVO.eventContent}</td>
			<td>${eventVO.createdBy}</td>
			<td>${eventVO.dateCreated}</td>
			<td>${eventVO.lastUpdatedBy}</td>
			<td>${eventVO.lastUpdated}</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/event/event.do" style="margin-bottom: 0px;">
			     <input type="submit" value="�ק�">
			     <input type="hidden" name="eventId"  value="${eventVO.eventId}">
			     <input type="hidden" name="action"	value="getOne_For_Update"></FORM>
			</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/event/event.do" style="margin-bottom: 0px;">
			     <input type="submit" value="�R��">
			     <input type="hidden" name="eventId"  value="${eventVO.eventId}">
			     <input type="hidden" name="action" value="delete"></FORM>
			</td>
		</tr>
	</c:forEach>
</table>
<%@ include file="page2.file" %>

</body>
</html>