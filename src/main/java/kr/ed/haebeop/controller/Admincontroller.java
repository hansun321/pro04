package kr.ed.haebeop.controller;

import kr.ed.haebeop.domain.FileVO;
import kr.ed.haebeop.domain.User;
import kr.ed.haebeop.domain.*;
import kr.ed.haebeop.persistence.UserMapper;
import kr.ed.haebeop.service.FileService;
import kr.ed.haebeop.service.UserService;
import kr.ed.haebeop.util.Page;
import kr.ed.haebeop.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.List;

@Controller
@RequestMapping("/admin/")
public class Admincontroller {
    @Autowired
    private UserService userService;

    @Autowired
    private FileService fileService;

    @Autowired
    private TeacherService teacherService;

    BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();

    @RequestMapping(value = "", method = RequestMethod.GET)
    public String adminPage(Model model) throws Exception {
        Page page = new Page();
        int totUser = userService.userCount(page);
        model.addAttribute("totUser", totUser);
        return "/admin/userList";
    }

    @RequestMapping(value = "userList.do", method = RequestMethod.GET)
    public String userList(HttpServletRequest request, Model model) throws Exception {
        String type = request.getParameter("type");
        String keyword = request.getParameter("keyword");
        int curPage = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;

        Page page = new Page();
        page.setSearchType(type);
        page.setSearchKeyword(keyword);
        int total = userService.userCount(page);

        page.makeBlock(curPage, total);
        page.makeLastPageNum(total);
        page.makePostStart(curPage, total);

        model.addAttribute("type", type);
        model.addAttribute("keyword", keyword);
        model.addAttribute("page", page);
        model.addAttribute("curpage", curPage);

        List<User> userList = userService.userList(page);
        model.addAttribute("userList", userList);

        System.out.println("curPage : " + curPage);
        System.out.println("page.getpageCount : " + page.getPageCount());

        return "/admin/userList";
    }

    @RequestMapping(value = "userDelete.do", method = RequestMethod.GET)
    public String userDelete(@RequestParam String id, Model model, HttpSession session) throws Exception {
        userService.userDelete(id);
        session.invalidate();
        return "redirect:/admin/userList.do";
    }

    @RequestMapping(value = "aGetUser", method = RequestMethod.GET)
    public String aGetUser(Model model, HttpServletRequest request) throws Exception {
        String id = request.getParameter("id");
        User user = userService.getUser(id);
        model.addAttribute("user", user);
        return "/admin/editUser";
    }

    @RequestMapping(value = "userUpdate.do", method = RequestMethod.POST)
    public String userUpdate(User user, Model model) throws Exception {
        String pwd = "";
        if (user.getPw().length() <= 16) {
            pwd = passwordEncoder.encode(user.getPw());
            user.setPw(pwd);
        }
        userService.userUpdate(user);
        return "redirect:/admin/userList.do";
    }

    // 공지사항 관리자 페이지 연결
    @Autowired
    private NoticeService noticeService;

    @RequestMapping(value = "notice/list.do", method = RequestMethod.GET)
    public String getNoticeList(HttpServletRequest request, Model model) throws Exception {
        String type = request.getParameter("type");
        String keyword = request.getParameter("keyword");
        int curPage = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;

        Page page = new Page();
        page.setSearchType(type);
        page.setSearchKeyword(keyword);
        int total = noticeService.totalCount(page);

        page.makeBlock(curPage, total);
        page.makeLastPageNum(total);
        page.makePostStart(curPage, total);

        model.addAttribute("type", type);
        model.addAttribute("keyword", keyword);
        model.addAttribute("page", page);
        model.addAttribute("curPage", curPage);

        List<Notice> noticeList = noticeService.noticeList(page);
        model.addAttribute("noticeList", noticeList);

        return "admin/notice/noticeList";
    }


    // 후기 관리자 페이지 연결
    @Autowired
    private ReviewService reviewService;

    @RequestMapping(value = "review/list.do", method = RequestMethod.GET)
    public String getReviewList(HttpServletRequest request, Model model) throws Exception {
        String type = request.getParameter("type");
        String keyword = request.getParameter("keyword");
        int curPage = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;

        Page page = new Page();
        page.setSearchType(type);
        page.setSearchKeyword(keyword);
        int total = reviewService.totalCount(page);

        page.makeBlock(curPage, total);
        page.makeLastPageNum(total);
        page.makePostStart(curPage, total);

        model.addAttribute("type", type);
        model.addAttribute("keyword", keyword);
        model.addAttribute("page", page);
        model.addAttribute("curPage", curPage);

        List<Review> reviewList = reviewService.reviewList(page);
        model.addAttribute("reviewList", reviewList);

        return "admin/review/reviewList";
    }

