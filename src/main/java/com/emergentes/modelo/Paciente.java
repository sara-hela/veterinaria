package com.emergentes.modelo;

import java.util.Date;

public class Paciente {
    private int id;
    private String nombre;
    private String raza;
    private int edad;
    private String color;
    private String rasgos;
    private String sexo;
    private int id_responsable;
    private String tipo_animal;

    public Paciente() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getRaza() {
        return raza;
    }

    public void setRaza(String raza) {
        this.raza = raza;
    }

    public int getEdad() {
        return edad;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public String getRasgos() {
        return rasgos;
    }

    public void setRasgos(String rasgos) {
        this.rasgos = rasgos;
    }

    public String getSexo() {
        return sexo;
    }

    public void setSexo(String sexo) {
        this.sexo = sexo;
    }

    public int getId_responsable() {
        return id_responsable;
    }

    public void setId_responsable(int id_responsable) {
        this.id_responsable = id_responsable;
    }

    public String getTipo_animal() {
        return tipo_animal;
    }

    public void setTipo_animal(String tipo_animal) {
        this.tipo_animal = tipo_animal;
    }


    @Override
    public String toString() {
        return "Paciente{" + "id=" + id + ", nombre=" + nombre + ", raza=" + raza + ", edad=" + edad + ", color=" + color + ", rasgos=" + rasgos + ", sexo=" + sexo + ", id_responsable=" + id_responsable + ", tipo animal=" + tipo_animal + '}';
    }
}
