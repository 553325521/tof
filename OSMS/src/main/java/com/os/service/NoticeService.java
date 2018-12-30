package com.os.service;

import javax.servlet.http.HttpServletRequest;

import com.os.pojo.O_Notice;
import com.os.utils.BootStrapTable;
import com.os.utils.ResultMap;

public interface NoticeService {

    public BootStrapTable getNoticeData(BootStrapTable bst);

    public BootStrapTable getLastNoticeData();

    public ResultMap addNotice(O_Notice n);

    public void showTeachInfoDetail(HttpServletRequest request, int nId);

    public ResultMap updateNotice(O_Notice n);

    public ResultMap deleteNotices(String ids);

}
