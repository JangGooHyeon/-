package kr.or.ddit.personal_connection.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.member.model.MemberVo;
import kr.or.ddit.personal_connection.model.Personal_connectionVo;

@Repository("personalDao")
public class Personal_connectionDaoImpl implements IPersonal_connectionDao {
	
	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public List<Personal_connectionVo> select_connections(MemberVo memberVo) {
		List<Personal_connectionVo> personalList =
				sqlSessionTemplate.selectList("personal.select_connections",memberVo);
		return personalList;
	}

	@Override
	public int connections_count(MemberVo memberVo) {
		int connections_count = sqlSessionTemplate.selectOne("personal.connections_count" , memberVo);
		return connections_count;
	}

}