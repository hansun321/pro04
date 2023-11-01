package kr.ed.haebeop.controller;

import kr.ed.haebeop.domain.Course;
import kr.ed.haebeop.service.CourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
public class HomeController {

    @Autowired
    private CourseService courseService;

    @GetMapping("/")
    public String index(Model model) throws Exception {
        List<Course> newCourseList = courseService.getNewCourses();
        model.addAttribute("newCourseList", newCourseList);
        return "/index";
    }

    @RequestMapping("contact")
    public String contact() throws Exception {
        return "/contact/map";
    }
}
