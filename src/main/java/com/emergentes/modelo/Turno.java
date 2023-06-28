/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.emergentes.modelo;

import java.sql.Time;

public class Turno {
    private int id;
    private String turno;
    private Time hora_inicio;
    private Time hora_final;

    public Turno() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTurno() {
        return turno;
    }

    public void setTurno(String turno) {
        this.turno = turno;
    }

    public Time getHora_inicio() {
        return hora_inicio;
    }

    public void setHora_inicio(Time hora_inicio) {
        this.hora_inicio = hora_inicio;
    }

    public Time getHora_final() {
        return hora_final;
    }

    public void setHora_final(Time hora_final) {
        this.hora_final = hora_final;
    }

    @Override
    public String toString() {
        return "Turno{" + "id=" + id + ", turno=" + turno + ", hora_inicio=" + hora_inicio + ", hora_final=" + hora_final + '}';
    }
}
