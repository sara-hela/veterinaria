package com.emergentes.dao;

import com.emergentes.modelo.Reserva;
import java.util.List;

public interface ReservaDAO {
    public void insert(Reserva reserva) throws Exception;
    public void update(Reserva reserva) throws Exception;
    public void delete(int id) throws Exception;
    public Reserva getById(int id) throws Exception;
    public List<Reserva> getAll() throws Exception;
}
