package kr.co.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.repository.FileDAO;

@Service
public class FileServiceImpl implements FileService {

	@Inject
	private FileDAO fDao;

	@Override
	public List<String> getFile(int item_no) {
		
		return fDao.getFile(item_no);
	}

	@Override
	public int insertNdb(Map<String, Object> map) {
		
		return fDao.insertNdb(map);
	}

	@Override
	public int deleteFileByFilename(String file_name) {
		
		return fDao.deleteFileByFilename(file_name);
	}

}
