package com.study.restapi.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;
@Repository
@Mapper
public interface MemberMapper {

    /**
     * 멤버 목록 조회
     * @return
     */
    List<Map<String, Object>> selMemberList();

    /**
     * 멤버 등록
     * @param paramMap 등록 정보
     * @return 등록 결과
     */
    int rgstMember(Map<String, Object> paramMap);

    /**
     * 멤버 정보 조회
     * @param paramMap id
     * @return 멤버 정보
     */
    Map<String, Object> selMemberById(Map<String, Object> paramMap);

    /**
     * 멤버 수정
     * @param paramMap 수정 정보
     * @return 결과
     */
    int updtMember(Map<String, Object> paramMap);

    /**
     * 멤버 삭제
     * @param paramMap id
     * @return 삭제 결과
     */
    int delMember(Map<String, Object> paramMap);

}
