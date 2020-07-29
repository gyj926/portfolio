package exam.dao;



import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import exam.mapper.MemberMapper;
import exam.vo.MemberVo;
public class MemberDao {
	private static MemberDao instance = new MemberDao();
	
	public static MemberDao getInstance() {
		return instance;
	}


	private MemberDao() {}
	
	
	public void insert(MemberVo vo) {
		SqlSession sqlSession = DBManager.getSqlSessionFactory().openSession(false);
		
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		
		int rowCount = mapper.insert(vo);
		
		if (rowCount > 0) {
			sqlSession.commit();
		} else {
			sqlSession.rollback();
		}
		
		sqlSession.close();
	} // insert

	
	public int userCheck(String id, String passwd) {
		int check = -1;
		
		SqlSession sqlSession = null;
		try {
			sqlSession = DBManager.getSqlSessionFactory().openSession(false);
			MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
			
			String dbPasswd = mapper.getPasswdById(id);
			System.out.println("dbPasswd = " + dbPasswd);
			
			
			if (dbPasswd != null) {
				if(dbPasswd.equals(passwd)) {
					check = 1;
				} else {
					check = 0;
				}
			} else {
				check = -1;
			}
		} finally {
			sqlSession.close();
		}
		return check;
	} // userCheck
	
	
	
	public boolean isIdDuplicated(String id) {
		boolean isIdDup = false;
		
		try(SqlSession sqlSession = DBManager.getSqlSessionFactory().openSession(false)) {
			MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
			 int count =  mapper.countMemberById(id);
			 if(count == 1) {
				 isIdDup = true; // 아이디 중복
			 } else { //count == 0
				 isIdDup = false; // 아이디 중복아님
			 }
		} 
		
		return isIdDup;
	}
	
	public List<MemberVo> getMembers() {
		List<MemberVo> list = new ArrayList<>();

		try(SqlSession sqlSession = DBManager.getSqlSessionFactory().openSession(false)) {
			MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
			list = mapper.getMembers();
		} 
		
		return list;
	} // getMembers()
	
	public MemberVo getMemberById(String id) {
		MemberVo vo = null;
		
		try(SqlSession sqlSession = DBManager.getSqlSessionFactory().openSession(false)) {
			MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
			vo = mapper.getMemberById(id);
		}
		
		return vo;
		
	} // getMemberByID

	public int update(MemberVo vo) {
		int rowCount = 0;
		
		try (SqlSession sqlSession = DBManager.getSqlSessionFactory().openSession(true)) {
			MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
			rowCount = mapper.update(vo);
		}
		
		return rowCount;
	} // update()
	
	
	public int deleteById(String id) {
		int rowCount = 0;
		
		try (SqlSession sqlSession = DBManager.getSqlSessionFactory().openSession(true)) {
			MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
			rowCount = mapper.deleteById(id);
			
		}
		
		return rowCount;
	}
	
	
	
	
	public static void main(String[] args) {
//		MemberDao dao = MemberDao.getInstance();
//		List<MemberVo> memberList = dao.getMembers();
//		
//		for(MemberVo vo : memberList) {
//			System.out.println(vo.toString());
//		}
//		
	} // main
	
}
		
		
		
	
	
	
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
