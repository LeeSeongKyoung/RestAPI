package com.study.restapi.service.impl;

import com.study.restapi.service.MemberService;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

@Service
public class memberServiceImpl implements MemberService {
    @Override
    public Map<String, Object> getMemberData() {
        Map<String, Object> member = new HashMap<>();

        member.put("member1", "A");
        member.put("member2", "B");
        member.put("member3", "C");

        return member;
    }
}
