package com.study.restapi.service;

import com.study.restapi.mapper.MemberMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class MemberService {
    private final MemberMapper memberMapper;

    public List<Map<String, Object>> selMemberList() {
        return memberMapper.selMemberList();
    }

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
