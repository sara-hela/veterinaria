package com.emergentes.modelo;

import java.sql.Time;
import java.util.Date;

public class Reserva {
    private int id;
    private int id_paciente;
    private int id_doctor;
    private Date fecha;
    private Time hora;
    private String observacion;


    public Reserva() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getId_paciente() {
        return id_paciente;
    }

    public void setId_paciente(int id_paciente) {
        this.id_paciente = id_paciente;
    }

    public int getId_doctor() {
        return id_doctor;
    }

    public void setId_doctor(int id_doctor) {
        this.id_doctor = id_doctor;
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

    public String getObservacion() {
        return observacion;
    }

    public void setObservacion(String observacion) {
        this.observacion = observacion;
    }


    @Override
    public String toString() {
        return "Reserva{" + "id=" + id + ", id_paciente=" +
                id_paciente + ", id_doctor=" + id_doctor + ", fecha=" + fecha + ", hora=" + hora + ", observacion=" + observacion + '}';
    }
}
