package pl.coderslab.charity.security;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;


@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.authorizeRequests()
                .antMatchers("src/main/webapp/resources/css/**", "/src/main/webapp/resources/js/**", "/src/main/webapp/resources/images/**").permitAll()
                .antMatchers("/").permitAll()
                .antMatchers("/form").authenticated()
                .antMatchers("/form-confirmation").authenticated()
                .antMatchers("/submit").authenticated()
//                .antMatchers("/login").authenticated()
//                .antMatchers("/logout").authenticated()
                .and().formLogin()
                .loginPage("/login");
//                .and().logout().logoutUrl("/logout").logoutSuccessUrl("/")
//                .permitAll();

    }

    @Bean
    public BCryptPasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Bean
    public SpringDataUserDetailsService customUserDetailsService() {
        return new SpringDataUserDetailsService();
    }

//    @Bean
//    public UserService customUserService(){
//        return new UserService()
//    }

    @Override
    public void configure(WebSecurity web) throws Exception {
        web
                .ignoring()
                .antMatchers("/resources/**"); // #3
    }


}
