package kr.ed.haebeop.service;

import kr.ed.haebeop.domain.Comment;
import kr.ed.haebeop.persistence.CommentMapper;
import kr.ed.haebeop.persistence.ReviewMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class CommentServiceImpl implements CommentService {

    @Autowired
    private CommentMapper commentMapper;
    @Autowired
    private ReviewMapper reviewMapper;

    @Override
    public List<Comment> commentList(int par) throws Exception {
        return commentMapper.commentList(par);
    }

    @Transactional
    @Override
    public void commentInsert(Comment domain) throws Exception {
        reviewMapper.updateCommentCnt(domain.getPar(), 1);
        commentMapper.commentInsert(domain);
    }

    @Transactional
    @Override
    public void commentDelete(int dno) throws Exception {
        Comment comment = commentMapper.read(dno);
        reviewMapper.updateCommentCnt(comment.getPar(), -1);
        commentMapper.commentDelete(dno);
    }

    @Override
    public Comment read(int dno) throws Exception {
        return commentMapper.read(dno);
    }
}
