//package egovframework.let.main.web;
//
//import java.sql.SQLException;
//
//import org.springframework.beans.factory.annotation.Autowired;
//
//import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
//import egovframework.rte.psl.orm.ibatis.SqlMapClientFactoryBean;
//
//public class VisitCountDAO extends EgovComAbstractDAO{
//
//	@Autowired
//	private SqlMapClientFactoryBean sqlMapClientFactoryBean;
//	
//	private static VisitCountDAO instance;
//
//	// 싱글톤 패턴
//    private VisitCountDAO(){}
//    public static VisitCountDAO getInstance(){
//        if(instance==null)
//            instance=new VisitCountDAO();
//        return instance;
//    }
//	
//    public void setTotalCount() throws SQLException {
//    	sqlMapClientFactoryBean.getObject().insert("insertTotalCount");
//    	/*insert("insertTotalCount");*/
//    }
//    
//    public int getTotalCount() {
//    	return (int)select("selectTotalCount");
//    }
//    
//    public int getTodayCount() {
//    	return (int)select("selectTodayCount");
//    }
//}
