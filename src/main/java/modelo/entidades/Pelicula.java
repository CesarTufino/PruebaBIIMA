package modelo.entidades;

import java.util.ArrayList;
import java.util.List;


public class Pelicula {

    private String codigo;
    private String titulo;
    private List<Ejemplar> ejemplares = new ArrayList<Ejemplar>();

    private static List<Pelicula> peliculas = null;

    public Pelicula() {
    }

    public Pelicula(String codigo, String titulo) {
        this.codigo = codigo;
        this.titulo = titulo;
    }

    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public List<Ejemplar> getEjemplares() {
        return ejemplares;
    }

    public void setEjemplares(List<Ejemplar> ejemplares) {
        this.ejemplares = ejemplares;
    }

    // Reglas del negocio
    public void create(Pelicula p) {
        this.getPeliculas().add(p);
    }

    public List<Pelicula> getPeliculas() {
        if (peliculas == null) {
            peliculas = new ArrayList<>();
            Pelicula pelicula = new Pelicula("P001", "El Padrino");
            Pelicula pelicula2 = new Pelicula("P002", "Pulp Fiction");
            Pelicula pelicula3 = new Pelicula("P003", "Cadena perpetua");
            peliculas.add(pelicula);
            peliculas.add(pelicula2);
            peliculas.add(pelicula3);
        }
        return peliculas;
    }

    public Pelicula getByCodigo(String codigo) {
        Pelicula p = null;
        List<Pelicula> listPeliculas = this.getPeliculas();

        for (Pelicula pelicula : listPeliculas){
            if (pelicula.getCodigo().equals(codigo)) {
                p = pelicula;
                break;
            }
        }
        return p;
    }
}
