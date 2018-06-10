<#import "/plantillas/form.ftl" as macro>
<@macro.page>
    <#if estudiantes?size gt 0>
        <#list estudiantes as estudiante>
    <div class="col-lg-3 col-md-4 col-sm-6 mb-3">
        <div class="card bg-light rounded-0">
            <div class="card-body">
                <h5 class="card-title m-0">
                    ${estudiante.nombre} ${estudiante.apellido}
                </h5>
            </div>

            <ul class="list-group list-group-flush">
                <li class="list-group-item"><b>Matrícula</b> ${estudiante.matricula?string["0"]}</li>
                <li class="list-group-item"><b>Nombre</b> ${estudiante.nombre}</li>
                <li class="list-group-item"><b>Apellido</b> ${estudiante.apellido}</li>
                <li class="list-group-item"><b>Telefono</b> ${estudiante.telefono}</li>
            </ul>

            <div class="card-footer mx-auto bg-transparent p-0">
                <div class="btn-group" role="group">
                    <a class="btn btn-outline-secondary border-0 rounded-0" type="button" href="/estudiante/${estudiante.matricula?string["0"]}">
                        <i class="fas fa-user"></i> Visualizar
                    </a>
                    <a class="btn btn-outline-secondary border-0 rounded-0" type="button" href="/estudiante/editar/${estudiante.matricula?string["0"]}">
                        <i class="fas fa-user-edit"></i> Editar
                    </a>
                    <a class="btn btn-outline-secondary border-0 rounded-0" type="button" href="/estudiante/borrar/${estudiante.matricula?string["0"]}">
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
            Puedes crearlo con el botón superior o aquí: <br>
            <a href="/estudiante/insertar" class="alert-link">
                <i class="fas fa-user-plus"></i> Insertar Estudiante
            </a>
        </div>
    </div>

    </#if>
</@macro.page>