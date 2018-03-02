
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package listeners;

import dataBaseFunction.dbMethods;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.http.HttpSession;

/**
 * Web application lifecycle listener.
 *
 * @author Muhammad Sami
 */
public class Deploylistener implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        dbMethods.connectToDatabase();
        
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        try {
            dbMethods.conn.close();
//             HttpSession session = sce.getServletContext().get;
        } catch (SQLException ex) {
            Logger.getLogger(Deploylistener.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
