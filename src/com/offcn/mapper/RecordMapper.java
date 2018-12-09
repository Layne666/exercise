package com.offcn.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.offcn.pojo.Record;

public interface RecordMapper {
    int deleteByPrimaryKey(Integer id);
    
    int insert(Record record);

    Record selectByPrimaryKey(Integer id);
    
    List<Record> getRecordPager(@Param("kssj") String kssj,@Param("jssj") String jssj,@Param("tid") Integer tid,@Param("skip") int skip,@Param("size") int size);
    
    int getCount(@Param("kssj") String kssj,@Param("jssj") String jssj,@Param("tid") Integer tid);
    
    double getTotalKsze(@Param("kssj") String kssj,@Param("jssj") String jssj,@Param("tid") Integer tid,@Param("id") Integer id);
    
    /*List<Integer> getStuIds(@Param("kssj") String kssj,@Param("jssj") String jssj,@Param("tid") Integer tid);*/
}