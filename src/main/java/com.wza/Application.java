package com.wza;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.actuate.system.ApplicationPidListener;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

@Configuration
@EnableAutoConfiguration
@ComponentScan
@PropertySource("classpath:application.properties")
public class Application {

  public static void main(String[] args) {
    SpringApplication springApplication =
            new SpringApplication(Application.class);
    springApplication.addListeners(
            new ApplicationPidListener("/wzasg/target/app.pid"));
    springApplication.run(args);
    System.out.println("Spring boot started");

  }

}