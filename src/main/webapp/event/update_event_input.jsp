<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.event.model.*"%>

<% //見com.event.controller.EventServlet.java第163行存入req的eventVO物件 (此為從資料庫取出的eventVO, 也可以是輸入格式有錯誤時的eventVO物件)
   EventVO eventVO = (EventVO) request.getAttribute("eventVO");
%>

<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>活動資料修改 - update_event_input.jsp</title>

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
	width: 450px;
	background-color: white;
	margin-top: 1px;
	margin-bottom: 1px;
  }
  table, th, td {
    border: 0px solid #CCCCFF;
  }
  th, td {
    padding: 1px;
  }
</style>

</head>
<body bgcolor='white'>

<table id="table-1">
	<tr><td>
		 <h3>活動資料修改 - update_event_input.jsp</h3>
		 <h4><a href="select_page.jsp"><img src="images/back1.gif" width="100" height="32" border="0">回首頁</a></h4>
	</td></tr>
</table>

<h3>資料修改:</h3>

<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<FORM METHOD="post" ACTION="event.do" name="form1" enctype="multipart/form-data">
<table>
	<tr>
		<td>活動流水號:<font color=red><b>*</b></font></td>
		<td><%=eventVO.getEventId()%></td>
	</tr>
	<tr>
		<td>活動名稱:</td>
		<td><input type="TEXT" name="eventName" value="<%=eventVO.getEventName()%>" size="45"/></td>
	</tr>
	<tr>
		<td>活動開始日期:</td>
		<td><input type="TEXT" name="startDt" id="f_date1" ></td>
	</tr>
	<tr>
		<td>活動結束日期:</td>
		<td><input type="TEXT" name="endDt" id="f_date2" ></td>
	</tr>
	<tr>
		<td>活動折數:</td>
		<td><input type="TEXT" name="eventDiscount"   value="<%=eventVO.getEventDiscount()%>" size="45"/></td>
	</tr>
	<tr>
		<td>活動圖片:</td>
		<td>
			<img src="<%=request.getContextPath()%>/event/DBGifReader?eventId=${eventVO.eventId}">
			<input type="file" name="eventPic" multiple="multiple">
		</td>
	</tr>
	<tr>
		<td>活動狀態:</td>
		<td><input type="TEXT" name="status"  value="<%=eventVO.getStatus()%>" size="45"/></td>
	</tr>
	<tr>
		<td>活動文案內容:</td>
		<td><input type="TEXT" name="eventContent"  value="<%=eventVO.getEventContent()%>" size="45"/></td>
	</tr>
	<tr>
		<td>建檔者:</td>
		<td><input type="TEXT" name="createdBy"  value="<%=eventVO.getCreatedBy()%>" size="45" readonly/></td>
	</tr>
	<tr>
		<td>建檔時間:</td>
		<td><input type="TEXT" name="dateCreated"  value="<%=eventVO.getDateCreated()%>" size="45" readonly/></td>
	</tr>
	<tr>
		<td>最後更新者:</td>
		<td><input type="TEXT" name="lastUpdatedBy"  value="<%=eventVO.getLastUpdatedBy()%>" size="45"/></td>
	</tr>
	<tr>
		<td>最後更新時間:</td>
		<td><input type="TEXT" name="lastUpdated"  value="<%=eventVO.getLastUpdated()%>" size="45" readonly/></td>
	</tr>

<%-- 	<jsp:useBean id="deptSvc" scope="page" class="com.dept.model.DeptService" /> --%>
<!-- 	<tr> -->
<!-- 		<td>部門:<font color=red><b>*</b></font></td> -->
<!-- 		<td><select size="1" name="deptno"> -->
<%-- 			<c:forEach var="deptVO" items="${deptSvc.all}"> --%>
<%-- 				<option value="${deptVO.deptno}" ${(eventVO.deptno==deptVO.deptno)?'selected':'' } >${deptVO.dname} --%>
<%-- 			</c:forEach> --%>
<!-- 		</select></td> -->
<!-- 	</tr> -->

</table>
<br>
<input type="hidden" name="action" value="update">
<input type="hidden" name="eventId" value="<%=eventVO.getEventId()%>">
<input type="submit" value="送出修改"></FORM>
</body>



<!-- =========================================以下為 datetimepicker 之相關設定========================================== -->

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.css" />
<script src="<%=request.getContextPath()%>/datetimepicker/jquery.js"></script>
<script src="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.full.js"></script>

