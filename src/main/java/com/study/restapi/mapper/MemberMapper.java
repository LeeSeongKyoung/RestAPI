package com.study.restapi.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;
@Repository
@Mapper
public interface MemberMapper {
    List<Map<String, Object>> selMemberList();

    /**
     * 멤버 삭제
     * @param paramMap
     * @return
     */
    int delMember(Map<String, Object> paramMap);
}
