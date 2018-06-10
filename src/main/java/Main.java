import freemarker.template.Configuration;
import freemarker.template.Template;


import java.io.StringWriter;
import java.io.Writer;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import static spark.Spark.*;


public class Main {

    public static void main (String [] args){
        //Objeto de Configuracion
        final Configuration cfg = new Configuration(Configuration.VERSION_2_3_28);

        cfg.setClassForTemplateLoading(Main.class, "/");
        /* // Probando
        get("/prueba", (req, res) -> "Spark + ..."); */

        //ArrayList para Estudiantes.
        ArrayList<Estudiante> students = new ArrayList<>();

        //listado de estudiantes
        students.add(new Estudiante(20121776,"Joel","Rodriguez","809-555-5555"));
        students.add(new Estudiante(20135555,"Frank","Perez","809-578-5555"));
        students.add(new Estudiante(20150000,"Luis","Gomez","809-578-1212"));


        get("/", (request, response) -> {

            //Crear Modelo de Datos
            Map<String, Object> input = new HashMap<>();
            input.put("blogTitle", "Plantilla Freemarker Lista Estudiantes");
            input.put("students", students);

            //Instanciar Plantilla
            Template plantilla = cfg.getTemplate("plantillas/principal.ftl");

            //Salida
            Writer consoleWriter = new StringWriter();
            plantilla.process(input, consoleWriter);
            consoleWriter.flush();

            return consoleWriter;
        });


        //Path groups: Si se tiene muchas rutas, puede ser útil separarlas en grupos.
        path("/estudiantes", () -> {
            post("/insertar", (request, response) -> {

                        //rutas para guardar entradas.
                        int matricula = Integer.parseUnsignedInt(request.queryParams("matricula"));
                        String nombre = request.queryParams("nombre");
                        String apellido = request.queryParams("apellido");
                        String telefono = request.queryParams("telefono");
                        students.add(new Estudiante(matricula, nombre, apellido, telefono));

                        response.redirect("/");


                        return null;

                    });
            get("/insertar", (request, response) -> {
               Writer consoleWriter = new StringWriter();

               //Config. ruta para form de insertar.
                Template plantilla = cfg.getTemplate("plantillas/insertar.ftl");
                plantilla.process(null, consoleWriter);

                return consoleWriter;

            });


            //Ruta para Editar Estudiantes
            get("/editar/:matricula", (request, response) -> {
                try {

                    Map<String, Object> input = new HashMap<>();
                    Estudiante student = null;

                    Template plantilla = cfg.getTemplate("plantillas/editar.ftl");

                    if (student == null) {
                        throw new Exception();
                    }

                    for (Estudiante est : students) {
                        if (est.getMatricula() == Integer.parseInt(request.params("matricula"))) {   //Ind. las ruta por las matriculas
                            student = est;
                        }
                    }

                    StringWriter consoleWriter = new StringWriter();
                    input.put("student", student);
                    plantilla.process(input, consoleWriter);

                    return consoleWriter;
                } catch (Exception fail) {
                    fail.printStackTrace();   //Imprime el registro donde sucedio la exception en spark
                    return null;
                }
            });

            //Guardar cambios al editar
            post("/editar", (request, response) -> {
                int matricula = Integer.parseInt(request.queryParams("matricula"));

                String nombre = request.queryParams("nombre");
                String apellido = request.queryParams("apellido");
                String telefono = request.queryParams("telefono");

                for (Estudiante est : students) {
                    if (est.getMatricula() == matricula) {

                        est.setNombre(nombre);
                        est.setApellido(apellido);
                        est.setTelefono(telefono);
                    }
                }

                response.redirect("/");

                return null;
            });

            //Visualizar estudiante selecionado
            get("/:matricula", (request, response) -> {
                try {

                    Map<String, Object> input = new HashMap<>();

                    Estudiante student = null;
                    Template plantilla = cfg.getTemplate("plantillas/visualizar-estudiante.ftl");

                    if (student == null) {
                        throw new Exception();
                    }

                    for (Estudiante est : students) {
                        if (est.getMatricula() == Integer.parseInt(request.params("matricula"))) {
                            student = est;
                        }
                    }

                    StringWriter consoleWriter = new StringWriter();
                    input.put("estudiante", student);
                    plantilla.process(input, consoleWriter);

                    return consoleWriter;

                } catch (Exception error) {
                    error.printStackTrace();
                    return null;

                }
            });


            //Borrar Estudiantes Seleccionado
            post("/borrar/:matricula", (request, response) -> {

                StringWriter consoleWriter = new StringWriter();

                Template plantilla = cfg.getTemplate("plantillas/borrar.ftl");

                int matricula = Integer.parseInt(request.params("matricula"));
                Estudiante student = null;

                if (student == null) {
                    throw new Exception();
                }

                for (Estudiante est : students) {
                    if (est.getMatricula() == matricula) {
                        student = est;
                    }
                }

                Map<String, Object> input = new HashMap<>();
                input.put("student", student);
                plantilla.process(input, consoleWriter);

                students.remove(student);

                response.redirect("/");

                return null;
            });
        });


        // Error 404
        notFound("<html><body><h1>Error 404: Se ha comunicado con el Server, pero el recurso solicitado no existe</h1></body></html>");


    }

}
