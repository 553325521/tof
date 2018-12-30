package com.os.service;

import javax.servlet.http.HttpServletRequest;

import com.os.pojo.O_Question;
import com.os.utils.BootStrapTable;
import com.os.utils.ResultMap;

public interface QuestionService {

    public ResultMap addStudentQuestion(HttpServletRequest request, O_Question o_Question);

    public ResultMap addTeacherQuestion(HttpServletRequest request, O_Question o_Question);

    public BootStrapTable getStudentQuestionData(BootStrapTable bst);

    public BootStrapTable getStudentQuestionByUser(BootStrapTable bst, HttpServletRequest request);

    public BootStrapTable getTeacherQuestionData(BootStrapTable bst);

    public void showAQuestion(HttpServletRequest request, int qId);

    public ResultMap confirmBestResult(int qId, int rId);

    public ResultMap deleteQuestionByUser(HttpServletRequest request, O_Question o_Question);
}
