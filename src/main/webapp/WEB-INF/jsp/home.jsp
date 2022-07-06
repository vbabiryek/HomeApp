<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.example.home.Service.PersonService" %>
<%@ page import="com.example.home.Model.Person" %>

<! DOCTYPE html>

<html lang="en">
<head>
    <link rel="stylesheet" type="text/css" href="../../../resources/static/css/style.css">
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
        <form action="/persons" method="POST" id="personsForm">
            <div class="form-group">
                <hr>
                <table class = "table">
                    <thead>
                    <tr>
                        <th>First Name</th>
                        <th>City</th>
                        <th>State</th>
                    </tr>
                    </thead>
                    <tbody>
                    <!--We need this to read our values from the service class -->

                            <tr class="newPersonsRow" >
                                <td><input type="text" class="form-control" id="firstName" name="persons.getFirstName()"></td>
                                <td><input type="text" class="form-control" id="City" name="persons.getCity()"></td>
                                <td><input type="text" class="form-control" id="State" name="persons.getState()"></td>
                            </tr>

                            <tr id="newRow">
                                <td><input type="text" class="form-control" id="newPersonFirstName" name="persons.getFirstName()"></td>
                                <td><input type="text" class="form-control" id="newPersonCity" name="persons.getCity()"></td>
                                <td><input type="text" class="form-control" id="newPersonState" name="persons.getState()"></td>
                            </tr>
                    </tbody>
                </table>
                <button id="addMore">Add More!</button>
            </div>
        </form>
    </div>
<script src="/javascript/javascript.js">

</script>
</body>

</html>