package web.servlet;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;

@WebServlet("/easyCheckServlet")
public class EasyCheckServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        BufferedImage bi = new BufferedImage(68, 22, BufferedImage.TYPE_INT_RGB);
        Graphics g = bi.getGraphics();
        // RGB 255, 251, 240
        Color c = new Color(255, 255, 245);
        g.setColor(c);
        g.fillRect(0, 0, 68, 22);

        char[] ch = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789".toCharArray();
        Random r = new Random();
        int len = ch.length, index;
        StringBuffer sb = new StringBuffer();
        for (int i = 0; i < 4; i++) {
            index = r.nextInt(len);
            g.setColor(new Color(r.nextInt(88), r.nextInt(188), r.nextInt(255)));
            g.drawString(ch[index]+"", (i*15)+3, 18);
            sb.append(ch[index]);
        }
        request.getSession().setAttribute("piccode", sb.toString());
        ImageIO.write(bi, "JPG", response.getOutputStream());
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
