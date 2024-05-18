package cz.czechitas.java2webapps.ukol5.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import jakarta.validation.Valid;
import org.springframework.validation.BindingResult;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.time.LocalDate;
import java.time.Period;


/**
 * Kontroler obsluhující registraci účastníků dětského tábora.
 */
@Controller
@RequestMapping("/")
public class RegistraceController {


  @GetMapping("")
  public ModelAndView formular() {
    ModelAndView modelAndView = new ModelAndView("/formular");
    modelAndView.addObject("form", new RegistraceForm());
    return modelAndView;
  }

  @PostMapping("")
  public Object form(@Valid @ModelAttribute("form") RegistraceForm form, BindingResult bindingResult) {
    if (bindingResult.hasErrors()) {
      return "/formular";
    }

    // validace roku narození
    try {
      int rok = Integer.parseInt(form.getDatumNarozeni());
      LocalDate datumNarozeni = LocalDate.of(rok, 1, 1); // Zde nastavujeme 1. ledna pro jednoduchost

      Period period = datumNarozeni.until(LocalDate.now());
      int vek = period.getYears();

      if (vek < 9 || vek > 15) {
        bindingResult.rejectValue("datumNarozeni", "error.datumNarozeni.invalidAgeRange", "Věk musí být mezi 9 a 15 lety (včetně).");
        return "/formular";
      }
    } catch (NumberFormatException e) {
      bindingResult.rejectValue("datumNarozeni", "error.datumNarozeni.invalidFormat", "Neplatný formát roku. Zadejte například 2010");
      return "/formular";
    }

    if (form.getJmeno() == null || form.getJmeno().isEmpty()) {
      bindingResult.rejectValue("jmeno", "error.jmeno.empty", "Jméno je povinné pole.");
      return "/formular";
    }

    return new ModelAndView("dokonceno")
            .addObject("email", form.getEmail());
  }

}