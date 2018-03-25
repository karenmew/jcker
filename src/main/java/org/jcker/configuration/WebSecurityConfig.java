package org.jcker.configuration;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

@Configuration
@EnableWebSecurity
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {
    @Autowired
    private UserDetailsService userDetailsService;

    /**
     * 密码加密
     * @return
     */
    @Bean
    public BCryptPasswordEncoder bCryptPasswordEncoder() {
        return new BCryptPasswordEncoder();
    }

    /**
     * 配置授权和认证规则
     * @param http
     * @throws Exception
     */
    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http
                .authorizeRequests()//授权
                    .antMatchers(
                            "/css/**",
                            "/fonts/**",
                            "/highlight/**",
                            "/images/**",
                            "/js/**",
                            "/mdeditor/**",
                            "/",
                            "/add_comment",
                            "/page/**",
                            "/search/**",
                            "/article/**",
                            "/tag/**",
                            "/view/**"
                    ).permitAll()//符合匹配的，允许所有
                    .anyRequest().authenticated()//任何请求，必须认证过才才能操作
                    .and()
                .formLogin().loginPage("/admin/login").defaultSuccessUrl("/admin").permitAll()//允许登录页面
                    .and()
                .logout().permitAll();//允许登出
    }

    /**
     * 配置
     * @param auth
     * @throws Exception
     */
    @Autowired
    public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(userDetailsService);//.passwordEncoder(bCryptPasswordEncoder());
    }
}