package kr.ed.haebeop.service;

import kr.ed.haebeop.domain.Course;
import kr.ed.haebeop.domain.Enroll;
import kr.ed.haebeop.domain.User;
import kr.ed.haebeop.util.Page;

import java.util.List;

public interface CourseService {
    public List<Course> getCourseList(Page page) throws Exception;

    public List<Course> getCoursesASC(Page page) throws Exception;

    public List<Course> getCoursesDESC(Page page) throws Exception;

    public List<Course> courseList() throws Exception;

    public List<Course> getUnfinishedCourses(Page page) throws Exception;

    public List<Course> unfinishedCourses() throws Exception;

    public List<Course> getNotFullCourses(Page page) throws Exception;

    public List<Course> notFullCourses() throws Exception;

    public List<Course> getNewCourses() throws Exception;

    public Course getCourse(int cno) throws Exception;

    public void insertCourse(Course course) throws Exception;

    public void updateCourse(Course course) throws Exception;

    public void deleteCourse(int cno) throws Exception;

    public void editCourse(int cno) throws Exception;

    public int countCourse(Page page) throws Exception;

    public void insertEnroll(Enroll enroll);

    public void updateStudentNum(int cno);

    public List<Enroll> getEnrollList(Enroll enroll);

    public void complete(int eno);

    public User getUserName(String id);

    public Enroll isEnroll(Enroll enroll);

    public List<Enroll> enrollList(Page page);

    public void enrollDelete(int eno);

    public int countEnroll(Page page);

    public void updateUserPt(User user);

    public void rollbackStudentNum(int cno);

    public void cancel(int eno);

    public List<Enroll> cancelList(Page page);

    public int countCancel(Page page);
}
