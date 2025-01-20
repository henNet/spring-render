package com.example.spring_render

import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RestController

@RestController
class Controller {
  @GetMapping("/")
  fun entryPoint(): String{
    return "Deu certo!!";
  }
}