    // 시범 강의 관리자 페이지 연결
    @Autowired
    private VideoService videoService;

    @RequestMapping(value = "video/list.do", method = RequestMethod.GET)
    public String getVideoList(HttpServletRequest request, Model model) throws Exception {
        String type = request.getParameter("type");
        String keyword = request.getParameter("keyword");
        int curPage = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;

        Page page = new Page();
        page.setSearchType(type);
        page.setSearchKeyword(keyword);
        int total = videoService.totalCount(page);

        page.makeBlock(curPage, total);
        page.makeLastPageNum(total);
        page.makePostStart(curPage, total);

        model.addAttribute("type", type);
        model.addAttribute("keyword", keyword);
        model.addAttribute("page", page);
        model.addAttribute("curPage", curPage);

        List<Video> videoList = videoService.videoList(page);
        model.addAttribute("videoList", videoList);

        return "admin/video/videoList";
    }

    //수강생 관리
    @Autowired
    private CourseService courseService;

    //관리자페이지 수강 관리
    @RequestMapping(value = "enrollList", method = RequestMethod.GET)
    public String adminEnroll(HttpServletRequest request, Model model) {
        String type = request.getParameter("type");
        String keyword = request.getParameter("keyword");
        int curPage = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;

        Page page = new Page();
        page.setSearchType(type);
        page.setSearchKeyword(keyword);
        int total = courseService.countEnroll(page);

        page.makeBlock(curPage, total);
        page.makeLastPageNum(total);
        page.makePostStart(curPage, total);

        model.addAttribute("type", type);
        model.addAttribute("keyword", keyword);
        model.addAttribute("page", page);
        model.addAttribute("curPage", curPage);

        List<Enroll> enrollList = courseService.enrollList(page);
        model.addAttribute("enrollList", enrollList);

        return "/admin/EnrollList";
    }

    //수강생 삭제
    @RequestMapping(value = "enrollDelete", method = RequestMethod.GET)
    @Transactional
    public String enrollDelete(@RequestParam int eno, @RequestParam int cno) throws Exception {
        courseService.enrollDelete(eno);
        courseService.rollbackStudentNum(cno);
        return "redirect:/admin/enrollList";
    }

    //관리자페이지 철회 관리
    @RequestMapping(value = "cancelList", method = RequestMethod.GET)
    public String adminCancel(HttpServletRequest request, Model model) {
        String type = request.getParameter("type");
        String keyword = request.getParameter("keyword");
        int curPage = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;

        Page page = new Page();
        page.setSearchType(type);
        page.setSearchKeyword(keyword);
        int total = courseService.countCancel(page);

        page.makeBlock(curPage, total);
        page.makeLastPageNum(total);
        page.makePostStart(curPage, total);

        model.addAttribute("type", type);
        model.addAttribute("keyword", keyword);
        model.addAttribute("page", page);
        model.addAttribute("curPage", curPage);

        List<Enroll> cancelList = courseService.cancelList(page);
        model.addAttribute("cancelList", cancelList);

        return "/admin/cancelList";
    }

    //철회 신청 삭제(철회 수락)
    @RequestMapping(value = "cancelDelete", method = RequestMethod.GET)
    @Transactional
    public String cancelDelete(@RequestParam int eno, @RequestParam int cno, @RequestParam String id, @RequestParam int enroll_price, @RequestParam int pt) throws Exception {
        courseService.enrollDelete(eno);
        courseService.rollbackStudentNum(cno);
        User user = new User();
        user.setId(id);
        user.setPt(pt + enroll_price);
        courseService.updateUserPt(user);
        return "redirect:/admin/cancelList";
    }

    @GetMapping("courseList")
    public String getCourseList(HttpServletRequest request, Model model) throws Exception {
        String type = request.getParameter("type");
        String keyword = request.getParameter("keyword");
        int curPage = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;

        Page page = new Page();
        page.setSearchType(type);
        page.setSearchKeyword(keyword);
        int total = courseService.countCourse(page);

        page.makeBlock(curPage, total);
        page.makeLastPageNum(total);
        page.makePostStart(curPage, total);

        model.addAttribute("type", type);
        model.addAttribute("keyword", keyword);
        model.addAttribute("page", page);
        model.addAttribute("curPage", curPage);

        List<Course> courseList = courseService.getCourseList(page);
        model.addAttribute("courseList", courseList);
        return "admin/courseList";
    }

