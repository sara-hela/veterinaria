package com.emergentes.dao;

import com.emergentes.modelo.Doctor;
import java.util.List;

public interface DoctorDAO {
    public void insert(Doctor doctor) throws Exception;
    public void update(Doctor doctor) throws Exception;
    public void delete(int id) throws Exception;
    public Doctor getById(int id) throws Exception;
    public List<Doctor> getAll() throws Exception;
}
