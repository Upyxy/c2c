package com.c2c.service.impl;

import com.c2c.dao.ImageMapper;
import com.c2c.pojo.Image;
import com.c2c.service.ImageService;

import org.springframework.stereotype.Service;

import javax.annotation.Resource;

import java.util.List;


@Service("imageService")
public class ImageServiceImpl implements ImageService {
    @Resource
    private ImageMapper imageMapper;
    public int insert(Image record) {
        return imageMapper.insert(record);
    }
    public List<Image> getImagesByGoodsPrimaryKey(Integer goodsId) {
        List<Image> image = imageMapper.selectByGoodsPrimaryKey(goodsId);
        return image;
    }
    public int deleteImagesByGoodsPrimaryKey(Integer goodsId) {
        return imageMapper.deleteImagesByGoodsPrimaryKey(goodsId);
    }
	@Override
	public int getImagesId(Integer goodsId) {
		int i = imageMapper.getImagesId(goodsId);
		return i;
	}
}
