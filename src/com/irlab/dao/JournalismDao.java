package com.irlab.dao;

import java.util.List;

import com.irlab.entity.Journalism;
import com.irlab.entity.Paging;

/**
 * @author  fangrongfu
 * @version 1.0
 * @time    2017年8月21日下午10:09:54
 */
public interface JournalismDao {
	public List<Journalism> selectJournalismDao(Paging paging);    //通过标题、内容、时间查询新闻
	public int selectCountJournalismDao(Paging paging);            //通过标题、内容、时间查询新闻的条数
	public List<Journalism> selectAllJournalismDao(Paging paging); //查询新闻所有新闻，并按照时间排序
	public int selectAllCountJournalismDao(Paging paging);         //查询所有新闻的条数
}
