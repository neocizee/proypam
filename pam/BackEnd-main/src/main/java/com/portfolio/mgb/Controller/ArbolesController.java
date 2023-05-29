/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.portfolio.mgb.Controller;

import com.portfolio.mgb.Dto.dtoArboles;
import com.portfolio.mgb.Entity.Arboles;
import com.portfolio.mgb.Security.Controller.Mensaje;
import com.portfolio.mgb.Service.Sarboles;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
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
        Arboles arboles = new Arboles(
            dtoarboles.getEle(),
            dtoarboles.getNombre(),
            dtoarboles.getModulo(),    
            dtoarboles.getIdGps(),
            dtoarboles.getFecha(),
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
            dtoarboles.getEspacioId()
        );
        sarboles.save(arboles);
        
        return new ResponseEntity(new Mensaje("Arbol agregada"), HttpStatus.OK);
    }
}
