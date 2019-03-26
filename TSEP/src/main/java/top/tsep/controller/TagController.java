package top.tsep.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import top.tsep.pojo.TagEntity;
import top.tsep.pojo.UserEntity;
import top.tsep.service.TagService;
import top.tsep.utils.CheckLoginStatus;
import top.tsep.utils.PageUtils;
import top.tsep.utils.Query;
import top.tsep.utils.ResultMap;

@Controller
@RequestMapping("/tag")
public class TagController {

	@Autowired
	private TagService tagService;

	@RequestMapping(value = "add", method = RequestMethod.POST)
	@ResponseBody
	public ResultMap add(TagEntity t, HttpServletRequest request) {
		return tagService.add(t, request);
	}
	
	@RequestMapping(value = "list", method = RequestMethod.POST)
	@ResponseBody
	public PageUtils list(@RequestBody Map<String, Object> params,HttpServletRequest request) {
		//查询列表数据
		CheckLoginStatus checkLoginStatus = new CheckLoginStatus(request);
		UserEntity user =  checkLoginStatus.getUsers();
		params.put("subjectId", user.getAttribute2());
        Query query = new Query(params);
		List<TagEntity> mcPositionList = tagService.list(query);
		int total = tagService.count(query);
		PageUtils pageUtils = new PageUtils(mcPositionList, total);
		return pageUtils;
	}
	
	@RequestMapping(value = "delete", method = RequestMethod.POST)
	@ResponseBody
	public ResultMap delete(TagEntity t) {
		return tagService.delete(t);
	}
}
