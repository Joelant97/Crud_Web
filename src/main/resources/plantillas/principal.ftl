<#import "/plantillas/form.ftl" as macro>
<@macro.page>
    <#if estudiantes?size gt 0>
        <#list estudiantes as student>
    <div class="col-lg-3 col-md-4 col-sm-6 mb-3">
        <div class="card bg-light rounded-0">
            <div class="card-body">
                <h5 class="card-title m-0">
                    ${student.nombre} ${student.apellido}
                </h5>
            </div>

            <ul class="list-group list-group-flush">
                <li class="list-group-item"><b>Matrícula</b> ${student.matricula?string["0"]}</li>
                <li class="list-group-item"><b>Nombre</b> ${student.nombre}</li>
                <li class="list-group-item"><b>Apellido</b> ${student.apellido}</li>
                <li class="list-group-item"><b>Telefono</b> ${student.telefono}</li>
            </ul>

            <div class="card-footer mx-auto bg-transparent p-0">
                <div class="btn-group" role="group">
                    <a class="btn btn-outline-secondary border-0 rounded-0" type="button" href="/estudiante/${student.matricula?string["0"]}">
                        <i class="fas fa-user"></i> Visualizar
                    </a>
                    <a class="btn btn-outline-secondary border-0 rounded-0" type="button" href="/estudiante/editar/${student.matricula?string["0"]}">
                        <i class="fas fa-user-edit"></i> Editar
                    </a>
                    <a class="btn btn-outline-secondary border-0 rounded-0" type="button" href="/estudiante/borrar/${student.matricula?string["0"]}">
                        <i class="fas fa-user-slash"></i> Borrar
                    </a>
                </div>
            </div>
        </div>
    </div>
        </#list>
    <#else>

    div class="col-lg-8 col-md-10 col-sm-12 mx-auto mb-3">
        <div class="alert alert-secondary text-center">
            Crea un nuevo Estudiante, en el boton de arriba o aquí: <br>
            <a href="/estudiante/insertar" class="alert-link">
                <i class="fas fa-user-plus"></i> Insertar Estudiante
            </a>
        </div>
    </div>

    </#if>
</@macro.page>