package com.jhta.cope.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.cope.dao.SampleDao;
import com.jhta.cope.vo.Employee;

@Service
public class sampleImpl implements sample{

	@Autowired
	SampleDao sampleDao;
	
	@Override
	public List<Employee> getAllEmployees() {
		return sampleDao.getAllEmployees();
	}

	
}
