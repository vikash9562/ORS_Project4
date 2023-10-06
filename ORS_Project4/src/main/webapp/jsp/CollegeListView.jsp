<%@page import="com.rays.pro4.Model.CollegeModel"%>
<%@page import="com.rays.pro4.Model.UserModel"%>
<%@page import="com.rays.pro4.Bean.CollegeBean"%>
<%@page import="com.rays.pro4.Util.HTMLUtility"%>
<%@page import="com.rays.pro4.Util.DataUtility"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="com.rays.pro4.Util.ServletUtility"%>
<%@page import="com.rays.pro4.controller.CollegeListCtl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<html>
<head>
<link rel="icon" type="image/png" href="<%=ORSView.APP_CONTEXT%>/img/logo.png" sizes="16*16"/>
<title> College List</title>

<script src="<%=ORSView.APP_CONTEXT %>/js/jquery.min.js""></script>
<script src="<%=ORSView.APP_CONTEXT %>/js/Checkbox11.js"></script>

</head>
<body>
<jsp:useBean id="bean" class="com.rays.pro4.Bean.CollegeBean" scope="request" ></jsp:useBean>
    <%@include file="Header.jsp"%>


  <form action="<%=ORSView.COLLEGE_LIST_CTL%>" method="POST">
    
    <center>
    
     <div align="center">
	        <h1>College List</h1>
            <h3><font color="red"><%=ServletUtility.getErrorMessage(request)%></font>
            <font color="green"><%=ServletUtility.getSuccessMessage(request)%></font></h3>
     </div>
     
     <% 
	             List clist=(List)request.getAttribute("CollegeList");
     
     int next=DataUtility.getInt(request.getAttribute("nextlist").toString());

	    		%>
	     
       <%
                    int pageNo = ServletUtility.getPageNo(request);
                    int pageSize = ServletUtility.getPageSize(request);
                    int index = ((pageNo - 1) * pageSize) + 1;

                    List list = ServletUtility.getList(request);
                    Iterator<CollegeBean> it = list.iterator();

	       			if(list.size() !=0){
                    %>
            
            <table width="80%" align="center">
                <tr>
                 <td align="center">
                 <label > College Name :</label> 
                
                 	<%-- <input type="text" name="name" placeholder="Enter College Name" Size= "25" value="<%=ServletUtility.getParameter("name", request)%>">
				 --%>
				 <%=HTMLUtility.getList("collegeid", String.valueOf(bean.getId()), clist) %>
                    
				 	&nbsp;
                 	<label>City :</label> 
    	             <input type="text" name="city" placeholder="Enter City Name" Size= "25" value="<%=ServletUtility.getParameter("city", request)%>">
                    &nbsp;    
                    
                    
                    
                  <%--   
                 	<label>phoneno :</label> 
    	             <input type="text" name="phoneno" placeholder="Enter phoneno" Size= "25" value="<%=ServletUtility.getParameter("phoneno", request)%>">
                     --%>
                    
                    
        	         <input type="submit" name="operation" value="<%=CollegeListCtl.OP_SEARCH%>">
        	         &nbsp;
        	         <input type="submit" name="operation" value="<%=CollegeListCtl.OP_RESET%>">
        	         
                 </td>
                </tr>
            </table>
            
            <br>
            
            <table border="1" width="100%" align="center" cellpadding=6px cellspacing=".2">
                 <tr style="background: skyblue">
                <th><input type="checkbox" id="select_all" name="select">Select All.</th>
                
                <th>S.No.</th>
                <th>Name.</th>
                <th>Address.</th>
                <th>State.</th>
                <th>City.</th>
                <th>PhoneNo.</th>
                <th>Edit</th>
                </tr>
                
                <%
                	while(it.hasNext())
                	{
                		 bean = it.next();
                %>
                
                
                
       <tr align="center">
           	<td><input type="checkbox" class="checkbox" name="ids" value="<%=bean.getId() %>">
                    <td><%=index++%></td>
                    <td><%=bean.getName()%></td>
                    <td><%=bean.getAddress()%></td>
                    <td><%=bean.getState()%></td>
                    <td><%=bean.getCity()%></td>
                    <td><%=bean.getPhoneNo()%></td>
                    <td><a href="CollegeCtl?id=<%=bean.getId()%>">Edit</a></td>
                </tr>
                <%
                    }
                %>
            </table>
            <table width="100%">
                <tr>
                <%if(pageNo == 1){ %>
                    <td><input type="submit" name="operation" disabled="disabled" value="<%=CollegeListCtl.OP_PREVIOUS%>">
       				<%}else{ %>
       				<td><input type="submit" name="operation"  value="<%=CollegeListCtl.OP_PREVIOUS%>"></td>
       				<%} %>		
                     
                     <td><input type="submit" name="operation" value="<%=CollegeListCtl.OP_DELETE%>"> </td>
                    <td> <input type="submit" name="operation" value="<%=CollegeListCtl.OP_NEW%>"></td>
                    
                 <%--  <% CollegeModel model = new CollegeModel();
                  %>  
                  <% if(list.size() < pageSize || model.nextPK()-1 == bean.getId()){ %>
                  <td align="right"> <input type="submit" name="operation" disabled="disabled" value="<%=CollegeListCtl.OP_NEXT%>"></td>
  					<%}else{ %>                   
  				  <td align="right"> <input type="submit" name="operation"  value="<%=CollegeListCtl.OP_NEXT%>"></td>
   					<%} %>  --%>                
                    
                    <td align="right"><input type="submit"  name="operation" value="<%=CollegeListCtl.OP_NEXT%>" <%=(list.size()<pageSize||next==0)?"disabled":"" %>> </td>
			
                    
                </tr>
            </table>
            		<%}if(list.size() == 0){ %>
            		<td align="center"><input type="submit" name="operation" value="<%=CollegeListCtl.OP_BACK%>"></td>	
            		<% } %>
            	
            <input type="hidden" name="pageNo" value="<%=pageNo%>"> 
            <input type="hidden" name="pageSize" value="<%=pageSize%>">
        </form>
                 </br>
                 </br>
                 </br>
                   </br>
                   </br>
                   </br>
    </center>

 <%@include file="Footer.jsp"%>
</body>
</html>