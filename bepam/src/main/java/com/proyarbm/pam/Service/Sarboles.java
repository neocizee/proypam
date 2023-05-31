/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.proyarbm.pam.Service;

import com.proyarbm.pam.Entity.Arboles;
import com.proyarbm.pam.Repository.RArboles;
import java.util.List;
import java.util.Optional;
import javax.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author 7mo
 */

@Service
@Transactional
public class Sarboles {
    
    @Autowired
    RArboles rArboles;
    
    public List<Arboles> list(){
        return rArboles.findAll();
    }
    
    public Optional<Arboles> getOne(int id){
        return rArboles.findById(id);
    }
    
    public Optional<Arboles> getById(int id){
        return rArboles.findById(id);
    }
    
    public void save(Arboles arboles){
        rArboles.save(arboles);
    }
    
    public void delete(int id){
        rArboles.deleteById(id);
    }
    
    public boolean existsByEle(int ele){
        return rArboles.existsByEle(ele);
    }

    public boolean existsById(int id){
        return rArboles.existsById(id);
    }
    
}
