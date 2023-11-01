package kr.ed.haebeop.persistence;

import kr.ed.haebeop.domain.Course;
import kr.ed.haebeop.domain.Enroll;
import kr.ed.haebeop.domain.User;
import kr.ed.haebeop.util.Page;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface CourseMapper {
    public List<Course> getCourseList(Page page);

    public List<Course> getCoursesASC(Page page);

    public List<Course> getCoursesDESC(Page page);

    public List<Course> courseList();

    public List<Course> getUnfinishedCourses(Page page);

    public List<Course> unfinishedCourses();

    public List<Course> getNotFullCourses(Page page);

    public List<Course> notFullCourses();

    public List<Course> newCourses();

    public Course getCourse(int cno);

    public void insertCourse(Course course);

    public void editCourse(Course course);

    public void deleteCourse(int cno);

    public int countCourse(Page page);

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
