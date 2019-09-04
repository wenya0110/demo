package com.demo.service.admin;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.demo.dao.admin.AdminProductDao;
import com.demo.dao.admin.AdminSkuDao;
import com.demo.po.Product;
import com.demo.po.Sku;

@Service
public class AdminProductServiceImpl implements AdminProductService {
	@Autowired
	AdminProductDao dao;
	@Autowired
	AdminSkuDao skudao;

	@Override
	public List<Product> getByPage(Integer page) {
		List<Product> list = dao.getByPage((page - 1) * 5);
		for (Product p : list) {
			if(p.getImg_url()!=null)
				p.setImgs(p.getImg_url().split(","));
		}
		return list;
	}

	@Override
	@Transactional
	public void addone(Product p) {
		p.setIs_hot(p.getIs_hot() == null ? false : true); // 是否热卖
		p.setIs_new(p.getIs_new() == null ? false : true); // 是否新品
		p.setIs_commend(p.getIs_commend() == null ? false : true); // 是否推荐
		// ---------以下对接收到的商品图片信息数组进行拼串，存入img_url-------------------
		String img_url = "";
		if (p.getImgs() != null && p.getImgs().length > 0) {
			for (String s : p.getImgs())
				img_url += s + ",";
			img_url = img_url.substring(0, img_url.length() - 1);
			p.setImg_url(img_url);
		}
		// ----------以下对接收到的商品描述的图片信息数组进行拼串，存入description-----------------
		String desc_url = "";
		if (p.getDescurlarr() != null && p.getDescurlarr().length > 0) {
			for (String s : p.getDescurlarr())
				desc_url += s + ",";
			desc_url = desc_url.substring(0, desc_url.length() - 1);
			p.setDescription(desc_url);
		}
		// -----------颜色数组进行拼串----------------
		String colors = "";
		if (p.getColorarr() != null && p.getColorarr().length > 0) {
			for (String s : p.getColorarr())
				colors += s + ",";
			colors = colors.substring(0, colors.length() - 1);
			p.setColors(colors);
		}
		// -----------size数组进行拼串----------------
		String sizes = "";
		if (p.getSizearr() != null && p.getSizearr().length > 0) {
			for (String s : p.getSizearr())
				sizes += s + ",";
			sizes = sizes.substring(0, sizes.length() - 1);
			p.setSizes(sizes);
		}
		System.out.println("service中修改参数后：" + p);
		dao.addone(p);
		System.out.println("---添加商品，返回的商品id:"+p.getId()+"--------");
		//添加库存
		for( String color : p.getColorarr()  ){
			for( String size : p.getSizearr() ){
				Sku sku = new Sku();
				
				sku.setColorId( Long.parseLong(color) );
				sku.setProductId( p.getId() );
				System.out.println("---------曾令国-----"+p.getId());
				sku.setSize(size);
				System.out.println("------曾令国-----------"+sku);
				skudao.addone_sku(sku);
				System.out.println("==添加库存信息:"+sku+"==");
			}
		}
		
		
	}

	@Override
	public int getsize() {
		// TODO Auto-generated method stub
		return dao.getsize();
	}

	@Override
	public List<Product> getByCondition(Map<String, Object> m) {
		// TODO Auto-generated method stub
		List<Product> list = dao.getByCondition(m);
		for (Product p : list) {
			if(p.getImg_url()!=null)
				p.setImgs(p.getImg_url().split(","));
		}
		return list;
	}

	

}
