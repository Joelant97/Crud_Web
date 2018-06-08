import freemarker.template.Configuration;

import java.util.ArrayList;

public class Main {

    public static void main (String [] args){
        //Objeto de Configuracion
        final Configuration cfg = new Configuration(Configuration.VERSION_2_3_28);

        cfg.setClassForTemplateLoading(Main.class, "/");

        // Probando
        //get("/prueba", (req, res) -> "Spark + ...");
        //ArrayList para Estudiantes.
        ArrayList<Estudiante> estudiantes = new ArrayList<>();

    }




}
