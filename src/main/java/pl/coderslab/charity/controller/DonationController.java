package pl.coderslab.charity.controller;

import org.aspectj.asm.IModelFilter;
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

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.List;

@Controller
public class DonationController {

    DonationRepository donationRepository;
    InstitutionRepository institutionRepository;
    CategoryRepository categoryRepository;
    HttpSession session;

    public DonationController(DonationRepository donationRepository, InstitutionRepository institutionRepository, CategoryRepository categoryRepository, HttpSession session) {
        this.donationRepository = donationRepository;
        this.institutionRepository = institutionRepository;
        this.categoryRepository = categoryRepository;
        this.session = session;
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
    public String saveForm(@ModelAttribute Donation donation, HttpSession session, Model model) {
//        if (result.hasErrors()) {
//            return "form";
//        }
        donation.setInstitution(institutionRepository.findById(donation.getInstitution().getId()).get());
        session.setAttribute("donation", donation);


        //donationRepository.save(donation);
        return "redirect:form-confirmation";
    }

    @RequestMapping("/submit")
    public String submitForm(HttpSession session){
        Donation donation = (Donation) session.getAttribute("donation");

        donationRepository.save(donation);
        session.removeAttribute("donation");
        return "redirect:/";
    }


    @RequestMapping("/form-confirmation")
    public String confirmation(HttpSession session){
        session.getAttribute("donation");

        return "form-confirmation";
    }

//    @ModelAttribute("donation")
//    public Donation donation(HttpSession session){
//        return (Donation) session.getAttribute("donation");
//
//    }


    @ModelAttribute("institutions")
    public List<Institution> institutionsList(){
        return institutionRepository.findAll();
    }

    @ModelAttribute("categories")
    public List<Category> categoriesList(){
        return categoryRepository.findAll();
    }



}
