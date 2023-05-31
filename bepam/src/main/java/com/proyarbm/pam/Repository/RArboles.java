/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.proyarbm.pam.Repository;

import com.proyarbm.pam.Entity.Arboles;
import java.util.Optional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 *
 * @author 7mo
 */
@Repository
public interface RArboles  extends JpaRepository<Arboles, Integer>{
    public Optional<Arboles> findByEle(int ele);
    public boolean existsByEle(int ele);
}
