package au.com.phytoline.service;

import java.util.List;

import au.com.phytoline.entity.Batch;
import au.com.phytoline.entity.Pager;

public interface BatchService {
	public void addBatch(Batch batch);
	public List getAllBatchByPager(int page,int pageSize);
	public Pager getCountOfBatch(int pageSize);
}
