package sr.api.presentation.controller.impl;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import sr.api.presentation.controller.IViewController;


@Component
public class ViewControllerImpl implements IViewController{

	@Override
	public String redirectToHome() {
		// TODO Auto-generated method stub
		return "redirect:/protected/home";
	}

	

}
