/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.proyarbm.pam.Dto;

import javax.validation.constraints.NotBlank;

/**
 *
 * @author 7mo
 */
public class dtoArboles {

    @NotBlank
    private int ele;
    @NotBlank
    private int nombre; 
    @NotBlank
    private String fecha;
    @NotBlank
    private int modulo; 
    @NotBlank
    private int id_gps; 
    @NotBlank
    private int id_asociad; 
    @NotBlank
    private String observacion; 
    @NotBlank
    private int plantilla; 
    @NotBlank
    private int altura_ini; 
    @NotBlank
    private int altura_fin; 
    @NotBlank
    private int lado; 
    @NotBlank
    private int id_bbdd; 
    @NotBlank
    private String obs_data; 
    @NotBlank
    private float circunsf; 
    @NotBlank
    private float diametro; 
    @NotBlank
    private float numeracion_aproximada; 
    @NotBlank
    private boolean rare_elements; 
    @NotBlank
    private String desc_rare_elements; 
    @NotBlank
    private boolean clavel_del_aire; 
    @NotBlank
    private float ancho_vereda; 
    @NotBlank
    private boolean vereda_damage; 
    @NotBlank
    private boolean vereda_levantada; 
    @NotBlank
    private String actualizacion; 
    @NotBlank
    private int calle_id; 
    @NotBlank
    private int altura_id; 
    @NotBlank
    private int especie_arbol_id; 
    @NotBlank
    private int vereda_id; 
    @NotBlank
    private int estado_gen_id; 
    @NotBlank
    private int espacio_id;

    public dtoArboles(){
    }
    
    public dtoArboles(
            int ele, 
            int nombre, 
            int modulo, 
            String fecha, 
            int id_gps, 
            int id_asociad, 
            String observacion, 
            int plantilla, 
            int altura_ini, 
            int altura_fin, 
            int lado, 
            int id_bbdd, 
            String obs_data, 
            float circunsf, 
            float diametro, 
            float numeracion_aproximada, 
            boolean rare_elements, 
            String desc_rare_elements, 
            boolean clavel_del_aire, 
            float ancho_vereda, 
            boolean vereda_damage, 
            boolean vereda_levantada, 
            String actualizacion, 
            int calle_id, 
            int altura_id, 
            int especie_arbol_id, 
            int vereda_id, 
            int estado_gen_id, 
            int espacio_id
        ){   
        this.ele = ele;
        this.nombre = nombre;
        this.modulo = modulo;
        this.fecha = fecha;
        this.id_gps = id_gps;
        this.id_asociad = id_asociad;
        this.observacion = observacion;
        this.plantilla = plantilla;
        this.altura_ini = altura_ini;
        this.altura_fin = altura_fin;
        this.lado = lado;
        this.id_bbdd = id_bbdd;
        this.obs_data = obs_data;
        this.circunsf = circunsf;
        this.diametro = diametro;
        this.numeracion_aproximada = numeracion_aproximada;
        this.rare_elements = rare_elements;
        this.desc_rare_elements = desc_rare_elements;
        this.clavel_del_aire = clavel_del_aire;
        this.ancho_vereda = ancho_vereda;
        this.vereda_damage = vereda_damage;
        this.vereda_levantada = vereda_levantada;
        this.actualizacion = actualizacion;
        this.calle_id = calle_id;
        this.altura_id = altura_id;
        this.especie_arbol_id = especie_arbol_id;
        this.vereda_id = vereda_id;
        this.estado_gen_id = estado_gen_id;
        this.espacio_id = espacio_id;
    }

    
    
   
    public int getEle(){
        return ele;
    }
    public void setEle(int ele){
        this.ele = ele;
    }
    
    public int getNombre(){
        return nombre;
    }
    public void setNombre(int nombre){
        this.nombre = nombre;
    }
    
    
    public int getModulo(){
        return modulo;
    }
    public void setModulo(int modulo){
        this.modulo = modulo;
    }
    
