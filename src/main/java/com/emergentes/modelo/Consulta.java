package com.emergentes.modelo;

import java.sql.Time;
import java.util.Date;

public class Consulta {
    private int id;
    private int id_doctor;
    private int id_paciente;
    private Date fecha;
    private Time hora;
    private String sintomas;
    private String diagnostico;

    public Consulta() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getId_doctor() {
        return id_doctor;
    }

    public void setId_doctor(int id_doctor) {
        this.id_doctor = id_doctor;
    }

    public int getId_paciente() {
        return id_paciente;
    }

    public void setId_paciente(int id_paciente) {
        this.id_paciente = id_paciente;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public Time getHora() {
        return hora;
    }

    public void setHora(Time hora) {
        this.hora = hora;
    }

    public String getSintomas() {
        return sintomas;
    }

    public void setSintomas(String sintomas) {
        this.sintomas = sintomas;
    }

    public String getDiagnostico() {
        return diagnostico;
    }

    public void setDiagnostico(String diagnostico) {
        this.diagnostico = diagnostico;
    }


    @Override
    public String toString() {
        return "Consulta{" + "id=" + id + ", id_doctor=" + id_doctor + ", id_paciente=" + id_paciente + ", fecha=" + fecha + ", hora=" + hora + ", sintomas=" + sintomas + ", diagnostico=" + diagnostico + '}';
    }
}
