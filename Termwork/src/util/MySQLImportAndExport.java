package util;

import java.io.File;
/**
 * MySQL导入和导出
 * @author <a href="http://www.xdemo.org/">xdemo.org</a>
 *
 */
public class MySQLImportAndExport {
 
    /**
     * 导出数据库
     * @param user 数据库用户名
     * @param password 数据库密码
     * @param ip 数据库IP地址
     * @param port 数据库端口号
     * @param dbName 数据库名称
     * @param target 要导入到的文件地址
     * @throws Exception
     */
    public static void dbExport(String user, String password, String ip, String port, String dbName, String target) throws Exception {
        String cmd = "mysqldump -u" + user + " -p" + password + " -h" + ip + " -P" + port + " " + dbName + " -r " + target;
        RunTimeUtils.run(cmd);
        File file = new File(target);
        if (!file.exists()) {
            file.delete();
            throw new Exception("数据库[" + dbName + "]导出失败");
        }
    }
 
    public static void dbImport(String user, String password, String ip, String port, String dbName, String src) throws Exception {
 
        // 注意，在regex中"\\"表示一个"\"，在java中一个"\"也要用"\\"表示。这样，前一个"\\"代表regex中的"\"，后一个"\\"代表java中的"\"
        // 这里之所以要替换，是因为Windows的目录是反斜杠，反斜杠后面跟的字符会被mysql理解为一个参数名称
        src = src.replaceAll("\\\\", "/");
        String cmd[] = new String[4];
        // 登录
        cmd[0] = "mysql -u" + user + " -p" + password + " -h" + ip + " -P" + port;
        // 创建数据库
        cmd[1] = "create database " + dbName + " character set utf8 collate utf8_general_ci;";
        // 选择数据库
        cmd[2] = "use " + dbName;
        // 导入数据
        cmd[3] = "source " + src + "";// 也可以用mysql命令导入mysql -uroot -p123456
        // 执行cmd语句
        RunTimeUtils.run(cmd);
    }
     
    public static void main(String[] args) throws Exception {
        //dbExport("root", "123456", "127.0.0.1", "3306", "mysql", "D:\\bak.sql");
        dbImport("root", "123456", "127.0.0.1", "3306", "mysql2", "D:\\bak.sql");
    }
 
}