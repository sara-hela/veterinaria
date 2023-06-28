package com.emergentes.dao;

import com.emergentes.modelo.Paciente;
import java.util.List;

public interface PacienteDAO {
    public void insert(Paciente paciente) throws Exception;
    public void update(Paciente paciente) throws Exception;
    public void delete(int id) throws Exception;
    public Paciente getById(int id) throws Exception;
    public List<Paciente> getAll() throws Exception;
}
