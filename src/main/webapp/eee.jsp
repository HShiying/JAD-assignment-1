<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
/* ==========================================================
Author: Huang Shiying
Date: 26/10/2025
Description: ST0510 JAD pract 1 submission
=============================================================*/
function greet(){
	// Declare a variable to store the student's ID
	let studId;
	// Keep asking for Student ID until a valid 6-digit number is entered
	do{
		studId = prompt('Enter your Student ID:');
	}while(isNaN(studId)|| studId.length!=6);
	
	// Ask the user for their name
	let name = prompt('Enter your name: ');
	
	// Create a new Date object to get the current time
	let now = new Date();
	
	// Get the current hour
	let hours = now.getHours();
	
	// Variable to hold the appropriate greeting
	let greeting;
	
	// Decide which greeting to use based on the time of day
	if(hours<12){
		greeting="Good Morning!.. "
	}else if(hours<18){
		greeting="Good Afternoon!.. "
	}else{
		greeting="Good Night!.. "
	}
	
	// Display the final message with name and Student ID
	alert(greeting + name + " P(" + studId + ")");
}
</script>
</head>
<body onload = "greet()">
<%
out.print("Hello world!...");
%>
</body>
</html>