    public String getFecha(){
        return fecha;
    }
    public void setFecha(String fecha){
        this.fecha = fecha;
    }
    
    
    public int getIdGps(){
        return id_gps;
    }
    public void setIdGps(int id_gps){
        this.id_gps = id_gps;
    }
    
    
    public int getIdAsociad(){
        return id_asociad;
    }
    public void setIdAsociad(int id_asociad){
        this.id_asociad = id_asociad;
    }
    
    
    public String getObservacion(){
        return observacion;
    }
    public void setObservacion(String observacion){
        this.observacion = observacion;
    }
    
    
    public int getPlantilla(){
        return plantilla;
    }
    public void setPlantilla(int plantilla){
        this.plantilla = plantilla;
    }
    
    
    public int getAlturaIni(){
        return altura_ini;
    }
    public void setAlturaIni(int altura_ini){
        this.altura_ini = altura_ini;
    }
    
    
    public int getAlturaFin(){
        return altura_fin;
    }
    public void setAlturaFin(int altura_fin){
        this.altura_fin = altura_fin;
    }
    
    
    public int getLado(){
        return lado;
    }
    public void setLado(int lado){
        this.lado = lado;
    }
    
    
    public int getIdBBDD(){
        return id_bbdd;
    }
    public void setIdBBDD(int id_bbdd){
        this.id_bbdd = id_bbdd;
    }
    
    
    public String getObsData(){
        return obs_data;
    }
    public void setObsData(String obs_data){
        this.obs_data = obs_data;
    }
    
    
    public float getCircunsf(){
        return circunsf;
    }
    public void setCircunsf(float circunsf){
        this.circunsf = circunsf;
    }
    
    
    public float getDiametro(){
        return diametro;
    }
    public void setDiametro(float diametro){
        this.diametro = diametro;
    }

    
    
    public float getNumAprox(){
        return numeracion_aproximada;
    }
    public void setNumAprox(float numeracion_aproximada){
        this.numeracion_aproximada = numeracion_aproximada;
    }
    
    
    
    public boolean getRareElements(){
        return rare_elements;
    }
    public void setRareElements(boolean rare_elements){
        this.rare_elements = rare_elements;
    }
    
    
    
    public String getDescRareElements(){
        return desc_rare_elements;
    }
    public void setDescRareElements(String desc_rare_elements){
        this.desc_rare_elements = desc_rare_elements;
    }
    
    
    public boolean getClavelDelAire(){
        return clavel_del_aire;
    }
    public void setClavelDelAire(boolean clavel_del_aire){
        this.clavel_del_aire = clavel_del_aire;
    }
    
    
    public float getAnchoVereda(){
        return ancho_vereda;
    }
    public void setAnchoVereda(float ancho_vereda){
        this.ancho_vereda = ancho_vereda;
    }
    
    
    public boolean getVeredaDamage(){
        return vereda_damage;
    }
    public void setVeredaDamage
        (boolean vereda_damage){
        this.vereda_damage = vereda_damage;
    }
    
   
    public boolean getVeredaLevantada(){
        return vereda_levantada;
    }
    public void setVeredaLevantada
        (boolean vereda_levantada){
        this.vereda_levantada = vereda_levantada;
    }
        
        
   
    public String getActualizacion(){     
       return actualizacion;
    }
    public void setActualizacion(String actualizacion){
        this.actualizacion = actualizacion;
    } 
    
    
    
    
    public int getCalleId(){     
       return calle_id;
    }
    public void setCalleId(int calle_id){
        this.calle_id = calle_id;
    } 
    
    
    public int getAlturaId(){     
       return altura_id;
    }
    public void setAlturaId(int altura_id){
        this.altura_id = altura_id;
    } 
    
    public int getEspecieArbolId(){     
       return especie_arbol_id;
    }
    public void setEspecieArbolId(int especie_arbol_id){
        this.especie_arbol_id = especie_arbol_id;
    } 
    
    public int getVeredaId(){     
       return vereda_id;
    }
    public void setVeredaId(int vereda_id){
        this.vereda_id = vereda_id;
    } 
    
    
            
    public int getEstadoGenId(){     
       return estado_gen_id;
    }
    public void setEstadoGenId(int estado_gen_id){
        this.estado_gen_id = estado_gen_id;
    } 
        
        
    public int getEspacio(){     
       return espacio_id;
    }
    public void setEspacio(int espacio_id){
        this.espacio_id = espacio_id;
    } 
    
}
