package com.irlab.dao;

import java.util.List;
import com.irlab.entity.Notice;
import com.irlab.entity.Paging;

/**
 * @author   fangrongfu
 * @version  1.0
 * @Date     2017年8月11日上午11:14:28
 */
public interface NoticeDao {
	public List<Notice> selectNoticeDao(Paging paging);	//搜索功能
	public int selectCountNoticeDao(Paging paging);  //查询根据公司名称、股票代码、公告类型的总条数
	public List<Notice> selectAllNoticeDao(Paging paging);  //查询所有的公告信息
	public int selectCountAllNoticeDao(Paging paging);  //查询所有的公告的记录数
	public List<Notice> selectDetailNoticeDao(Paging paging);  //查询季度公告信息
	public int selectCountDetailNoticeDao(Paging paging);  //查询季度公告的记录数
}
