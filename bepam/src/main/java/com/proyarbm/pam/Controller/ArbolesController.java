/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.proyarbm.pam.Controller;

import com.proyarbm.pam.Dto.dtoArboles;
import com.proyarbm.pam.Entity.Arboles;
import com.proyarbm.pam.Security.Controller.Mensaje;
import com.proyarbm.pam.Security.Dto.NuevoUsuario;
import com.proyarbm.pam.Security.Entity.Rol;
import com.proyarbm.pam.Security.Entity.Usuario;
import com.proyarbm.pam.Service.Sarboles;
import java.util.HashSet;
import java.util.List;
import java.util.Optional;
import java.util.Set;
import javax.management.relation.RoleStatus;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.RequestEntity;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author 7mo
 */
@RestController
@RequestMapping("/arboles")
@CrossOrigin(origins = {"http://localhost:4200"})
public class ArbolesController {
    @Autowired
    Sarboles sarboles;
    
    @GetMapping("/lista")
    public ResponseEntity<List<Arboles>> list(){
        List<Arboles> list = sarboles.list();
        return new ResponseEntity(list, HttpStatus.OK);
    }
    
            
            
    @PostMapping("/create")
    public ResponseEntity<?> create(@RequestBody dtoArboles dtoarboles){
        if(dtoarboles.getEle() == 0){
            return new ResponseEntity(new Mensaje("El ELE no puede ser nulo"), HttpStatus.BAD_REQUEST);
        }
        
        Arboles arboles = new Arboles
        (
            dtoarboles.getEle(),
            dtoarboles.getNombre(),
            dtoarboles.getModulo(),    
            dtoarboles.getFecha(),
            dtoarboles.getIdGps(),
            dtoarboles.getIdAsociad(),
            dtoarboles.getObservacion(),
            dtoarboles.getPlantilla(),
            dtoarboles.getAlturaIni(),
            dtoarboles.getAlturaFin(),
            dtoarboles.getLado(),
            dtoarboles.getIdBBDD(),
            dtoarboles.getObsData(),        
            dtoarboles.getCircunsf(),
            dtoarboles.getDiametro(),
            dtoarboles.getNumAprox(),
            dtoarboles.getRareElements(),
            dtoarboles.getDescRareElements(),
            dtoarboles.getClavelDelAire(),
            dtoarboles.getAnchoVereda(),
            dtoarboles.getVeredaDamage(),
            dtoarboles.getVeredaLevantada(),
            dtoarboles.getActualizacion(),
            dtoarboles.getCalleId(),
            dtoarboles.getAlturaId(),
            dtoarboles.getEspecieArbolId(),
            dtoarboles.getVeredaId(),
            dtoarboles.getEstadoGenId(),
            dtoarboles.getEspacio()
        );
        sarboles.save(arboles);
        
        return new ResponseEntity(new Mensaje("Arbol agregado"), HttpStatus.OK);
    }
    
    @DeleteMapping("/delete/{id}")
    public ResponseEntity<?> delete(@PathVariable("id") int id){
        if(!sarboles.existsById(id)){
            return new ResponseEntity(new Mensaje("Ese ID de arbol no existe"), HttpStatus.NOT_FOUND);
        }
        sarboles.delete(id);
        return new ResponseEntity(new Mensaje("Arbol eliminado"), HttpStatus.OK);
    }
    
    @GetMapping("/listaid/{id}")
    public ResponseEntity<List<Arboles>> getById(@PathVariable("id") int id){
        if(!sarboles.existsById(id)){
            return new ResponseEntity(new Mensaje("El ID no existe"), HttpStatus.BAD_REQUEST);
        } else {
            Optional<Arboles> optional = sarboles.getById(id);
            return new ResponseEntity(optional, HttpStatus.OK);
        }
    }
    

    @PutMapping("/update/{id}")
    public ResponseEntity<?> update(@PathVariable("id") int id, @RequestBody dtoArboles dtoarboles){
        if(!sarboles.existsById(id))
            return new ResponseEntity(new Mensaje("El ID no existe"), HttpStatus.BAD_REQUEST);
        
        Arboles arboles = sarboles.getOne(id).get();
        
        arboles.setEle(dtoarboles.getEle());
        arboles.setNombre(dtoarboles.getNombre());
        arboles.setModulo(dtoarboles.getModulo());
        arboles.setFecha(dtoarboles.getFecha());
        arboles.setIdGps(dtoarboles.getIdGps());
        arboles.setIdAsociad(dtoarboles.getIdAsociad());
        arboles.setObservacion(dtoarboles.getObservacion());
        arboles.setPlantilla(dtoarboles.getPlantilla());
        arboles.setAlturaIni(dtoarboles.getAlturaIni());
        arboles.setAlturaFin(dtoarboles.getAlturaFin());
        arboles.setLado(dtoarboles.getLado());
        arboles.setIdBBDD(dtoarboles.getIdBBDD());
        arboles.setObsData(dtoarboles.getObsData());        
        arboles.setCircunsf(dtoarboles.getCircunsf());
        arboles.setDiametro(dtoarboles.getDiametro());
        arboles.setNumAprox(dtoarboles.getNumAprox());
        arboles.setRareElements(dtoarboles.getRareElements());
        arboles.setDescRareElements(dtoarboles.getDescRareElements());
        arboles.setClavelDelAire(dtoarboles.getClavelDelAire());
        arboles.setAnchoVereda(dtoarboles.getAnchoVereda());
        arboles.setVeredaDamage(dtoarboles.getVeredaDamage());
        arboles.setVeredaLevantada(dtoarboles.getVeredaLevantada());
        arboles.setActualizacion(dtoarboles.getActualizacion());
        arboles.setCalleId(dtoarboles.getCalleId());
        arboles.setAlturaId(dtoarboles.getAlturaId());
        arboles.setEspecieArbolId(dtoarboles.getEspecieArbolId());
        arboles.setVeredaId(dtoarboles.getVeredaId());
        arboles.setEstadoGenId(dtoarboles.getEstadoGenId());
        arboles.setEspacio(dtoarboles.getEspacio());
        
        sarboles.save(arboles);
        
        return new ResponseEntity(new Mensaje("Arbol actualizado"), HttpStatus.OK);
    }
}
