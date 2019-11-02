package com.gsitm.spring;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

import com.gsitm.spring.emp.service.CustomUserDetailsService;

/**
 * @programName : SecurityConfig.java
 * @author      : 차주현
 * @date        : 2018. 6. 8. 
 * @function    :  
 *
 * [이름]   [수정일]     [내용]
 * ----------------------------------------------------------
 * 
 */ 
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {
	
	@Autowired
	CustomUserDetailsService customUserDetailsService;
	
	@Bean
	public PasswordEncoder passwordEncoder() {
	  return new BCryptPasswordEncoder();
	}
	
	@Autowired
	public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
	  auth.userDetailsService(customUserDetailsService).passwordEncoder(passwordEncoder());
//	  auth.inMemoryAuthentication()
//      			.withUser("me").password("secret").roles("ADMIN");
	}
	
	@Override
	public void configure(WebSecurity web) throws Exception {
		web.ignoring().antMatchers("/css/**", "/script/**", "image/**", "/fonts/**", "lib/**", "/api/**");
	}
	
	@Override
	protected void configure(HttpSecurity http) throws Exception
	{
		http.authorizeRequests()
			.antMatchers("/res/**").hasRole("BASIC")
			.antMatchers("/board/*").hasRole("BASIC")
			.antMatchers("/board/admin/**").hasRole("ADMIN")
			.antMatchers("/common/**").hasRole("BASIC")
			.antMatchers("/admin/**").hasRole("ADMIN")
			.antMatchers("/res/**").hasRole("BASIC")
			.antMatchers("/**").authenticated()
			.antMatchers("/**").permitAll()
			.and().formLogin()
			.loginPage("/login/login.do")
			.loginProcessingUrl("/login/login.do")
			.defaultSuccessUrl("/common/dashboard.do")
	    	.failureUrl("/login/login.do")
	    	.and()
	    	.logout()
	    	.logoutRequestMatcher(new AntPathRequestMatcher("/logout"))
	    	.logoutSuccessUrl("/login/login.do");
//			.and().csrf().ignoringAntMatchers("/console/**", "/management/**");
	}
}
