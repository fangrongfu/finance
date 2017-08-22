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
	public List<Journalism> selectJournalismDao(Paging paging);
	public int selectCountJournalismDao(Paging paging);
}
