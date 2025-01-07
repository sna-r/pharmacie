package mg.itu.pharmacie.Models.Databases;


import java.sql.Connection; 
import java.sql.DriverManager;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

public class MyConnection {
    String ip;
    int port;
    String databaseName;
    String userName;
    String password;
    public void setDatabaseName(String databaseName) {
        this.databaseName = databaseName;
    }
    public void setIp(String ip) {
        this.ip = ip;
    }
    public void setPassword(String password) {
        this.password = password;
    }
    public void setPort(int port) {
        this.port = port;
    }
    public void setUserName(String userName) {
        this.userName = userName;
    }
    public String getDatabaseName() {
        return databaseName;
    }
    public String getIp() {
        return ip;
    }
    public String getPassword() {
        return password;
    }
    public int getPort() {
        return port;
    }
    public String getUserName() {
        return userName;
    }

    public void loadConfigFromXML() {
        try {
            DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
            DocumentBuilder builder = factory.newDocumentBuilder();
            Document document = builder.parse("./connection.xml");

            Element root = document.getDocumentElement();
            NodeList nodeList = root.getChildNodes();

            for (int i = 0; i < nodeList.getLength(); i++) {
                Node node = nodeList.item(i);
                if (node.getNodeType() == Node.ELEMENT_NODE) {
                    Element element = (Element) node;
                    switch (element.getTagName()) {
                        case "ip":
                            this.setIp(element.getTextContent());
                            break;
                        case "port":
                            this.setPort(Integer.parseInt(element.getTextContent()));
                            break;
                        case "databaseName":
                            this.setDatabaseName(element.getTextContent());
                            break;
                        case "userName":
                            this.setUserName(element.getTextContent());
                            break;
                        case "password":
                            this.setPassword(element.getTextContent());
                            break;
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public void loadConfigFromXMLMysql() {
        try {
            DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
            DocumentBuilder builder = factory.newDocumentBuilder();
            Document document = builder.parse("./connectionMysql.xml");

            Element root = document.getDocumentElement();
            NodeList nodeList = root.getChildNodes();

            for (int i = 0; i < nodeList.getLength(); i++) {
                Node node = nodeList.item(i);
                if (node.getNodeType() == Node.ELEMENT_NODE) {
                    Element element = (Element) node;
                    switch (element.getTagName()) {
                        case "ip":
                            this.setIp(element.getTextContent());
                            break;
                        case "port":
                            this.setPort(Integer.parseInt(element.getTextContent()));
                            break;
                        case "databaseName":
                            this.setDatabaseName(element.getTextContent());
                            break;
                        case "userName":
                            this.setUserName(element.getTextContent());
                            break;
                        case "password":
                            this.setPassword(element.getTextContent());
                            break;
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


    public static Connection connectDefault() throws Exception {
        MyConnection c = new MyConnection();
        c.loadConfigFromXML();
        return c.connectPostgres(c.getIp(), c.getPort(), c.getDatabaseName(), c.getUserName(), c.getPassword());
    }
    
    public static Connection connectDefaultMysql() throws Exception {
        MyConnection c = new MyConnection();
        c.loadConfigFromXMLMysql();
        return c.connectMysql(c.getIp(), c.getPort(), c.getDatabaseName(), c.getUserName(), c.getPassword());
    }
    
    public Connection connectMysql(String ip, int port, String databaseName, String userName, String password)
            throws Exception {
        return DriverManager.getConnection("jdbc:mysql://" + ip + ":" + port + "/" + databaseName + "",
                "" + userName + "", "" + password + "");
    }
    public Connection connectPostgres(String ip,int port,String databaseName,String userName,String password) throws Exception{
        Class.forName("org.postgresql.Driver");
        return DriverManager.getConnection("jdbc:postgresql://"+ip+":"+port+"/"+databaseName+"", ""+userName+"", ""+password+"");
    }
}
