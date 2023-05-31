package com.example.springsecurityapplication.controllers;

import com.example.springsecurityapplication.models.Order;
import com.example.springsecurityapplication.models.Person;
import com.example.springsecurityapplication.repositories.CategoryRepository;
import com.example.springsecurityapplication.repositories.ProductRepository;
import com.example.springsecurityapplication.services.OrderService;
import com.example.springsecurityapplication.services.PersonService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/admin")
public class OrderController {
    private final OrderService orderService;

    private final PersonService personService;

    @Autowired
    public OrderController(OrderService orderService, CategoryRepository categoryRepository, ProductRepository productRepository, PersonService personService) {
        this.orderService = orderService;
        this.personService = personService;
    }

    @GetMapping("/order_list")
    public String orderIndex(Model model){
        model.addAttribute("orders", orderService.getAllOrder());
        return "order_list";
    }

    @GetMapping("/order_list/order_info/{id}")
    public String orderInfo(Model model, @PathVariable("id") int id){
        model.addAttribute("order", orderService.getOrderId(id));
        return "orderInfo";
    }

    @GetMapping("/order_list/order_info/order_edit/{id}")
    public String orderEdit(Model model, @PathVariable("id") int id){
        model.addAttribute("order", orderService.getOrderId(id));

        return "orderEdit";
    }

    @PostMapping("/order_list/order_info/order_edit/{id}")
    public String orderEdit(@ModelAttribute("order") Order order, @PathVariable("id") int id, Model model){
        orderService.orderEdit(id, order);
        return "redirect:/admin";
    }

    @GetMapping("/order_list/search")
    public String orderSearching(){
        return "search";
    }

    @PostMapping("/order_list/search")
    public String orderSearching(@RequestParam("search") String search, Model model){
        if(search.equals("numberEnd")){
            model.addAttribute("order", orderService.getOrderNumberEndingWith(search));
        }
        return "search";
    }
}
