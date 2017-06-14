package au.com.phytoline.dao;

import java.util.List;

import au.com.phytoline.entity.Batch;

public interface BatchDAO {
	public void addBatch(Batch batch);
	public List getAllBatchByPager(int page,int pageSize);
	public Integer getCountOfBatch();
	public Integer getLastBatchSerials();
	public Batch getBatchById(int id);
}
