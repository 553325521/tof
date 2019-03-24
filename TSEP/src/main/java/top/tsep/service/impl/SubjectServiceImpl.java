package top.tsep.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import top.tsep.dao.SubjectDao;
import top.tsep.pojo.SubjectEntity;
import top.tsep.service.SubjectService;

@Service("subjectService")
public class SubjectServiceImpl implements SubjectService {

    @Autowired
    private SubjectDao subjectDao;
    
    public SubjectEntity selectByName(String subject_name){
        return subjectDao.selectByName(subject_name);
    }
}
