package kr.ed.haebeop.persistence;

import kr.ed.haebeop.domain.User;
import kr.ed.haebeop.util.Page;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface UserMapper {
    public List<User> userList(Page page);
    public int userCount(Page page);
    public User getUser(String id);
    public User signIn(User mdto);
    public User loginCheck(User mdto);
    public User logIn(User mdto);
    public void userInsert(User mdto);
    public void userUpdate(User mdto);
    public void userDelete(String id);
}
