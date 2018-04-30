/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cr.ac.una.prograiv.agenda.bl;

import cr.ac.una.prograiv.agenda.domain.Personas;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/**
 *
 * @author chgari
 */
public class PersonasBL extends BaseBL implements IBaseBL<Personas, Integer>{
    public PersonasBL() {
        super();
    }
    @Override
    public void save(Personas o) {
            this.getDao(o.getClass().getName()).save(o);
    }
    
    public boolean validaPersona(Personas o){
        Personas aux = findById(o.getPkCedula());
        if( aux != null ){
            return false;
        }else{
            save(o);
        }
        return true;
    }
    
    @Override
    public Personas merge(Personas o) {
        return (Personas) this.getDao(o.getClass().getName()).merge(o);
    }
    @Override
    public void delete(Personas o) {
        /*Ej: 1.1
          ELIMINAR UNA PERSONA SOLO SI TIENE MENOS DE 5 TELEFONOS Y
          3 DIRECCIONES
        */
        this.getDao(o.getClass().getName()).delete(o);
    }
    @Override
    public Personas findById(Integer o) {
        return (Personas) this.getDao(Personas.class.getName()).findById(o);
    }
    @Override
    public List<Personas> findAll(String className) {
        return this.getDao(className).findAll();
    }
    
    public List<Personas> findByNombre(String name){
        List<Personas> personas = findAll(Personas.class.getName());
        List<Personas> found;
        found = new ArrayList<>();
        for (Personas aux : personas) {
            if(aux.getNombre().equals(name)){
                found.add(aux);
            }
        }
        return found;
    }
    
}
