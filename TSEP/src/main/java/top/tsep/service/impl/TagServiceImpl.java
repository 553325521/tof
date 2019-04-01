package top.tsep.service.impl;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import top.tsep.dao.TagDao;
import top.tsep.pojo.TagEntity;
import top.tsep.pojo.UserEntity;
import top.tsep.service.TagService;
import top.tsep.utils.CheckLoginStatus;
import top.tsep.utils.ResultMap;

@Service("tagService")
public class TagServiceImpl implements TagService {

	@Autowired
	private TagDao tagDao;
	
	@Override
	public ResultMap add(TagEntity tag, HttpServletRequest request) {
		ResultMap r = new ResultMap();
		CheckLoginStatus checkLoginStatus = new CheckLoginStatus(request);
		UserEntity currentUser = checkLoginStatus.getUsers();
		String subjectId = currentUser.getAttribute2();
		tag.setSubjectId(Integer.parseInt(subjectId));
		int result = tagDao.insertSelective(tag);
		if(result > 0 ){
			r.setResultType("0000");
			r.setResultContent("添加成功");
		}else{
			r.setResultType("1111");
			r.setResultContent("添加失败!!!");
		}
		
		return r;
	}

	@Override
	public List<TagEntity> list(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return tagDao.selectListBySubjectId(map);
	}

	@Override
	public int count(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return tagDao.selectListCount(map);
	}

	@Override
	public ResultMap delete(TagEntity t) {
		ResultMap r = new ResultMap();
		int result = tagDao.deleteByPrimaryKey(t.getId());
		if(result > 0){
			r.setResultType("0000");
			r.setResultContent("删除成功");
		}else{
			r.setResultType("9999");
			r.setResultContent("删除失败");
		}
		return r;
	}


	public List<String>  findTagNameByList(@Param("tagId") String tagId){
		return tagDao.findTagNameByList(tagId);
	}
	
}
