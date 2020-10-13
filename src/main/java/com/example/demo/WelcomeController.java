package com.example.demo;

import java.util.Map;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class WelcomeController {
    @RequestMapping("/")
    public String welcome(final Map<String, Object> model) {
        model.put("environment", System.getenv());
        return "welcome";
    }

}