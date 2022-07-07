$("#addMore").click(function(e){
    e.preventDefault();
    var addedPersonFirstName = $("#newPersonFirstName").val();
    var addedPersonCity = $("#newPersonCity").val();
    var addedPersonState = $("#newPersonState").val();

    $("#newRow").before(`<tr class="newPersonsRow">
                                  <td><input type="text" class="form-control" value="${addedPersonFirstName}"></td>
                                  <td><input type="text" class="form-control" value="${addedPersonCity}"></td>
                                  <td><input type="text" class="form-control" value="${addedPersonState}"></td>
                                            </tr>`);

    $("#newPersonFirstName").val("");
    $("#newPersonCity").val("");
    $("#newPersonState").val("");

});

$.ajax({
    url:post_url, contentType: 'application/json', dataType: 'json', data: JSON.stringify(persons),
    type:'POST',
    success: function(data, textStatus, jqXHR) {
        window.location.assign("https://localhost:8081");
    },
    error: function (XMLHttpRequest, textStatus, errorThrown){
        alert("received by ajax: " + JSON.stringify(errorThrown));
    }
});


