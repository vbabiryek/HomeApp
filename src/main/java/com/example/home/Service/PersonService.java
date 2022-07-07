package com.example.home.Service;

import com.example.home.Controller.PersonController;
import com.example.home.DAO.PersonRepository;
import com.example.home.Model.Person;
import com.example.home.PersonNotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.hateoas.CollectionModel;
import org.springframework.hateoas.EntityModel;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import static org.springframework.hateoas.server.mvc.WebMvcLinkBuilder.linkTo;
import static org.springframework.hateoas.server.mvc.WebMvcLinkBuilder.methodOn;

@Service
public class PersonService {
    @Autowired
    private PersonRepository personRepository;

    public CollectionModel<EntityModel<Person>> getAll(){
        List<EntityModel<Person>> persons = personRepository.findAll().stream().map(person ->
                        EntityModel.of(person, linkTo(methodOn(PersonController.class).all()).withRel("person")))
                .collect(Collectors.toList());
        return CollectionModel.of(persons, linkTo(methodOn(PersonController.class).all()).withSelfRel());
    }

    public Person newPerson(Person person){
        return personRepository.save(person);
    }

    public EntityModel<Person> one(@PathVariable Long id){
        Person person = personRepository.findById(id).orElseThrow(() -> new PersonNotFoundException(id));
        return EntityModel.of(person, linkTo(methodOn(PersonController.class).one(id)).withSelfRel(),
                linkTo(methodOn(PersonController.class).all()).withRel("person"));
    }

    public Person updatePerson(Person newEntry, @PathVariable Long id){
        return personRepository.findById(id).map(person -> {
            person.setFirstName(person.getFirstName());
            person.setCity(person.getCity());
            person.setState(person.getState());
            return personRepository.save(person);
        }).orElseGet(() -> {
            newEntry.setId(id);
            return personRepository.save(newEntry);
        });
    }

    public void deletePerson(Long id){
        personRepository.deleteById(id);
    }

    public String getPersonEntry(Long id){
        Optional<Person> personEntry = personRepository.findById(id);
        Person person = new Person();
        if(personEntry.isPresent()){
            Person result = personEntry.get();
            person.setFirstName(result.getFirstName());
            person.setCity(result.getCity());
            person.setState(result.getState());
            return person.toString();
        }
        else{
            return null;
        }
    }
}
