package top.tsep.dao;

import java.util.List;

import top.tsep.pojo.ChatEntity;

public interface ChatDao {
    int deleteByPrimaryKey(Integer id);

    int insert(ChatEntity record);

    int insertSelective(ChatEntity record);

    ChatEntity selectByPrimaryKey(Integer id);
    
    List<ChatEntity> loadMsgList(Integer subjectId);

    int updateByPrimaryKeySelective(ChatEntity record);

    int updateByPrimaryKey(ChatEntity record);
}