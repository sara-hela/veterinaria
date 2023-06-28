package com.emergentes.modelo;

public class Receta {
    private int id;
    private int id_consulta;
    private String medicamento;
    private String dosis;
    private String indicaciones;

    public Receta() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getId_consulta() {
        return id_consulta;
    }

    public void setId_consulta(int id_consulta) {
        this.id_consulta = id_consulta;
    }

    public String getMedicamento() {
        return medicamento;
    }

    public void setMedicamento(String medicamento) {
        this.medicamento = medicamento;
    }

    public String getDosis() {
        return dosis;
    }

    public void setDosis(String dosis) {
        this.dosis = dosis;
    }

    public String getIndicaciones() {
        return indicaciones;
    }

    public void setIndicaciones(String indicaciones) {
        this.indicaciones = indicaciones;
    }

    @Override
    public String toString() {
        return "Receta{" + "id=" + id + ", id_consulta=" + id_consulta + ", medicamento=" + medicamento + ", dosis=" + dosis + ", indicaciones=" + indicaciones + '}';
    }
}
