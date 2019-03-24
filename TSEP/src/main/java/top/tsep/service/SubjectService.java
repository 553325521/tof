package top.tsep.service;

import org.springframework.stereotype.Service;
import top.tsep.pojo.SubjectEntity;

@Service
public interface SubjectService {

    SubjectEntity selectByName(String subject_name);
}
