package com.xmu.www.mymall;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan("com.xmu.www.mymall.dao")
public class MymallApplication {

    public static void main(String[] args) {
        SpringApplication.run(MymallApplication.class, args);
    }

}
