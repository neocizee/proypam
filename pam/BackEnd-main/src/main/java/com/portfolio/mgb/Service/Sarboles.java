/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.portfolio.mgb.Service;

import com.portfolio.mgb.Entity.Arboles;
import com.portfolio.mgb.Repository.RArboles;
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
    
    public Optional<Arboles> getOne(int fid){
        return rArboles.findById(fid);
    }
    
    public Optional<Arboles> getByFid(int fid){
        return rArboles.findById(fid);
    }
    
    public void save(Arboles arboles){
        rArboles.save(arboles);
    }
    
    public void delete(int id){
        rArboles.deleteById(id);
    }
    
    public boolean existsByEle(int ele){
        return rArboles.existsById(ele);
    }
    /*
    public boolean existsByFid(int fid){
        return rArboles.existByFid(fid);
    }
    */
    
}
