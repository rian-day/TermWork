package util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
/**
 * Runtime工具类
 * @author <a href="http://www.xdemo.org/">xdemo.org</a>
 *
 */
public class RunTimeUtils{
     
 
    /**
     * cmd array
     * @param cmd
     * @throws IOException
     * @throws InterruptedException 
     */
    public static void run(String cmd[]) throws IOException{
         
        Process ps = getProcess(cmd[0]);
 
        // 获取输出流
        OutputStream os = ps.getOutputStream();
        // 输出流往外写的方法
        OutputStreamWriter osw = new OutputStreamWriter(os);
         
        String _cmd="";
        for(int i=0;i<cmd.length;i++){
            if(i==0)continue;
            _cmd+=cmd[i]+"\r\n";
        }
         
        osw.write(_cmd);
        osw.flush();
        osw.close();
        os.close();
        waitForComplete(ps);
    }
     
    public static void run(String cmd) throws IOException{
        Process ps=Runtime.getRuntime().exec(cmd);
        //等待返回，让这个方法阻塞，否则提前返回，文件或者想要的结果没有生成，下一步操作会产生异常
        waitForComplete(ps);
    }

    public static Process getProcess(String cmd) throws IOException {
        return Runtime.getRuntime().exec(cmd);
    }
     
    public static void waitForComplete(Process process) throws IOException{
     
        BufferedReader input = new BufferedReader(new InputStreamReader(process.getInputStream(),"UTF-8"));
        input.readLine();
        input.close();
        process.destroy();
    }
 
}