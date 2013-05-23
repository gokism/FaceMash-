<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Analyst Sentiments</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 
  <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
  <script src="static/bootstrap-typeahead.js"></script>
  <script src="static/bootstrap-modal.js"></script>
  <link href="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.0/css/bootstrap-combined.min.css" rel="stylesheet">
  <link rel="shortcut icon" href="static/favicon.ico">
  <script type="text/javascript" src="https://www.google.com/jsapi"></script>
    <script type="text/javascript">
      google.load("visualization", "1", {packages:["corechart"]});
      google.setOnLoadCallback(drawChart);
      function drawChart(buy,sell,neutral) {
        var data = google.visualization.arrayToDataTable([
          ['Stock Info', 'Decision'],
          ['Buy',     buy],
          ['Sell',      sell],
          ['Hold',  neutral]
                  ]);

        var options = {
          title: 'Stock Advices Trend',
          is3D:true,
          chartArea:{left:50,top:20,width:"100%",height:"100%"},
          colors:['#009933','#FF5050','#FFCC66']
          };

        var chart = new google.visualization.PieChart(document.getElementById('chart_div'));
        chart.draw(data, options);
      }
    </script>
  
  
  <script>
  $(document).ready(function() {
	
	
	 $("#search").typeahead({
	        minLength: 1,
	           source: function(query,process) {
	            $.get('http://localhost:8080/stockAnalyst/stockNameAutocomplete', { stock_name: query, limit: 20 }, function(data) {
	            	process(data);
	            	
	            	
	            });
	        },
	        updater: function (item) {
	        	$.get('http://localhost:8080/stockAnalyst/storiesAutocomplete', { stock_name: item, limit: 8 }, function(data) {
					$("#company_name").html("");
					$("#company_name").text(item);
	        		$("#stories_table").html("");
	            	$("#stories_table").html(data);
	            
	            	$("#company_all_info").css("visibility","visible");
	            	
	            });
	        	
	        	$.get('http://localhost:8080/stockAnalyst/getChart?stock_name='+item,  function(data) {
	            	drawChart(data[0],data[1],data[2]);
	            	
	            	if(data[2]>=data[0] && data[2]>=data[1])
	            		color="#FFD79C";
	            	if(data[1]>=data[0] && data[1]>=data[2])
	            		color="#FF7E7E";
	            	if(data[0]>data[1] && data[0]>data[2])
	            		color="#CCFFCC";
	            	$('body').css("background-color",color);
	            	
	            });
	        	
	        	
	        	return item;
	            }
	    });
	

	 
	}); </script>
	 

	
</head>
<body class="container" style="background-color: #CCFFCC;">
  <div class='navbar navbar-inverse'>
      <div class='navbar-inner nav-collapse' style="height: auto;">
        <ul class="nav">
          <li class="active"><a href="#">Company Advice</a></li>
          <li><a href="#">Stockers</a></li>
          <li><a href="#">Contact Us</a></li>
        </ul>
      </div>
    </div>
    
<div class="well" style="min-height:75px; max-height:75px">
<div style="position:relative;float:right;">
<label>Enter Stock's Name</label>
<input class="span3" type="text" id="search" data-provide="typeahed"></input>
</div>
<h3 id="company_name" style="width:500px;">

</h3>
</div>

<div id="company_all_info" style="visibility:hidden;">

<div id="tags" class="well" style="height:475px">
<ul class="nav nav-pills">
  <li class="active">
    <a href="#">Now</a>
  </li>
  <li><a href="http://localhost:8080/stockAnalyst/home">3 months ago</a></li>
  <li><a href="#">6 months ago</a></li>
  <li><a href="#custom_date_select"  data-toggle="modal">Custom time range</a></li>
</ul>



<h4>Company Stocks Info</h4>

<div id="chart_div" class="well" style="float:right;width:400px; height: 350px;"></div>
<div id="stories_table"  style="overflow:auto;height:400px;">
      </div>


</div> 

<div id="custom_date_select" class="modal hide fade">
  <div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
    <h4>Select the Time Range</h4>
  </div>
  <div class="modal-body">
    <p>One fine body</p>
  </div>
  <div class="modal-footer">
    <a href="#" class="btn" data-dismiss="modal">Close</a>
    <a href="#" class="btn btn-primary">Save changes</a>
  </div>
</div>
</div>

</body>
</html>