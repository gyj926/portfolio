package exam.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import exam.vo.MemberVo;

public interface MemberMapper {
	

	int insert(MemberVo vo);

	@Select("select passwd from member where id = #{id}")
	String getPasswdById(String id);
	
	@Select("SELECT COUNT(*) FROM member WHERE id = #{id}")
	int countMemberById(String id);
	
	@Select("SELECT * FROM member ORDER BY id ASC")
	List<MemberVo> getMembers();
	
	@Select("SELECT * FROM member WHERE id = #{id}")
	MemberVo getMemberById(String id);
	
	int update(MemberVo vo);
	
	@Delete("DELETE FROM member WHERE id = #{id}")
	int deleteById(String id);
	
	
}
