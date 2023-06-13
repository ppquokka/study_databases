import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Scanner;

import javax.management.Query;

public class CarsWithDB {
    public static void main(String[] args) {
        try {
            // - MySQL workbench 실행 : JDBC
            // - User/password와 접속 IP:port 접속
            String url = "jdbc:mysql://127.0.0.1:3306/db_cars";
            String user = "root";
            String password = "!yojulab*";

            Connection connection = DriverManager.getConnection(url, user, password);
            System.out.println("DB연결 성공\n");

            // - query Edit
            Statement statement = connection.createStatement();
            String query = "";

            // 작업 키 입력
            Scanner scanner = new Scanner(System.in);
            String workkey = "P";
            while(!workkey.equals("E")) {
                System.out.print("선택입력 : ");
                workkey = scanner.nextLine();
                if (workkey.equals("O")) {
                    System.out.println("차 이름 명단") ;
                    query = "SELECT T_FAC.COMPANY, T_CAR_INFOR.CAR_NAME\n" + //
                            "\t, T_CAR_INFOR.CAR_INFOR_ID\n" + //
                            "FROM (factorys AS T_FAC\n" + //
                            "\tinner JOIN car_infors AS T_CAR_INFOR\n" + //
                            "    ON T_FAC.COMPANY_ID = T_CAR_INFOR.COMPANY_ID)\n" ;
                    ResultSet resultSet = statement.executeQuery(query);
                    
                    int number = 1;
                    Statement statement2 = connection.createStatement();
                    ResultSet resultSet2;
                    String query2;
                    while (resultSet.next()) {
                        System.out.print(number + "." +
                            resultSet.getString("COMPANY") + " - " +
                            resultSet.getString("CAR_NAME") + ": ");
                        query2 = "SELECT T_OPT_INFO.OPTION_NAME\n" + //
                                "FROM option_infors AS T_OPT_INFO\n" + //
                                "\tINNER JOIN `options` AS T_OPTS\n" + //
                                "    ON T_OPT_INFO.OPTION_INFOR_ID = T_OPTS.OPTION_INFOR_ID\n" + //
                                "    AND T_OPTS.CAR_INFOR_ID = '"+resultSet.getString("CAR_INFOR_ID")+"'";
                        resultSet2 = statement2.executeQuery(query2);
                        while(resultSet2.next()){
                            System.out.print(resultSet2.getString("OPTION_NAME")+",");
                        }
                        number = number + 1;
                        System.out.println();
                    }

                } else if (workkey.equals("S")) {
                    System.out.println("통계 시작") ;
                    query = "SELECT T_FAC.COMPANY, T_CAR_INFOR.CAR_NAME, count(*) AS CNT\n" + //
                            "FROM (factorys AS T_FAC\n" + //
                            "\tinner JOIN car_infors AS T_CAR_INFOR\n" + //
                            "    ON T_FAC.COMPANY_ID = T_CAR_INFOR.COMPANY_ID)\n" + //
                            "    inner join `options` AS T_OPTS\n" + //
                            "    ON T_CAR_INFOR.CAR_INFOR_ID = T_OPTS.CAR_INFOR_ID\n" + //
                            "    GROUP BY T_FAC.COMPANY_ID, T_CAR_INFOR.CAR_INFOR_ID";
                    ResultSet resultSet = statement.executeQuery(query) ;
                    while (resultSet.next()) {
                        System.out.println(resultSet.getString("COMPANY") + "," +
                        resultSet.getString("CAR_NAME") + "," +
                        resultSet.getInt("CNT"));
                    }
                } else {
                    System.out.println("----- 작업 키 확인 : 입력한 값 : "+workkey) ;
                }
            }
            System.out.println("----- 작업 종료 -----");
        } catch (Exception e) {
            // TODO: handle exception
            System.out.println(e.getMessage());
        }
        System.out.println();
    }
}