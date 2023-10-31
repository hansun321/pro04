package kr.ed.haebeop.config;
//dispatcher-servlet.xml을 대신하는 ServletContext.java

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewResolverRegistry;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
@EnableWebMvc
@ComponentScan(basePackages = {"kr.ed.haebeop"})
public class ServletContext implements WebMvcConfigurer {
    @Override
    public void configureViewResolvers(ViewResolverRegistry registry) {
        InternalResourceViewResolver bean = new InternalResourceViewResolver();
        bean.setViewClass(JstlView.class);
        bean.setPrefix("/WEB-INF/views/");
        bean.setSuffix(".jsp");
        registry.viewResolver(bean);
    }

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/admin/**").addResourceLocations("/WEB-INF/views/admin/");
        registry.addResourceHandler("/common/**").addResourceLocations("/WEB-INF/views/common/");
        registry.addResourceHandler("/contact/**").addResourceLocations("/WEB-INF/views/contact/");
        registry.addResourceHandler("/course/**").addResourceLocations("/WEB-INF/views/course/");
        registry.addResourceHandler("/faq/**").addResourceLocations("/WEB-INF/views/faq/");
        registry.addResourceHandler("/file/**").addResourceLocations("/WEB-INF/views/file/");
        registry.addResourceHandler("/include/**").addResourceLocations("/WEB-INF/views/include/");
        registry.addResourceHandler("/notice/**").addResourceLocations("/WEB-INF/views/notice/");
        registry.addResourceHandler("/review/**").addResourceLocations("/WEB-INF/views/review/");
        registry.addResourceHandler("/test/**").addResourceLocations("/WEB-INF/views/test/");
        registry.addResourceHandler("/user/**").addResourceLocations("/WEB-INF/views/user/");
        registry.addResourceHandler("/video/**").addResourceLocations("/WEB-INF/views/video/");
    }
}
