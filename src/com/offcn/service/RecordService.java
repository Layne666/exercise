package com.offcn.service;

import java.util.List;

import com.offcn.pojo.Record;

public interface RecordService {
	List<Record> getRecordPager(Integer tid,int pageNO, int size);
	
	int getCount();
	
	int deleteByPrimaryKey(Integer id);//删除
	int multiDelete(int[] ids);
	
	int insert(Record record);
	
	Record selectByPrimaryKey(Integer id);
	
}
