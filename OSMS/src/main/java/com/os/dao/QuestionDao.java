package com.os.dao;

import java.util.List;

import com.os.pojo.O_Question;
import com.os.utils.BootStrapTable;

public interface QuestionDao {
    int deleteByPrimaryKey(Integer qId);

    int insert(O_Question record);

    int insertSelective(O_Question record);

    O_Question selectByPrimaryKey(Integer qId);

    int updateByPrimaryKeySelective(O_Question record);

    int updateByPrimaryKey(O_Question record);

    int getTotalByType(BootStrapTable bst);

    int getTotal(BootStrapTable bst);

    int getTotalByUser(BootStrapTable bst);

    List<O_Question> getStudentQuestions(BootStrapTable bst);

    List<O_Question> getTeacherQuestions(BootStrapTable bst);

    List<O_Question> getQuestionsByUser(BootStrapTable bst);

}