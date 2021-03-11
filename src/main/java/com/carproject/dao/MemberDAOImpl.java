package com.carproject.dao;


import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.carproject.domain.MemberVO;
import com.google.cloud.storage.BlobId;
import com.google.cloud.storage.BlobInfo;
import com.google.cloud.storage.Storage;
import com.google.cloud.storage.StorageOptions;



@Repository("memberDAO")
public class MemberDAOImpl implements MemberDAO{

	@Autowired
	private SqlSessionTemplate mybatis;
	

	@Override
	public int memberInsert(MemberVO vo) {
		System.out.println("===>  MemberMapper userInsert() 호출");
		return mybatis.insert("MemberMAP.insertMember", vo);
	}
	
	@Override
	public MemberVO checkUniqueId(MemberVO vo) {
		System.out.println("===> MemberMapper checkUniqueId 호출");
		return mybatis.selectOne("MemberMAP.checkUniqueId", vo);
	}
	
	public String checkAuth(MemberVO vo) {					// 관리자 권한을 갖고 있는지 확인 (admin 메뉴 노출 여부)
		System.out.println("===> MemberMapper checkAuth 호출");
		return mybatis.selectOne("MemberMAP.checkAuth", vo);
	}

	@Override
	public MemberVO selectByGoogle(MemberVO vo) {
		System.out.println("===> MemberMapper selectByGoogle 호출");
		return mybatis.selectOne("MemberMAP.selectByGoogle", vo);
	}
	
	@Override
	public MemberVO selectByEmail(MemberVO vo) {
		System.out.println("===> MemberMapper selectByEmail 호출");
		return mybatis.selectOne("MemberMAP.selectByEmail", vo);
	}

	@Override
	public int addGoogle(MemberVO vo) {
		System.out.println("===>  MemberMapper addGoogle() 호출");
		return mybatis.insert("MemberMAP.addGoogle", vo);
	}
	
	
	
	
	@Override
	public List<HashMap<String, Object>> selectAllsale(MemberVO vo) {
		System.out.println("===>  MemberMapper selectAllsale() 호출");
		return mybatis.selectList("MemberMAP.selectAllsale", vo);
	} 
	@Override
	public List<HashMap<String, Object>> selectMySale(HashMap<String, Object> map) {
		System.out.println("===>  MemberMapper selectMySale() 호출");
		return mybatis.selectList("MemberMAP.selectMySale", map);
	}

	
	

	@Override
	public List<HashMap<String, Object>> allMember() {
	    System.out.println("===> MemberMapper checkUniqueId  호출");
	    return mybatis.selectList("MemberMAP.allMember");
	}
	
	@Override
	public MemberVO pickUserById(String id) {
		System.out.println("===> MemberMapper checkUniqueId  호출");
		return mybatis.selectOne("MemberMAP.pickUserById", id);
	}
	
	@Override
	public void updateMember(MemberVO vo) {
		mybatis.update("MemberMAP.updateMember", vo);
	}
	
	@Override
	public List<HashMap<String, Object>> allAdmin() {
	    System.out.println("===> MemberMapper checkUniqueId  호출");
	    return mybatis.selectList("MemberMAP.allAdmin");
	}
	
	@Override
	public void updateAuthAdmin(String id) {
		mybatis.selectOne("MemberMAP.updateAuthAdmin", id);
	}
	
	@Override
	public void updateAuthUser(String id) {
		mybatis.selectOne("MemberMAP.updateAuthUser", id);
	}
	
	@Override
	public List<HashMap<String, Object>> allBlacklist() {
	    System.out.println("===> MemberMapper checkUniqueId  호출");
	    return mybatis.selectList("MemberMAP.allBlacklist");
	}
	
	@Override
	public void setBlacklist(String id) {
		mybatis.selectOne("MemberMAP.setBlacklist", id);
	}
	
	@Override
	public void setNormal(String id) {
		mybatis.selectOne("MemberMAP.setNormal", id);
	}

	@Override
	public int updatePhoto(MemberVO vo) {
		System.out.println("===>  MemberMapper updatePhoto() 호출");
		return mybatis.update("MemberMAP.updatePhoto", vo);
	}


	@Override
	public void insertImg (String projectId, String bucketName, String objectName, String filePath) throws Exception{
		Storage storage = StorageOptions.newBuilder().setProjectId(projectId).build().getService();
		BlobId blobId = BlobId.of(bucketName, objectName);
		BlobInfo blobInfo = BlobInfo.newBuilder(blobId).setContentType("image/png").build();
		storage.create(blobInfo, Files.readAllBytes(Paths.get(filePath)));
		
		System.out.println("File " + filePath + " uploaded to bucket " + bucketName + " as " + objectName);		
	}

	


	

}
