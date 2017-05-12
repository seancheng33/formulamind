package au.com.phytoline.service.impl;

import java.util.List;

import au.com.phytoline.dao.ChemicalDAO;
import au.com.phytoline.entity.Chemical;
import au.com.phytoline.entity.Pager;
import au.com.phytoline.service.ChemicalService;

public class ChemicalServiceImpl implements ChemicalService {
	ChemicalDAO chemicalDAO;

	public void setChemicalDAO(ChemicalDAO chemicalDAO) {
		this.chemicalDAO = chemicalDAO;
	}

	@Override
	public List getAllChemicalByPage(int page, int pageSize) {
		return chemicalDAO.getAllChemicalByPage(page, pageSize);
	}

	@Override
	public Pager getCountOfChemical(int pageSize) {
		int count = chemicalDAO.getCountOfChemical();
		Pager pager = new Pager();
		pager.setPerPageRows(pageSize);
		pager.setRowCount(count);
		return pager;
	}

	@Override
	public List getChemicalByConditionAndPage(String condition, int page,
			int pageSize) {
		return chemicalDAO.getChemicalByConditionAndPage(condition, page,
				pageSize);
	}

	@Override
	public Pager getCountOfChemicalByConditionAndPage(String condition,
			int pageSize) {
		int count = chemicalDAO.getCountOfChemicalByConditionAndPage(condition);
		Pager pager = new Pager();
		pager.setPerPageRows(pageSize);
		pager.setRowCount(count);
		return pager;
	}

	@Override
	public void addChemical(Chemical chemical) {
		chemicalDAO.addChemial(chemical);
	}

	@Override
	public Chemical getChemicalById(int id) {
		return chemicalDAO.getChemicalById(id);
	}

	@Override
	public void updateChemical(Chemical chemical) {
		chemicalDAO.updateChemial(chemical);
	}

	@Override
	public void deleteChemial(Chemical chemical) {
		chemicalDAO.deleteChemial(chemical);
	}
}
