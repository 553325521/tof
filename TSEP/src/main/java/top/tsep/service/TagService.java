package top.tsep.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;
import top.tsep.pojo.TagEntity;
import top.tsep.utils.ResultMap;

public interface TagService {
	
	public ResultMap add(TagEntity tag,HttpServletRequest request);
	
	List<TagEntity> list(Map<String, Object> map);
	
	int count(Map<String, Object> map);
	
	public ResultMap delete(TagEntity t);

	List<String>  findTagNameByList(@Param("tagId") String tagId);
}
