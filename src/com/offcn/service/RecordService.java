package com.offcn.service;

import java.util.List;

import com.offcn.pojo.Record;

public interface RecordService {
	List<Record> getRecordPager(String kssj,String jssj,Integer tid,int pageNO, int size);
	
	int getCount(String kssj,String jssj,Integer tid);
	
	int deleteByPrimaryKey(Integer id);//删除
	int multiDelete(int[] ids);
	
	int insert(Record record);
	double getTotalKsze(String kssj,String jssj,Integer tid,Integer id);
	
	/*List<Integer> getStuIds(String kssj,String jssj,Integer tid);*/
	
	Record selectByPrimaryKey(Integer id);
	
}
