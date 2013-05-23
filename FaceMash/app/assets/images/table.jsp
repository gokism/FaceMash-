<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<table class="table table-striped table-bordered" style="width:650px" >  
        <thead>  
          <tr>  
            <th>Date</th>  
            <th>Story Title</th>  
            <th>Decision</th>  
            <th>More</th>
          </tr>  
        </thead>  
        <tbody>
        <c:forEach var="story" items="${stories}" >
        <tr>
        <td><c:out value="${story.TIMESTAMP}"/></td>
        <td><c:out value="${story.STORY_TITLE}"/></td>
        <td><c:out value="${story.DECISION}"/></td>
        <td><a href="http://www.moneycontrol.com${story.STORY_URL}">&#926;</a></td>
        </tr>
        </c:forEach>  
        </tbody>  
      </table>
      
