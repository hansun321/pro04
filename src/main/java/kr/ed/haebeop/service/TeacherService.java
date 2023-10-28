package kr.ed.haebeop.service;

import kr.ed.haebeop.domain.Teacher;
import kr.ed.haebeop.util.Page;

import java.util.List;

public interface TeacherService {
    public List<Teacher> getTeacherList(Page page);

    public List<Teacher> teacherList();

    public Teacher getTeacher(int tno);

    public int countTeacher(Page page);

    public void insertTeacher(Teacher teacher);
    public void teacherDelete(int tno);

}
