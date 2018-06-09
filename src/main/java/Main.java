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
        ArrayList<Estudiante> estudiantes = new ArrayList<>();

        //listado de estudiantes
        estudiantes.add(new Estudiante(20121776,"Joel","Rodriguez","809-555-5555"));
        estudiantes.add(new Estudiante(20135555,"Frank","Perez","809-578-5555"));
        estudiantes.add(new Estudiante(20150000,"Luis","Gomez","809-578-1212"));


        get("/", (request, response) -> {

            //Crear Modelo de Datos
            Map<String, Object> input = new HashMap<>();
            input.put("blogTitle", "Plantilla Freemarker Lista Estudiantes");
            input.put("estudiantes", estudiantes);

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
                        estudiantes.add(new Estudiante(matricula, nombre, apellido, telefono));

                        response.redirect("/");


                        return null;

                    });
            //get();
            //delete();
        });


        // Error 404
        notFound("<html><body><h1>Error 404: Se ha comunicado con el Server, pero el recurso solicitado no existe</h1></body></html>");


    }

}
