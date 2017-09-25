package com.irlab.service.impl;

import java.util.Map;
import com.irlab.entity.Paging;

/**
 * @author   fangrongfu
 * @version  1.0
 * @Date     2017年8月11日上午11:20:14
 */
public interface NoticeService {
	public Map<String,Object> selectNoticeService(Paging paging);	//检索的业务处理接口
	public Map<String, Object> selectAllNoticeService(Paging paging);  //查询所有公告信息的业务处理接口
	public Map<String,Object> selectDetailNoticeService(Paging paging);	//查询季度报告业务处理接口
}
