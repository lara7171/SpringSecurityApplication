package com.example.springsecurityapplication.controllers;


import com.example.springsecurityapplication.models.Person;
import com.example.springsecurityapplication.services.PersonService;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/admin")
public class PersonController {

    private final PersonService personService;

    @Autowired
    public PersonController(PersonService personService) {
        this.personService = personService;
    }

    @GetMapping("/person_list")
    public String personIndex(Model model){
        model.addAttribute("persons", personService.getAllPerson());
        return "person_list";
    }

    @GetMapping("/person_list/person_info/{id}")
    public String personInfo(Model model, @PathVariable("id") int id){
        model.addAttribute("person", personService.getPersonId(id));
        return "personInfo";
    }

    @GetMapping("/person_list/person_info/person_edit/{id}")
    public String personEdit(Model model, @PathVariable("id") int id){
        model.addAttribute("person", personService.getPersonId(id));
        return "personEdit";
    }

    @PostMapping("/person_list/person_info/person_edit/{id}")
    public String personEdit(@ModelAttribute("person") @Valid Person person, BindingResult bindingResult, @PathVariable("id") int id){
        if(bindingResult.hasErrors()){
            return "personEdit";
        }
        personService.personEdit(id, person);
        return  "redirect:/admin";
    }
}
