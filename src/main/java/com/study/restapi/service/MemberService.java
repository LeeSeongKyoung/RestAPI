package com.study.restapi.service;

import com.study.restapi.mapper.MemberMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import javax.websocket.OnClose;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class MemberService {
    private final MemberMapper memberMapper;

    /**
     * 멤버 목록 조회
     * @return 멤버 리스트
     */
    public List<Map<String, Object>> selMemberList() {
        return memberMapper.selMemberList();
    }

    /**
     * 멤버 등록
     * @param paramMap 등록 정보
     * @return 등록 결과
     */
    public Map<String, Object> rgstMember(Map<String, Object> paramMap) {
        Map<String, Object> retMap = new HashMap<>();
        int result = 0;
        result = memberMapper.rgstMember(paramMap);
        if (result > 0) {
            retMap.put("result", true);
        } else {
            retMap.put("result", false);
        }
        return retMap;
    }

    /**
     * 멤버 정보 조회
     * @param paramMap id
     * @return 멤버 정보
     */
    public Map<String, Object> selMemberById(Map<String, Object> paramMap) {
        return memberMapper.selMemberById(paramMap);
    }

    /**
     * 멤버 수정
     * @param paramMap 수정된 정보
     * @return 수정 결과
     */
    public Map<String, Object> updtMember(Map<String, Object> paramMap) {
        Map<String, Object> retMap = new HashMap<>();
        int result = 0;
        result = memberMapper.updtMember(paramMap);
        if (result > 0) {
            retMap.put("result", true);
        } else {
            retMap.put("result", false);
        }

        return retMap;
    }

    /**
     * 멤버 삭제
     * @param paramMap id
     * @return 삭제 결과
     */
    public Map<String, Object> delMember(Map<String, Object> paramMap) {
        Map<String, Object> retMap = new HashMap<>();
        int result = 0;
        result = memberMapper.delMember(paramMap);
        if (result > 0) {
            retMap.put("result", true);
        } else {
            retMap.put("result", false);
        }

        return retMap;
    }
}
