package com.book.cord.login;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http
            .authorizeRequests()
                .antMatchers("/", "/signUp", "/loginP").permitAll() // "/"와 "/signUp"에 대한 접근은 인증 없이 허용
                .anyRequest().authenticated() // 나머지 요청은 인증이 필요함
                .and()
            .formLogin()
                .loginPage("/loginP") // 로그인 페이지 지정
                .defaultSuccessUrl("/main") // 로그인 성공 후 리다이렉트될 페이지
                .permitAll() // 로그인 페이지는 인증 없이 접근 가능
                .and()
            .logout()
                .logoutSuccessUrl("/main") // 로그아웃 성공 후 리다이렉트될 페이지
                .permitAll(); // 로그아웃은 인증 없이 접근 가능
    }

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth
            .inMemoryAuthentication() // 인메모리 방식으로 사용자 인증 정보 구성
                .withUser("user").password(passwordEncoder().encode("password")).roles("USER")
                .and()
                .withUser("admin").password(passwordEncoder().encode("admin")).roles("ADMIN");
    }

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder(); // BCrypt 암호화 방식 사용
    }
}
