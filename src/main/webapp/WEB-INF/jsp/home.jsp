<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.example.home.Service.PersonService"%>
<%@ page import="com.example.home.Model.Person"%>
<%@ page import="com.example.home.Controller.Urls"%>

<! DOCTYPE html>

<html lang="en">
<head>
    <link rel="stylesheet" type="text/css" href="style.css">
    <title>HomeUILayer</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    <script src="https://apis.google.com/js/api.js"></script>
</head>
<body>
    <div class="container">
        <div class ="row">
            <div class="col-sm-6">
                <h1>Please add your first name, city and state : )</h1>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-6">
                <table class="table table-bordered table-condensed table-striped">
                    <thead>
                    <tr>
                        <th>First Name</th>
                        <th>Your City</th>
                        <th>Your State</th>s
                    </tr>
                    </thead>
<%--                    <tbody id="personTable">s--%>
<%--                        <c:forEach items="${Urls.GET_PEOPLE}" var="entry">--%>
<%--                            <tr class="entryRow">--%>
<%--                                <td><label>--%>
<%--                                    <input type="text" class="form-control" value="${entry.getFirstName()}">--%>
<%--                                </label></td>--%>
<%--                                <td><label>--%>
<%--                                    <input type="text" class="form-control" value="${entries.getCity()}">--%>
<%--                                </label></td>--%>
<%--                                <td><label>--%>
<%--                                    <input type="text" class="form-control" value="${entries.getState()}">--%>
<%--                                </label></td>--%>
<%--                            </tr>--%>
<%--                        </c:forEach>--%>
<%--                    </tbody>--%>
<%--                </table>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>

    <div class="modal fade" id="newPersonModal" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h4>Enter new person, city, state!</h4>
                </div>
                <div class="modal-body">
                    <form method="post" action="${Urls.ADD_NEW_PERSON}" id="personForm">
                        <div class="form-group">
                            <label for="personFirstName"> First Name: </label>
                            <input type="text" class="form-control" id="personFirstName" name="personFirstName" value="${firstName}">
                        </div>
                        <div class="form-group">
                            <label for="personCity"> City: </label>
                            <input type="text" class="form-control" id="personCity" name="personCity" value="${city}">
                        </div>
                        <div class="form-group">
                            <label for="personCity"> State: </label>
                            <input type="text" class="form-control" id="personState" name="personState" value="${state}">
                        </div>
                    </form>
                    <button id="addMore">Add</button>
                </div>
            </div>
        </div>
    </div>

<script>

    $("#newPersonModal").modal("show");


    $("#personForm").submit(function (event) {
        event.preventDefault();
        var post_url = $(this).attr("action");
        var unindexed_array = $(this).serializeArray();
        var indexed_array = {};

        $.map(unindexed_array, function(n, i){
            indexed_array[n['name']] = n['value'];
        });

        $.ajax({
            url: post_url, contentType: 'application/json', dataType: 'json', data: JSON.stringify(indexed_array),
            type: 'POST',
            success: function (data, textStatus, jqXHR) {
                window.location.assign("https://localhost:8081/persons/");
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                alert("received by ajax: " + JSON.stringify(errorThrown));
            }
        });

        $("#newPersonModal").modal("hide");
    })

</script>
</body>

</html>