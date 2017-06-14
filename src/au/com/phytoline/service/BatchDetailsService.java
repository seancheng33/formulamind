package au.com.phytoline.service;

import java.util.List;

import au.com.phytoline.entity.BatchDetails;

public interface BatchDetailsService {
	public void addBatchDetails(BatchDetails batchDetails);
	public List getBatchDetailsByBatchNo(String BatchNo);
}
