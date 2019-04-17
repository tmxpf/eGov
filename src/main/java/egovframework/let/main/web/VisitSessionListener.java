//package egovframework.let.main.web;
//
//import java.sql.SQLException;
//
//import javax.servlet.http.HttpSession;
//import javax.servlet.http.HttpSessionEvent;
//import javax.servlet.http.HttpSessionListener;
//
//public class VisitSessionListener implements HttpSessionListener{
//	
//	@Override
//	public void sessionCreated(HttpSessionEvent sessionEve) {
//		 // 세션이 새로 생성되면 execute() 실행한다.
//        if(sessionEve.getSession().isNew()){
//            try {
//				execute(sessionEve);
//			} catch (SQLException e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			}
//        }
//	}
//
//	private void execute(HttpSessionEvent sessionEve) throws SQLException 
//    {
//        VisitCountDAO dao = VisitCountDAO.getInstance();
//        
//        // 전체 방문자 수 증가
//        dao.setTotalCount();
//        // 총 방문자 수
//        int totalCount = dao.getTotalCount();
//        // 오늘 방문자 수
//        int todayCount = dao.getTodayCount();
//        
//        HttpSession session = sessionEve.getSession();
//        
//        // 세션에 방문자 수를 담는다.
//        session.setAttribute("totalCount", totalCount); 
//        session.setAttribute("todayCount", todayCount);
//    }
//	
//	@Override
//	public void sessionDestroyed(HttpSessionEvent arg0) {
//		// TODO Auto-generated method stub
//		
//	}
//
//}
