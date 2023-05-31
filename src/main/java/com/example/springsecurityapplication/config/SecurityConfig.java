package com.example.springsecurityapplication.config;


import com.example.springsecurityapplication.services.PersonDetailsService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfiguration;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.NoOpPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
public class SecurityConfig {

    private final PersonDetailsService personDetailsService;

    @Bean
    public PasswordEncoder getPasswordEncode() {

        return new BCryptPasswordEncoder();
    }

    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
        // Конфигурируем работу Spring Security
        http//csrf().disable() отключаем защиту от межсайтовой подделки запросов
                .authorizeHttpRequests() // указываем, что все страницы должны быть защищены аутентификацией
                .requestMatchers("/admin").hasRole("ADMIN") // Указываем на то, что страница /admin доступна пользователям с ролью ADMIN
                // указываем, что неаутентифицированные пользователи могут зайти на страницу аутентификации и на объект ошибки
                // с помощью permitAll() указываем, что неаутентифицированные пользователи могут заходить на перечисленные страницы
                .requestMatchers("/authentication", "/error", "/registration", "/resources/**", "/static/**", "/css/**", "/js/**", "/img/**", "/product", "/product/info/{id}", "/product/search").permitAll()
                // указываем, что для всех остальных страниц необходимо вызывать метод authenticated(), который открывает форму аутентификации
                // .anyRequest().authenticated()
                .anyRequest().hasAnyRole("USER", "ADMIN")
                .and() // указываем, что дальше настраивается аутентификация, и соединяем её с настройкой доступа
                .formLogin().loginPage("/authentication") // указываем, какой url запрос будет отправляться при заходе на защищённые страницы
                .loginProcessingUrl("/process_login") // указываем, на какой адрес будут отпрвляться данные с формы. Нам уже не нужно будет создавать метод в контроллере и обрабатывать данные с формы. Мы задали url, который используется по умолчанию для обработки формы аутентификации посредством Spring Security. Spring Security будет ждать объект с формы аутентификации и затем сверять логин и пароль с данными в БД.
                .defaultSuccessUrl("/person_account", true) // Указываем, на какой url необходимо направить пользователя после успешной аутентификации. Вторым аргументом указывается true, чтобы перенаправление шло в любом случае после успешной аутентификации.
                .failureUrl("/authentication?error") // Указываем куда необходимо перенаправить пользователя при проваленной аутентификации. В запросе будет передан объект error, который будет проверяться на форме, и при наличии данного объекта в запросе выводится сообщение "Неправильный логин или пароль".
                .and()
                .logout().logoutUrl("/logout").logoutSuccessUrl("/authentication");
        return http.build();
    }

    @Autowired
    public SecurityConfig(PersonDetailsService personDetailsService) {
        this.personDetailsService = personDetailsService;
    }
    // private final AuthenticationProvider authenticationProvider;

    // public SecurityConfig(AuthenticationProvider authenticationProvider) {
    //    this.authenticationProvider =authenticationProvider;
    // }

    protected void configure(AuthenticationManagerBuilder authenticationManagerBuilder) throws Exception {

        authenticationManagerBuilder.userDetailsService(personDetailsService)
        .passwordEncoder(getPasswordEncode());
    }
}
