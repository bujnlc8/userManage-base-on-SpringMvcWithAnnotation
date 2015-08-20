package com.haihuiling.spring.config;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import org.hibernate.jpa.HibernatePersistenceProvider;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.context.annotation.PropertySources;
import org.springframework.core.env.Environment;
import org.springframework.orm.jpa.JpaTransactionManager;
import org.springframework.orm.jpa.JpaVendorAdapter;
import org.springframework.orm.jpa.LocalContainerEntityManagerFactoryBean;
import org.springframework.orm.jpa.vendor.HibernateJpaDialect;
import org.springframework.orm.jpa.vendor.HibernateJpaVendorAdapter;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import com.haihuiling.spring.common.PropertiesTools;

@Configuration
@ComponentScan(basePackages="com.haihuiling.spring")
@PropertySources(value={
		@PropertySource("classpath:jpaEntityScan.properties")
})
@EnableTransactionManagement
public class ApplicationConfiguration {

	
	@Autowired
	private Environment env;
	
	@Bean
	public JpaVendorAdapter jpaVendorAdapter() throws Exception{
		HibernateJpaVendorAdapter jpaVendorAdapter = new HibernateJpaVendorAdapter();
		jpaVendorAdapter.setGenerateDdl(false);
		return jpaVendorAdapter;
	}
	
	@Bean
	public LocalContainerEntityManagerFactoryBean entityManagerFactory() throws Exception{
		Context conIC = new InitialContext();  
		// 在容器里获取数据源
		DataSource dataSource = (DataSource) conIC.lookup(PropertiesTools.getMessageSource("server_type"));
		LocalContainerEntityManagerFactoryBean entityManagerFactoryBean = new LocalContainerEntityManagerFactoryBean();
		entityManagerFactoryBean.setPersistenceProviderClass(HibernatePersistenceProvider.class);
		entityManagerFactoryBean.setJpaDialect(new HibernateJpaDialect());
		entityManagerFactoryBean.setJpaVendorAdapter(jpaVendorAdapter());
		entityManagerFactoryBean.setDataSource(dataSource);
		entityManagerFactoryBean.setPackagesToScan(env.getProperty("jpa.entitypackagestoscan").split(","));
		return entityManagerFactoryBean;
	}
	
	
	@Bean(name="transactionManager")
	public PlatformTransactionManager transactionManager() throws Exception{
		JpaTransactionManager tx = new JpaTransactionManager();
		tx.setEntityManagerFactory(entityManagerFactory().getObject());
		return tx;
	}
}
