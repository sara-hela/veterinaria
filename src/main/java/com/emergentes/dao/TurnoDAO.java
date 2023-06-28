package com.emergentes.dao;

import com.emergentes.modelo.Turno;
import java.util.List;

public interface TurnoDAO {
    public void insert(Turno turno) throws Exception;
    public void update(Turno turno) throws Exception;
    public void delete(int id) throws Exception;
    public Turno getById(int id) throws Exception;
    public List<Turno> getAll() throws Exception;
}
