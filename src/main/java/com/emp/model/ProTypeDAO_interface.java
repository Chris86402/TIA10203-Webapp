package com.emp.model;

import java.util.*;

public interface ProTypeDAO_interface {
	    public void insert(ProTypeVO proTypeVO);
	    public void update(ProTypeVO proTypeVO);
	    public void delete(Integer proTypeId);
	    public ProTypeVO findByPrimaryKey(Integer proTypeId);
	    public List<ProTypeVO> getAll();
	    //萬用複合查詢(傳入參數型態Map)(回傳 List)
	//  public List<ProTypeVO> getAll(Map<String, String[]> map); 
}