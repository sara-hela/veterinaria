package com.emergentes.dao;

import com.emergentes.modelo.Recepcionista;
import java.util.List;

public interface RecepcionistaDAO {
    public void insert(Recepcionista recepcionista) throws Exception;
    public void update(Recepcionista recepcionista) throws Exception;
    public void delete(int id) throws Exception;
    public Recepcionista getById(int id) throws Exception;
    public List<Recepcionista> getAll() throws Exception;
}
