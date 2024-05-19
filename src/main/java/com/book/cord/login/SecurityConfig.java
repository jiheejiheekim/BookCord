package com.book.cord.login;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.provisioning.InMemoryUserDetailsManager;

@Configuration
@EnableWebSecurity
@ComponentScan(basePackages = {"com.book.cord.login"})
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    @Autowired
    private CustomAuthenticationProvider customAuthenticationProvider;

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.authenticationProvider(customAuthenticationProvider);
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http
            .authorizeRequests()
            .antMatchers("/", "/css/**", "/js/**", "/img/**").permitAll()
            .antMatchers("/register").permitAll()
            .antMatchers("/main").permitAll()
            .antMatchers("/admin/**").hasRole("ADMIN")
            .antMatchers("/vip/**").hasRole("USER")
            .anyRequest().authenticated()
                .and()
            .formLogin()
                .loginPage("/bc/loginP")
                .loginProcessingUrl("/bc/login")
                .defaultSuccessUrl("/main")
                .usernameParameter("id")
                .passwordParameter("pwd")
                .permitAll()
                .and()
            .logout()
                .logoutSuccessUrl("/main")
                .permitAll();
    }
    
    @Bean
    public UserDetailsService userDetailsService() {
        // InMemoryUserDetailsManager를 사용하여 사용자를 설정합니다.
        UserDetails user = User.withUsername("user")
            .password(passwordEncoder().encode("1111"))
            .roles("USER")
            .build();

        UserDetails admin = User.withUsername("admin")
            .password(passwordEncoder().encode("1111"))
            .roles("ADMIN")
            .build();

        return new InMemoryUserDetailsManager(user, admin);
    }
    
    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }
}

