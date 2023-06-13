import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.HashMap;
import java.util.Scanner;

import commons.Commons;

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
            String workKey = "P";
            while (!workKey.equals("E")) {
                System.out.print("선택입력 : ");
                workKey = scanner.nextLine();
                if (workKey.equals("O")) { // DB를 제대로 넣고, return값, parameter 값만 없고, statement와 connection 값은 필요
                                           // 따라서 아무것도 return되지 않은 상황에서 main 스테이트먼드 2개,메인 쿼리 2개 만들고
                                           // 펑션으로 만들기. 펑션으로 넘길땐 파라미터 2개만 넘겨주면 됨. 거기에서 DB 넣다 뺐다 할 수 있음
                                           // 중앙에서 statement 2개, if문 안에서 ???해서 작업분담 하면 충돌 일어나지않음
                                           // 혼자서 실제로 해봐야 이해할 수 있음 (max 1hr) 검증이 더 오래걸림

                    // - 차 이름 명단
                    System.out.println("- 차 이름 명단");
                    query = "SELECT T_FAC.COMPANY, T_CAR_INFOR.CAR_NAME\n" + //
                            "\t, T_CAR_INFOR.CAR_INFOR_ID\n" + //
                            "FROM (factorys AS T_FAC\n" + //
                            "\tinner JOIN car_infors AS T_CAR_INFOR\n" + //
                            "    ON T_FAC.COMPANY_ID = T_CAR_INFOR.COMPANY_ID)";
                    ResultSet resultSet = statement.executeQuery(query);

                    int number = 1;
                    Statement statement2 = connection.createStatement();
                    ResultSet resultSet2;
                    String query2;
                    HashMap<String, String> carNumberMap = new HashMap<>();
                    while (resultSet.next()) {
                        System.out.print(number + ". " +
                                resultSet.getString("COMPANY") + " - " +
                                resultSet.getString("CAR_NAME") + ": ");
                        String carInforId = resultSet.getString("CAR_INFOR_ID");
                        carNumberMap.put(String.valueOf(number), carInforId);
                        query2 = "SELECT T_OPT_INFO.OPTION_NAME\n" + //
                                "FROM option_infors AS T_OPT_INFO\n" + //
                                "\tinner join `options` AS T_OPTS\n" + //
                                "    ON T_OPT_INFO.OPTION_INFOR_ID = T_OPTS.OPTION_INFOR_ID\n" + //
                                "    AND T_OPTS.CAR_INFOR_ID = '" + carInforId + "'";
                        resultSet2 = statement2.executeQuery(query2);
                        while (resultSet2.next()) {
                            System.out.print(resultSet2.getString("OPTION_NAME") + ",");
                        }
                        number = number + 1;
                        System.out.println();
                    }
                    // - 차명 번호 입력 :
                    System.out.print("- 차 이름 명단 : ");
                    String CarNumber = scanner.nextLine();
                    // System.out.println("차명 PK : " + carNumberMap.get(CarNumber));
                    System.out.println("- 선택 가능 옵션들");
                    query = "SELECT OPTION_INFOR_ID, OPTION_NAME\n" + //
                            "FROM option_infors";
                    resultSet = statement.executeQuery(query);
                    number = 1;
                    HashMap<String, String> carOptionInfor = new HashMap<>();
                    while (resultSet.next()) {
                        System.out.print(number + "." + resultSet.getString("OPTION_NAME") + ", ");
                        carOptionInfor.put(String.valueOf(number), resultSet.getString("OPTION_INFOR_ID"));
                        number = number + 1;
                    }
                    System.out.println();
                    System.out.print("- 추가 옵션 선택 : ");
                    String optionNumber = scanner.nextLine();
                    System.out.println(carNumberMap.get(CarNumber) + ", " + carOptionInfor.get(optionNumber));
                    String carPk = carNumberMap.get(CarNumber);
                    String optionPk = carOptionInfor.get(optionNumber);
                    // delete 옵션 (중복값이 있으면 delete 안됨)
                    query = "DELETE FROM `OPTIONS`\n" + //
                            "WHERE  CAR_INFOR_ID = '" + carPk + "' AND OPTION_INFOR_ID = '" + optionPk + "'"; // prepare
                                                                                                              // statement는
                                                                                                              // 윗 단계
                    int count = statement.executeUpdate(query); // 쿼리 실행. insert??말고는 update. count로 이후 인서트할지 업데이트할지 정할
                                                                // 수 있음

                    // insert 옵션
                    Commons commons = new Commons();
                    String optionId = commons.generateUUID();
                    query = "INSERT INTO `options`" + //
                            "(OPTION_ID, CAR_INFOR_ID, OPTION_INFOR_ID)" + //
                            "VALUE" + //
                            "('" + optionId + "', '" + carPk + "', '" + optionPk + "')"; // OPTION_ID가 PK이므로
                    count = statement.executeUpdate(query);

                    System.out.println(); // 인서트한 카운트 값 및 딜리트 일어났는지 궁금함

                } else if (workKey.equals("S")) {
                    System.out.println("- 통계 시작 -");
                    query = "SELECT T_FAC.COMPANY, T_CAR_INFOR.CAR_NAME, COUNT(*) AS CNT\n" + //
                            "FROM (factorys AS T_FAC\n" + //
                            "\tinner JOIN car_infors AS T_CAR_INFOR\n" + //
                            "    ON T_FAC.COMPANY_ID = T_CAR_INFOR.COMPANY_ID)\n" + //
                            "    inner join `options` AS T_OPTS\n" + //
                            "    ON T_CAR_INFOR.CAR_INFOR_ID = T_OPTS.CAR_INFOR_ID\n" + //
                            "GROUP BY T_FAC.COMPANY_ID, T_CAR_INFOR.CAR_INFOR_ID";
                    ResultSet resultSet = statement.executeQuery(query);
                    while (resultSet.next()) {
                        System.out.println(resultSet.getString("COMPANY") + ", " +
                                resultSet.getString("CAR_NAME") + ", " +
                                resultSet.getInt("CNT"));
                    }
                } else {
                    System.out.println("--- 작업 키 확인 : 입력한 값 : " + workKey);
                }
            }
            System.out.println("----- 작업종료 ------");
        } catch (Exception e) {
            // TODO: handle exception
            System.out.println(e.getMessage());
        }
        System.out.println();
    }
}