    @GetMapping("courseDelete")
    public String deleteCourse(HttpServletRequest request, Model model) throws Exception {
        int cno = Integer.parseInt(request.getParameter("cno"));
        courseService.deleteCourse(cno);
        return "redirect:/admin/courseList";
    }

    // 관리자 파일 처리 시스템
    @RequestMapping(value = "fileList.do", method = RequestMethod.GET)
    public String getFileList(HttpServletRequest request, Model model) throws Exception {
        String type = request.getParameter("type");
        String keyword = request.getParameter("keyword");
        int curPage = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;

        Page page = new Page();
        page.setSearchType(type);
        page.setSearchKeyword(keyword);
        int total = fileService.totalCount(page);

        page.makeBlock(curPage, total);
        page.makeLastPageNum(total);
        page.makePostStart(curPage, total);

        model.addAttribute("type", type);
        model.addAttribute("keyword", keyword);
        model.addAttribute("page", page);
        model.addAttribute("curPage", curPage);


        List<FileVO> fileboardList = fileService.getFileList(page);
        model.addAttribute("fileboardList", fileboardList);
        return "/admin/file/fileList";
    }

    @GetMapping("getFileboard.do")
    public String getFileboard(@RequestParam int postNo, Model model) throws Exception {
        FileVO fileboard = fileService.getFilebord(postNo);
        model.addAttribute("fileboard", fileboard);
        return "/admin/file/getFileboard";
    }

    @GetMapping("removeFileboard.do")
    public String removeFileboard(@RequestParam int postNo, HttpServletRequest req) throws Exception {

        //실제 파일 삭제 로직
        //파일 경로 지정
        String path = req.getRealPath("/resources/upload");
        List<FileDTO> fileList = fileService.getFileGroupList(postNo);
        for (FileDTO fileobj : fileList) {
            File file = new File(path + "/" + fileobj.getOriginFile());
            if (file.exists()) { // 해당 파일이 존재하면
                file.delete(); // 파일 삭제
            }
        }
        //데이터베이스의 파일 자료실과 파일의 내용 삭제
        fileService.removeFileboard(postNo);
        return "redirect:/admin/fileList.do";
    }

    @PostMapping("fileRemove.do")
    public String fileRemove(HttpServletRequest request, Model model) throws Exception {
        int no = Integer.parseInt(request.getParameter("no"));
        int postNo = Integer.parseInt(request.getParameter("postNo"));
        String path = request.getRealPath("/resources/upload");
        FileDTO fileobj = fileService.getFile(no);
        File file = new File(path + "/" + fileobj.getOriginFile());
        if (file.exists()) { // 해당 파일이 존재하면
            file.delete(); // 파일 삭제
        }
        return "/file/getFileboard.do?postNo=" + postNo;
    }

    @GetMapping("teacherList")
    public String getTeacherList(HttpServletRequest request, Model model) throws Exception {
        String type = request.getParameter("type");
        String keyword = request.getParameter("keyword");
        int curPage = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;

        Page page = new Page();
        page.setSearchType(type);
        page.setSearchKeyword(keyword);
        int total = teacherService.countTeacher(page);

        page.makeBlock(curPage, total);
        page.makeLastPageNum(total);
        page.makePostStart(curPage, total);

        model.addAttribute("type", type);
        model.addAttribute("keyword", keyword);
        model.addAttribute("page", page);
        model.addAttribute("curPage", curPage);

        List<Teacher> teacherList = teacherService.getTeacherList(page);
        model.addAttribute("teacherList", teacherList);
        return "admin/teacherList";
    }

    @GetMapping("teacherDelete")
    public String deleteTeacher(HttpServletRequest request, Model model) throws Exception {
        int tno = Integer.parseInt(request.getParameter("tno"));
        teacherService.teacherDelete(tno);
        return "redirect:/admin/teacherList";
    }

    @PostMapping("insertTeacher")
    public String insertTeacher(HttpServletRequest request, Model model) throws Exception {
        Teacher teacher = new Teacher();
        teacher.setTeacher_name(request.getParameter("teacher_name"));
        teacher.setTel(request.getParameter("tel"));
        teacher.setEmail(request.getParameter("email"));
        teacherService.insertTeacher(teacher);
        return "redirect:/admin/teacherList";
    }
}