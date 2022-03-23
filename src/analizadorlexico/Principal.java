package analizadorlexico;

import java.io.File;

public class Principal {

    public static void main(String[] args) {
        String ruta = "C:/Users/jesus/Desktop/AnalizadorLexico/src/analizadorlexico/Lexer.flex";
        generarLexer(ruta);
        
    }
    
    public static void generarLexer(String ruta){
        File archivo = new File(ruta);
        
        JFlex.Main.generate(archivo);
    }
}
