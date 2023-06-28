package com.emergentes.dao;

import com.emergentes.modelo.Consulta;
import java.util.List;

public interface ConsultaDAO {
    public void insert(Consulta consulta) throws Exception;
    public void update(Consulta consulta) throws Exception;
    public void delete(int id) throws Exception;
    public Consulta getById(int id) throws Exception;
    public List<Consulta> getAll() throws Exception;
}
