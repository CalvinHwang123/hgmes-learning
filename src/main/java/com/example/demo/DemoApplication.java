package com.example.demo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.context.annotation.ComponentScan;
import xyz.erupt.core.annotation.EruptScan;

@SpringBootApplication                    // ↓ xyz.erupt必须有
@ComponentScan({ "xyz.erupt","com.example.demo" }) // ↓ com.xxx要替换成实际需要扫描的代码包
@EntityScan({ "xyz.erupt", "com.example.demo" })    // ↓ 例如DemoApplication所在的包为 com.example.demo
@EruptScan({ "xyz.erupt", "com.example.demo"})     // → 则：com.xxx → com.example.demo
public class DemoApplication {
	public static void main(String[] args) {
		SpringApplication.run(DemoApplication.class, args);
	}

}
