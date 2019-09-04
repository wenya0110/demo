package com.demo.service;

import java.util.List;

import com.demo.po.Color;

public interface ColorService {
	
	public List<Color> getColorsByPid(String[] colorarr);

}
