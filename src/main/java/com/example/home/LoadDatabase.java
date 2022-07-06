package com.example.home;

import com.example.home.DAO.PersonRepository;
import com.example.home.Model.Person;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.CommandLineRunner;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

//Test REST

@Configuration
public class LoadDatabase {
    private static final Logger log = LoggerFactory.getLogger(LoadDatabase.class);

    @Bean
    CommandLineRunner initDatabase(PersonRepository personRepository){
        return args -> {
            log.info("Preloading " + personRepository.save(new Person("Stacey", "Silver Spring", "Maryland")));
            log.info("Preloading " + personRepository.save(new Person("Trisha", "Huatulco", "Oaxaca")));
        };
    }
}
