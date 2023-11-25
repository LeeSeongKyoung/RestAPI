package com.study.restapi.controller;

import ch.qos.logback.core.model.Model;
import com.study.restapi.service.MemberService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Slf4j
@RestController
@RequiredArgsConstructor
public class MemberController {
    private final MemberService memberService;

    /**
     * 메인 화면
     * @param model
     * @return
     */
    @GetMapping("/")
    public ModelAndView main(ModelMap model) {
        ModelAndView mav = new ModelAndView("index");
        List<Map<String,Object>> list = memberService.selMemberList();
        model.addAttribute("memberList", list);

        return mav;
    }


    /**
     * 멤버 등록
     * @return
     */
    @PostMapping("/rgstMember.do")
    public Map<String, Object> rgstMember(@RequestParam Map<String, Object> paramMap){
        Map<String, Object> resultMap = new HashMap<>();
        return resultMap;
    }

    /**
     * 멤버 수정
     * @return
     */
    @RequestMapping("/updtMember.do")
    public Map<String,Object> updtMember(@RequestParam Map<String,Object> paramMap){
        Map<String, Object> resultMap = new HashMap<>();
        return resultMap;
    }

    /**
     * 멤버 삭제
     * @param paramMap
     * @return
     */
    @RequestMapping("/delMember.do")
    public Map<String, Object> delMember(@RequestParam Map<String, Object> paramMap){
        Map<String, Object> resultMap = new HashMap<>();
        return resultMap;
    }

}
