package cn.bgs.cpic;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@SpringBootApplication
@MapperScan("cn.bgs.cpic.dao")
public class CpicApplication {

    public static void main(String[] args) {
        SpringApplication.run(CpicApplication.class, args);
    }

}
