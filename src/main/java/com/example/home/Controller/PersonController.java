package com.example.home.Controller;

import com.example.home.Model.Person;
import com.example.home.Service.PersonService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.hateoas.CollectionModel;
import org.springframework.hateoas.EntityModel;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/persons")
public class PersonController {

    @Autowired
    private PersonService personService;


    public CollectionModel<EntityModel<Person>> all(){
        return personService.getAll();
    }

    Person newPerson(@RequestBody Person person){
        return personService.newPerson(person);
    }

    @GetMapping("/{id}")
    public EntityModel<Person> one(@PathVariable Long id){
        return personService.one(id);
    }

    @PutMapping("/{id}")
    Person replacePerson(@RequestBody Person newPerson, @PathVariable Long id){
        return personService.updatePerson(newPerson, id);
    }

    @DeleteMapping("/{id}")
    void deletePerson(@PathVariable Long id){
        personService.deletePerson(id);
    }
}
