package com.example.home.DAO;

import com.example.home.Model.Person;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;


public interface PersonRepository extends JpaRepository<Person, Long> {

}
