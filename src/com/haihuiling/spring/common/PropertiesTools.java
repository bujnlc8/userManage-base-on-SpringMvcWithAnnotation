//~--- JDK imports ------------------------------------------------------------
package com.haihuiling.spring.common;


import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

public class PropertiesTools {
    //~--- get methods --------------------------------------------------------

    /**
     *get the properites by file name
     *
     *
     * @param fileName
     *
     * @return
     */
    public static Properties getPropertiesFile (String fileName) {
        Properties props = new Properties();
        InputStream ins = null;

        try {
             ins = Thread.currentThread().getContextClassLoader().getResourceAsStream(fileName);

            props.load(ins);
        }
        catch (FileNotFoundException e) {
            e.printStackTrace();
        }
        catch (IOException e) {
            e.printStackTrace();
        }finally{
        	if(ins != null){
        		try{
        			ins.close();
        		}catch(Exception e){}
        	}
        }

        return props;
    }
    
    /**
     * get the chinese message resouce
     * @param key
     * @return
     */
    public static String getMessageSource(String key){
    	Properties props = getPropertiesFile("project.properties");
    	return(props.getProperty(key));
    }
    
    public static void main(String[] args){
    	System.out.println(PropertiesTools.getMessageSource("cmd"));
    }
    

}
