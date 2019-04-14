package kr.or.ddit.career_info.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.career_info.dao.ICareer_infoDao;
import kr.or.ddit.career_info.model.Career_infoVo;
import kr.or.ddit.files.dao.IFilesDao;
import kr.or.ddit.files.model.FilesVo;

@Service("career_infoService")
public class ICareer_infoServiceImpl implements ICareer_infoService{
	
	@Resource(name="career_infoDao")
	private ICareer_infoDao careerDao;
	
	@Resource(name="filesDao")
	private IFilesDao filesDao;

	@Override
	public int insert_career_info(Career_infoVo vo) {
		return careerDao.insert_career_info(vo);
	}

	/**
	 * Method : select_careerInfo
	 * 작성자 : jin
	 * 변경이력 :
	 * @param user_id
	 * @return
	 * Method 설명 : 사용자의 경력 사항 조회
	 */
	@Override
	public Map<String, Object> select_careerInfo(String user_id) {
		Map<String, Object> career_infoList = new HashMap<String, Object>();
		List<List<FilesVo>> career_infoFileVoList = new ArrayList<List<FilesVo>>(); 
		List<Career_infoVo> career_infoVoList = careerDao.select_careerInfo(user_id);
		
		for(Career_infoVo  career_infoVo : career_infoVoList ){
			FilesVo filesVo = new FilesVo();
			filesVo.setRef_code(career_infoVo.getCareer_code());
			filesVo.setDivision("05");
			List<FilesVo> filesVoList = filesDao.select_file(filesVo);
			career_infoFileVoList.add(filesVoList);
			
		}
		
		career_infoList.put("career_infoVoList", career_infoVoList);
		career_infoList.put("career_infoFileVoList", career_infoFileVoList);
		
		return career_infoList;
	}
}
