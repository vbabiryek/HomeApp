<jsp:useBean id="PersonController" scope="request" type=""/>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.example.home.Controller" %>

<! DOCTYPE html>

<html lang="en">
<head>
    <link rel="stylesheet" type="text/css" href="../../../resources/static/style.css">
    <title>HomeUILayer</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    <script src="https://apis.google.com/js/api.js"></script>
</head>
<body>
    <div class="content">
        <div class="header">
            <h1>Please enter your first name, city, and state to check in.</h1>
        </div>
        <form action="/persons" method="post">
            <div class=""form-group>
                <hr>
                <table class = "table">

                </table>
            </div>
        </form>
    </div>
</body>

</html>