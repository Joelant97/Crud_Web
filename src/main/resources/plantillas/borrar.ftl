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
                <i class="fas fa-user"></i> Borrado de Estudiante
            </h5>
        </div>

        <form action="/estudiante/borrar/${student.matricula?string["0"]}" method="post" class="p-2">
            <h6>¿Esta seguro de borrar al estudiante ${student.nombre} ${student.apellido} (${student.matricula?string["0"]})?</h6>
            <button type="submit" class="btn btn-outline-secondary rounded-0 float-right">
                <i class="fas fa-trash-alt"></i> Borrar Estudiente
            </button>
        </form>
    </div>
</div>

</@form.page>