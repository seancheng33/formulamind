package au.com.phytoline.service.impl;

import java.util.List;

import au.com.phytoline.dao.BatchDetailsDAO;
import au.com.phytoline.entity.BatchDetails;
import au.com.phytoline.service.BatchDetailsService;

public class BatchDetailsServiceImpl implements BatchDetailsService {
BatchDetailsDAO batchDetailsDAO;
public void setBatchDetailsDAO(BatchDetailsDAO batchDetailsDAO) {
	this.batchDetailsDAO = batchDetailsDAO;
}
	@Override
	public void addBatchDetails(BatchDetails batchDetails) {
		batchDetailsDAO.addBatchDetails(batchDetails);
	}
	@Override
	public List getBatchDetailsByBatchNo(String BatchNo) {
		return batchDetailsDAO.getBatchDetailsByBatchNo(BatchNo);
	}

}
