package com.example.home.Controller;

import com.example.home.DAO.PersonRepository;
import com.example.home.Model.Person;
import com.example.home.PersonNotFoundException;
import org.springframework.hateoas.CollectionModel;
import org.springframework.hateoas.EntityModel;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.stream.Collectors;

import static org.springframework.hateoas.server.mvc.WebMvcLinkBuilder.linkTo;
import static org.springframework.hateoas.server.mvc.WebMvcLinkBuilder.methodOn;

@RestController
public class PersonController {
    private PersonRepository personRepository;

    public PersonController(PersonRepository repository){
        this.personRepository = repository;
    }

    @GetMapping("/persons")
    CollectionModel<EntityModel<Person>> all(){
        List<EntityModel<Person>> persons = personRepository.findAll().stream().map(person ->
                EntityModel.of(person, linkTo(methodOn(PersonController.class).all()).withRel("person")))
                .collect(Collectors.toList());
        return CollectionModel.of(persons, linkTo(methodOn(PersonController.class).all()).withSelfRel());
    }

    @PostMapping("/persons")
    Person newPerson(@RequestBody Person person){
        return personRepository.save(person);
    }

    @GetMapping("/persons/{id}")
    EntityModel<Person> one(@PathVariable Long id){
        Person person = personRepository.findById(id).orElseThrow(() -> new PersonNotFoundException(id));
        return EntityModel.of(person, linkTo(methodOn(PersonController.class).one(id)).withSelfRel(),
                linkTo(methodOn(PersonController.class).all()).withRel("person"));
    }

    @PutMapping("/persons/{id}")
    Person replacePerson(@RequestBody Person newPerson, @PathVariable Long id){
        return personRepository.findById(id).map(person -> {
            person.setFirstName(newPerson.getFirstName());
            person.setCity(newPerson.getCity());
            person.setState(newPerson.getState());
            return personRepository.save(person);
        }).orElseGet(() -> {
            newPerson.setId(id);
            return personRepository.save(newPerson);
        });
    }

    @DeleteMapping("/persons/{id}")
    void deletePerson(@PathVariable Long id){
        personRepository.deleteById(id);
    }
}
