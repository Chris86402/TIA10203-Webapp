<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ page import="com.event.model.*"%>
<%-- �����Ƚm�߱ĥ� Script ���g�k���� --%>

<%
  EventVO eventVO = (EventVO) request.getAttribute("eventVO"); //EventServlet.java(Concroller), �s�Jreq��eventVO����
%>

<html>
<head>
<title>���ʸ�� - listOneEvent.jsp</title>

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

<h4>�����Ƚm�߱ĥ� Script ���g�k����:</h4>
<table id="table-1">
	<tr><td>
		 <h3>���ʸ�� - listOneEvent.jsp</h3>
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