<#import "/plantillas/form.ftl" as base>
<@form.page>
<html lang="en" xmlns:layout="http://www.ultraq.net.nz/thymeleaf/layout">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">

</head>
<div class="col-lg-6 col-md-8 col-sm-10 mb-3 mx-auto">
    <div class="card bg-light rounded-0">
        <div class="card-body">
            <h5 class="card-title m-0">
                <i class="fas fa-user"></i> Estudiante: ${student.nombre} ${student.apellido}
            </h5>
        </div>

        <ul class="list-group list-group-flush">
            <li class="list-group-item"><b>Matricula: </b> ${student.matricula?string["0"]}</li>
            <li class="list-group-item"><b>Nombre: </b> ${student.nombre}</li>
            <li class="list-group-item"><b>Apellido: </b> ${student.apellido}</li>
            <li class="list-group-item"><b>Telefono: </b> ${student.telefono}</li>
        </ul>
    </div>
</div>

</@form.page>