<style>
  .xdsoft_datetimepicker .xdsoft_datepicker {
           width:  300px;   /* width:  300px; */
  }
  .xdsoft_datetimepicker .xdsoft_timepicker .xdsoft_time_box {
           height: 151px;   /* height:  151px; */
  }
</style>

<script>
		$.datetimepicker.setLocale('zh');
		$('#f_date1').datetimepicker({
		   theme: '',              //theme: 'dark',
		   timepicker:false,       //timepicker:true,
		   step: 1,                //step: 60 (這是timepicker的預設間隔60分鐘)
		   format:'Y-m-d',         //format:'Y-m-d H:i:s',
		   value: '<%=eventVO.getStartDt()%>', // value:   new Date(),
		   //disabledDates:        ['2017/06/08','2017/06/09','2017/06/10'], // 去除特定不含
		   //startDate:	            '2017/07/10',  // 起始日
		   //minDate:               '-1970-01-01', // 去除今日(不含)之前
		   //maxDate:               '+1970-01-01'  // 去除今日(不含)之後
		});
		
		$('#f_date2').datetimepicker({
		    theme: '',              //theme: 'dark',
		    timepicker:false,       //timepicker:true,
		    step: 1,                //step: 60 (這是timepicker的預設間隔60分鐘)
		    format:'Y-m-d',         //format:'Y-m-d H:i:s',
			   value: '<%=eventVO.getEndDt()%>', // value:   new Date(),
		    //disabledDates:        ['2017/06/08','2017/06/09','2017/06/10'], // 去除特定不含
		    //startDate:	            '2017/07/10',  // 起始日
		    //minDate:               '-1970-01-01', // 去除今日(不含)之前
		    //maxDate:               '+1970-01-01'  // 去除今日(不含)之後
		 });
        
        
   
        // ----------------------------------------------------------以下用來排定無法選擇的日期-----------------------------------------------------------

        //      1.以下為某一天之前的日期無法選擇
        //      var somedate1 = new Date('2017-06-15');
        //      $('#f_date1').datetimepicker({
        //          beforeShowDay: function(date) {
        //        	  if (  date.getYear() <  somedate1.getYear() || 
        //		           (date.getYear() == somedate1.getYear() && date.getMonth() <  somedate1.getMonth()) || 
        //		           (date.getYear() == somedate1.getYear() && date.getMonth() == somedate1.getMonth() && date.getDate() < somedate1.getDate())
        //              ) {
        //                   return [false, ""]
        //              }
        //              return [true, ""];
        //      }});

        
        //      2.以下為某一天之後的日期無法選擇
        //      var somedate2 = new Date('2017-06-15');
        //      $('#f_date1').datetimepicker({
        //          beforeShowDay: function(date) {
        //        	  if (  date.getYear() >  somedate2.getYear() || 
        //		           (date.getYear() == somedate2.getYear() && date.getMonth() >  somedate2.getMonth()) || 
        //		           (date.getYear() == somedate2.getYear() && date.getMonth() == somedate2.getMonth() && date.getDate() > somedate2.getDate())
        //              ) {
        //                   return [false, ""]
        //              }
        //              return [true, ""];
        //      }});


        //      3.以下為兩個日期之外的日期無法選擇 (也可按需要換成其他日期)
        //      var somedate1 = new Date('2017-06-15');
        //      var somedate2 = new Date('2017-06-25');
        //      $('#f_date1').datetimepicker({
        //          beforeShowDay: function(date) {
        //        	  if (  date.getYear() <  somedate1.getYear() || 
        //		           (date.getYear() == somedate1.getYear() && date.getMonth() <  somedate1.getMonth()) || 
        //		           (date.getYear() == somedate1.getYear() && date.getMonth() == somedate1.getMonth() && date.getDate() < somedate1.getDate())
        //		             ||
        //		            date.getYear() >  somedate2.getYear() || 
        //		           (date.getYear() == somedate2.getYear() && date.getMonth() >  somedate2.getMonth()) || 
        //		           (date.getYear() == somedate2.getYear() && date.getMonth() == somedate2.getMonth() && date.getDate() > somedate2.getDate())
        //              ) {
        //                   return [false, ""]
        //              }
        //              return [true, ""];
        //      }});
        
</script>
</html>