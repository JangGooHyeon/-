package kr.or.ddit.alarm.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AlaramController {
	
	private Logger logger = LoggerFactory.getLogger(AlaramController.class);
	
	@RequestMapping(path={"/alarm"}, method=RequestMethod.GET)
	public String alarmHome(){
		
		return "alarmTiles";
	}
}
