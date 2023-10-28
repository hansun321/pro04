package kr.ed.haebeop.controller;

import kr.ed.haebeop.domain.User;
import kr.ed.haebeop.service.UserService;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.util.List;

@Controller
@RequestMapping("/user/")
public class UserController {
    private static final Logger logger = LoggerFactory.getLogger(UserController.class);

    @Autowired
    private UserService userService;

    BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();

    @Autowired
    HttpSession session;

    @RequestMapping(value = "getUser", method = RequestMethod.GET)
    public String getUser(Model model, HttpServletRequest request) throws Exception {
//      String id = (String) request.getParameter("sid"); 테스트용
        String id = (String) session.getAttribute("sid");
        User user = userService.getUser(id);
        model.addAttribute("user", user);
        return  "/user/getUser";
    }

    @RequestMapping(value = "agree", method = RequestMethod.GET)
    public String getAgree(Model model) throws Exception {
        return "/user/agree";
    }

    @RequestMapping(value = "join", method = RequestMethod.GET)
    public String userJoin(Model model) throws Exception {
        return "user/join";
    }

    @RequestMapping(value = "idCheck", method = RequestMethod.POST)
    public void idCheck(HttpServletResponse response, HttpServletRequest request, Model model) throws Exception {
        String id = request.getParameter("id");
        boolean result = false;
        User dto = new User();
        dto = userService.getUser(id);
        if(dto!=null) {
            result = false;
        } else {
            result = true;
        }
        JSONObject json = new JSONObject();
        json.put("result", result);
        PrintWriter out = response.getWriter();
        out.println(json.toString());
    }

    @RequestMapping(value = "insert",method = RequestMethod.POST)
    public String userWrite(User user, Model model) throws Exception {
        //비밀번호 암호화
        String userpw = user.getPw();
        String pwd = passwordEncoder.encode(userpw);
        user.setPw(pwd);
        userService.userInsert(user);;
        return "user/loginForm";
    }

    @RequestMapping(value = "loginForm", method = RequestMethod.GET)
    public String loginForm(Model model) throws Exception {
        return "user/loginForm";
    }

    @RequestMapping(value = "login", method = RequestMethod.POST)
    public String userLogin(User mdto, HttpServletRequest req, RedirectAttributes rttr) throws Exception {
        boolean loginSuccess = userService.logIn(req);
        if(loginSuccess) {
            return "redirect:/";
        } else {
            return "redirect:loginForm";
        }
    }

    @RequestMapping(value = "logout.do", method = RequestMethod.GET)
    public String memberLogout(HttpSession session) throws Exception {
        session.invalidate();
        return "redirect:/";
    }

    @RequestMapping(value="update.do", method = RequestMethod.POST)
    public String userUpdate(User user, Model model) throws Exception {
        String pwd = "";
        if(user.getPw().length()<=16) {
            pwd = passwordEncoder.encode(user.getPw());
            user.setPw(pwd);
        }
        userService.userUpdate(user);
        return "redirect:/";
    }

    @RequestMapping(value = "userDelete.do", method = RequestMethod.GET)
    public String userDelete(@RequestParam String id, Model model, HttpSession session) throws Exception {
        userService.userDelete(id);
        session.invalidate();
        return "redirect:/";
    }
}
