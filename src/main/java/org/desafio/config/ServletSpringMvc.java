package org.desafio.config;

import javax.servlet.Filter;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;

import org.springframework.web.context.request.RequestContextListener;
import org.springframework.web.filter.CharacterEncodingFilter;
import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

public class ServletSpringMvc extends AbstractAnnotationConfigDispatcherServletInitializer {

	@Override
	protected Class<?>[] getRootConfigClasses() {
		return new Class[] { AppWebConfiguration.class, JPAConfiguration.class,
					JPAProductionConfiguration.class};
	}

	@Override
	protected Class<?>[] getServletConfigClasses() {
		return new Class[] {};
	}

	@Override
	protected String[] getServletMappings() {
		return new String[] { "/" };
	}

	@Override
	protected Filter[] getServletFilters() {
		CharacterEncodingFilter encodingFilter = new CharacterEncodingFilter();
		encodingFilter.setEncoding("UTF-8");

		return new Filter[] {};
	}
	
//Configuração para rodar em um servidor local no escopo de desnvolvimento
//	@Override
//	public void onStartup(ServletContext servletContext) throws ServletException {
//		super.onStartup(servletContext);
//		servletContext.addListener(RequestContextListener.class);
//		servletContext.setInitParameter("spring.profiles.active", "dev");
//	}

}
