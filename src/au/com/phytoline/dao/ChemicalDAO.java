package au.com.phytoline.dao;

import java.util.List;

import au.com.phytoline.entity.Chemical;

public interface ChemicalDAO {
	//获取所有Chemical，指定页码和显示数
	public List getAllChemicalByPage(int page,int pageSize);
	//获取所有Chemical的数量
	public Integer getCountOfChemical();
	
	public List getChemicalByConditionAndPage(String condition,int page,int pageSize);
	
	public Integer getCountOfChemicalByConditionAndPage(String condition);
	
	public void addChemial(Chemical chemical);
}
