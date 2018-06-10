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
                    <i class="fas fa-user-plus"></i> [Insertar] Estudiantes
                    <i class="fas fa-user-plus"></i>, proceda a introducir los Datos solicitados.
                </h5>
            </div>

            <form action="/estudiantes/insertar" method="post" class="p-2">
                <div class="form-group">
                    <label for="matricula">Matricula: </label>
                    <input type="text" class="form-control rounded-0" name="matricula" placeholder="matricula">
                </div>
                <div class="row">
                    <div class="col-6">
                        <div class="form-group">
                            <label for="nombre">Nombre: </label>
                            <input type="text" class="form-control rounded-0" name="nombre" placeholder="nombre">
                        </div>
                    </div>
                    <div class="col-6">
                        <div class="form-group">
                            <label for="apellido">Apellido:</label>
                            <input type="text" class="form-control rounded-0" name="apellido" placeholder="apellido">
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label for="telefono">Telefono:</label>
                    <input type="text" class="form-control rounded-0" name="telefono" placeholder="telefono">
                </div>
                <button type="submit" class="btn btn-outline-secondary rounded-0 float-right">
                    <i class="fas fa-plus"></i> Insertar
                </button>
            </form>
        </div>
    </div>

</@form.page>