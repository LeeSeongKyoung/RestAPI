package com.study.restapi.repository;

import com.study.restapi.dto.Member;

/**
 * <pre>
 *
 * </pre>
 *
 * @author Hong GilDong
 */
public interface MemberRepository {
    void save(Member member);

    Member findById(Long memberId);
}
