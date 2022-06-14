function buscar(){


		var cedula = document.getElementById('cedulaUsuario');
		
		
		
		$.ajax({
            type: 'POST',
            url: '/query/getPaciente.sql',
            data: '"cedula":"' + cedula + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: 'JSON',
            success: function (response) {

                console.log(response.d);

            },

            error: function (xhr, textStatus, err) {

                console.log("readyState: " + xhr.readyState);
                console.log("responseText: " + xhr.responseText);
                console.log("status: " + xhr.status);
                console.log("text status: " + textStatus);
                console.log("error: " + err);
            }
        });
		
}