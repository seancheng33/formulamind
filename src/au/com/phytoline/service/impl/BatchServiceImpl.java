package au.com.phytoline.service.impl;

import java.util.List;

import au.com.phytoline.dao.BatchDAO;
import au.com.phytoline.entity.Batch;
import au.com.phytoline.entity.Pager;
import au.com.phytoline.service.BatchService;

public class BatchServiceImpl implements BatchService {
	BatchDAO batchDAO;

	public void setBatchDAO(BatchDAO batchDAO) {
		this.batchDAO = batchDAO;
	}

	@Override
	public void addBatch(Batch batch) {
		batchDAO.addBatch(batch);
	}

	@Override
	public List getAllBatchByPager(int page, int pageSize) {
		return batchDAO.getAllBatchByPager(page, pageSize);
	}

	@Override
	public Pager getCountOfBatch(int pageSize) {
		int count =batchDAO.getCountOfBatch();
		Pager pager = new Pager();
		pager.setRowCount(count);
		pager.setPerPageRows(pageSize);
		return pager;
	}

	@Override
	public Integer getLastBatchSerials() {
		int count =batchDAO.getLastBatchSerials();
		return count;
	}

	@Override
	public Batch getBatchById(int id) {
		return batchDAO.getBatchById(id);
	}

}
