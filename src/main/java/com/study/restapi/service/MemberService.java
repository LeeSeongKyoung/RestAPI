package com.study.restapi.service;

import com.study.restapi.mapper.MemberMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class MemberService {
    private final MemberMapper memberMapper;

    public List<Map<String, Object>> selMemberList() {
        return memberMapper.selMemberList();
    }
}
