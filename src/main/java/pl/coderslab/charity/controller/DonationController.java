package pl.coderslab.charity.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import pl.coderslab.charity.model.Category;
import pl.coderslab.charity.model.Donation;
import pl.coderslab.charity.model.Institution;
import pl.coderslab.charity.repository.CategoryRepository;
import pl.coderslab.charity.repository.DonationRepository;
import pl.coderslab.charity.repository.InstitutionRepository;

import javax.validation.Valid;
import java.util.List;

@Controller
public class DonationController {

    DonationRepository donationRepository;
    InstitutionRepository institutionRepository;
    CategoryRepository categoryRepository;

    public DonationController(DonationRepository donationRepository, InstitutionRepository institutionRepository, CategoryRepository categoryRepository) {
        this.donationRepository = donationRepository;
        this.institutionRepository = institutionRepository;
        this.categoryRepository = categoryRepository;
    }

//    @RequestMapping(path = "/form", method = RequestMethod.GET)
//    public String showForm(@RequestParam(required = false) Long id, Model model) {
//        Donation donation = id == null ? new Donation() : donationRepository.findById(id).get();
//        model.addAttribute("donation", donation);
//
//        return "form";
//    }

    @RequestMapping(value = "/form", method = RequestMethod.GET)
    public String showForm(Model model) {
        model.addAttribute("donation", new Donation());
        return "form";
    }

    @RequestMapping(path = "/form", method = RequestMethod.POST)
    public String saveForm(@ModelAttribute Donation donation) {
//        if (result.hasErrors()) {
//            return "form";
//        }

        donationRepository.save(donation);
        return "redirect:form";
    }

    @ModelAttribute("institutions")
    public List<Institution> institutionsList(){
        return institutionRepository.findAll();
    }

    @ModelAttribute("categories")
    public List<Category> categoriesList(){
        return categoryRepository.findAll();
    }



}
