package com.study.restapi.controller;

import com.study.restapi.dto.Member;
import com.study.restapi.repository.MemoryMemberRepository;
import com.study.restapi.service.MemberService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

@Slf4j
@RequestMapping("/member")
@RestController
@RequiredArgsConstructor
public class MemberController {
    private final MemberService memberService;
    private final MemoryMemberRepository memoryMemberRepository;

    @GetMapping("/selMember.do")
    public Member selMember(@RequestParam("userId") Long id) {
        log.info("Received selMember request with id: {}", id);
        return memoryMemberRepository.findById(id);
    }


    @GetMapping("/member")
    public Map<String, Object> memberController() {
        return memberService.getMemberData();
    }
}
