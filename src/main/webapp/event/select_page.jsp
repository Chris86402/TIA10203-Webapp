<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<title>IBM Event: Home</title>

<style>
  table#table-1 {
	width: 450px;
	background-color: #CCCCFF;
	margin-top: 5px;
	margin-bottom: 10px;
    border: 3px ridge Gray;
    height: 80px;
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

</head>
<body bgcolor='white'>

<table id="table-1">
   <tr><td><h3>IBM Event: Home</h3><h4>( MVC )</h4></td></tr>
</table>

<p>This is the Home page for IBM Event: Home</p>

<h3>��Ƭd��:</h3>
	
<%-- ���~��C --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">�Эץ��H�U���~:</font>
	<ul>
	    <c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<ul>
  <li><a href='listAllEvent.jsp'>List</a> all Events.  <br><br></li>
  
  
  <li>
    <FORM METHOD="post" ACTION="event.do" >
        <b>��J���ʬy���� (�p60001):</b>
        <input type="text" name="eventId">
        <input type="hidden" name="action" value="getOne_For_Display">
        <input type="submit" value="�e�X">
    </FORM>
  </li>

  <jsp:useBean id="eventSvc" scope="page" class="com.event.model.EventService" />
   
  <li>
     <FORM METHOD="post" ACTION="event.do" >
       <b>��ܬ��ʬy����:</b>
       <select size="1" name="eventId">
         <c:forEach var="eventVO" items="${eventSvc.all}" > 
          <option value="${eventVO.eventId}">${eventVO.eventId}
         </c:forEach>   
       </select>
       <input type="hidden" name="action" value="getOne_For_Display">
       <input type="submit" value="�e�X">
    </FORM>
  </li>
  
  <li>
     <FORM METHOD="post" ACTION="event.do" >
       <b>��ܬ��ʦW��:</b>
       <select size="1" name="eventId">
         <c:forEach var="eventVO" items="${eventSvc.all}" > 
          <option value="${eventVO.eventId}">${eventVO.eventName}
         </c:forEach>   
       </select>
       <input type="hidden" name="action" value="getOne_For_Display">
       <input type="submit" value="�e�X">
     </FORM>
  </li>
</ul>


<h3>���ʺ޲z</h3>

<ul>
  <li><a href='addEvent.jsp'>Add</a> a new Event.</li>
</ul>

</body>
</html>