package com.study.restapi.controller;
import com.study.restapi.service.MemberService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;
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
    @Operation(summary = "멤버 등록", description = "멤버를 등록합니다.")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200", description = "멤버 등록 성공"),
            @ApiResponse(responseCode = "400", description = "잘못된 요청"),
            @ApiResponse(responseCode = "500", description = "서버 오류")
    })
    @PostMapping("/rgstMember.do")
    public Map<String, Object> rgstMember(@RequestParam Map<String, Object> paramMap){
        Map<String, Object> resultMap = new HashMap<>();
        resultMap = memberService.rgstMember(paramMap);
        return resultMap;
    }

    /**
     * 멤버 정보 조회
     * @param paramMap
     * @return
     */
    @Operation(summary = "멤버 조회", description = "입력한 아이디에 해당하는 멤버를 조회합니다.")
    @Parameter(name = "str", description = "멤버 아이디")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200", description = "멤버 조회 성공"),
            @ApiResponse(responseCode = "400", description = "잘못된 요청"),
            @ApiResponse(responseCode = "500", description = "서버 오류")
    })
    @GetMapping("selMemberById.do")
    public Map<String, Object> selMemberById(@RequestParam Map<String, Object> paramMap){
        Map<String, Object> resultMap = new HashMap<>();
        resultMap = memberService.selMemberById(paramMap);
        return resultMap;
    }

    /**
     * 멤버 수정
     * @return
     */
    @Operation(summary = "멤버 수정", description = "해당 멤버 정보를 수정합니다.")
    @Parameter(name = "paramMap", description = "멤버 정보를 담은 맵", content = @Content)
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200", description = "멤버 수정 성공"),
            @ApiResponse(responseCode = "400", description = "잘못된 요청"),
            @ApiResponse(responseCode = "500", description = "서버 오류")
    })
    @RequestMapping(value = "/updtMember.do", method = RequestMethod.PATCH)
    public Map<String, Object> updtMember(@RequestBody Map<String, Object> paramMap) {
        Map<String, Object> resultMap = new HashMap<>();
        resultMap = memberService.updtMember(paramMap);
        return resultMap;
    }


    /**
     * 멤버 삭제
     * @param paramMap
     * @return
     */
    @Operation(summary = "멤버 삭제", description = "해당 멤버 정보를 삭제합니다.")
    @Parameter(name = "paramMap", description = "멤버 아이디")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200", description = "멤버 삭제 성공"),
            @ApiResponse(responseCode = "400", description = "잘못된 요청"),
            @ApiResponse(responseCode = "500", description = "서버 오류")
    })
    @RequestMapping(value = "/delMember.do", method = RequestMethod.DELETE)
    public Map<String, Object> delMember(@RequestParam Map<String, Object> paramMap) {
        Map<String, Object> resultMap = new HashMap<>();
        resultMap = memberService.delMember(paramMap);
        return resultMap;
    }


}
