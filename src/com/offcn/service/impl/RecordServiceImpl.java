package com.offcn.service.impl;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.offcn.mapper.RecordMapper;
import com.offcn.pojo.Record;
import com.offcn.service.RecordService;

@Service
public class RecordServiceImpl implements RecordService {

	@Resource
	RecordMapper recordMapper;
	
	@Override
	public List<Record> getRecordPager(String kssj,String jssj,Integer tid,int pageNO, int size) {
		// TODO Auto-generated method stub
		int skip=(pageNO-1)*size;
		return recordMapper.getRecordPager(kssj, jssj, tid,skip, size);
	}

	@Override
	public int getCount(String kssj,String jssj,Integer tid) {
		// TODO Auto-generated method stub
		return recordMapper.getCount(kssj,jssj,tid);
	}

	@Override
	public int deleteByPrimaryKey(Integer id) {
		// TODO Auto-generated method stub
		return recordMapper.deleteByPrimaryKey(id);
	}


	@Override
	public int insert(Record record) {
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String ksrq = df.format(new Date());
		record.setKsrq(ksrq);
		return recordMapper.insert(record);
	}

	@Override
	public Record selectByPrimaryKey(Integer id) {
		// TODO Auto-generated method stub
		return recordMapper.selectByPrimaryKey(id);
	}

	@Override
	public int multiDelete(int[] ids) {
		// TODO Auto-generated method stub
		int rows=0;
		for(int id:ids){
			rows+=deleteByPrimaryKey(id);
		}
		return rows;
	}

	@Override
	public double getTotalKsze(String kssj,String jssj,Integer tid,Integer id) {
		return recordMapper.getTotalKsze(kssj,jssj,tid,id);
	}

	/*@Override
	public List<Integer> getStuIds(String kssj, String jssj, Integer tid) {
		return recordMapper.getStuIds(kssj, jssj, tid);
	}*/
}
