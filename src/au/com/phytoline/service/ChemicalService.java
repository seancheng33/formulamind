package au.com.phytoline.service;

import java.util.List;

import au.com.phytoline.entity.Chemical;
import au.com.phytoline.entity.Pager;

public interface ChemicalService {
	//获取所有Chemical，指定页码和显示数
	public List getAllChemicalByPage(int page,int pageSize);
	//获取所有Chemical的数量
	public Pager getCountOfChemical(int pageSize);
	
	public List getChemicalByConditionAndPage(String condition,int page,int pageSize);
	
	public Pager getCountOfChemicalByConditionAndPage(String condition,int pageSize);
	
	public void addChemical(Chemical chemical);
}
