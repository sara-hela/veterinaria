package com.emergentes.dao;

import com.emergentes.modelo.Receta;
import java.util.List;

public interface RecetaDAO {
    public void insert(Receta receta) throws Exception;
    public void update(Receta receta) throws Exception;
    public void delete(int id) throws Exception;
    public Receta getById(int id) throws Exception;
    public List<Receta> getAll() throws Exception;
}
