package au.com.phytoline.dao;

import java.util.List;

import au.com.phytoline.entity.BatchDetails;

public interface BatchDetailsDAO {
	public void addBatchDetails(BatchDetails batchDetails);
	public List getBatchDetailsByBatchNo(String BatchNo);
}
