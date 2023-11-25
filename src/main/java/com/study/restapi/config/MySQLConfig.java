package com.study.restapi.config;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.Resource;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;

import javax.sql.DataSource;


@Configuration
@MapperScan("com.study.restapi.mapper")
public class MySQLConfig {
    @Bean
    public SqlSessionFactory sqlSessionFactory(DataSource dataSource) throws Exception {
        final SqlSessionFactoryBean sessionFactory = new SqlSessionFactoryBean();
        sessionFactory.setDataSource(dataSource);
        PathMatchingResourcePatternResolver resolver = new PathMatchingResourcePatternResolver();

        try {
            sessionFactory.setMapperLocations(resolver.getResources("classpath:sqlmap/*.xml"));

            Resource myBatisConfig = resolver.getResource("classpath:mybatis-config.xml");
            sessionFactory.setConfigLocation(myBatisConfig);

            return sessionFactory.getObject();
        } catch (Exception e) {
            // 로그에 예외 정보 출력
            throw new RuntimeException("Failed to configure SqlSessionFactory", e);
        }
    }
}
