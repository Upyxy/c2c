package com.c2c.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.c2c.dao.GoodsMapper;
import com.c2c.pojo.Goods;
import com.c2c.pojo.User;
import com.c2c.service.GoodsService;
import com.c2c.util.DateUtil;
/**
 * 对商品的操作类（增删改查）
 * @ClassName 	GoodServiceImpl
 *
 */

@Service("goodsService")
public class GoodsServiceImpl implements GoodsService {

    @Resource
    private GoodsMapper goodsMapper;

    public int addGood(Goods goods , Integer duration) {
        String startTime = DateUtil.getNowDay();
        String endTime = DateUtil.getLastTime(startTime, duration);
        String polishTime = startTime;
        //添加上架时间，下架时间，擦亮时间
        goods.setPolishTime(polishTime);
        goods.setEndTime(endTime);
        goods.setStartTime(startTime);
        goods.setGood_status(0);
        return goodsMapper.insert(goods);
    }

    public Goods getGoodsByPrimaryKey(Integer goodsId) {
        Goods goods = goodsMapper.selectByPrimaryKey(goodsId);
        return goods;
    }

    public void deleteGoodsByPrimaryKey(Integer id) {
        goodsMapper.deleteByPrimaryKey(id);
    }

    public List<Goods> getAllGoods() {
        List<Goods> goods = goodsMapper.selectAllGoods();
        return goods;
    }

    public List<Goods> searchGoods(String name, String describle) {
        List<Goods> goods = goodsMapper.searchGoods(name,describle);
        return  goods;
    }

    public List<Goods> getGoodsByCatelog(Integer id,String name,String describle) {
        List<Goods> goods = goodsMapper.selectByCatelog(id,name,describle);
        return goods;
    }

    public void updateGoodsByPrimaryKeyWithBLOBs(int goodsId,Goods goods) {
        goods.setId(goodsId);
        this.goodsMapper.updateByPrimaryKeyWithBLOBs(goods);
    }

    public List<Goods> getGoodsByCatelogOrderByDate(Integer catelogId,Integer limit) {
        List<Goods> goodsList = goodsMapper.selectByCatelogOrderByDate(catelogId , limit);
        return goodsList;
    }

    public List<Goods> getGoodsByUserId(Integer user_id) {
        List<Goods> goodsList = goodsMapper.getGoodsByUserId(user_id);
        return goodsList;
    }
    /**
	 * 管理端商品列表
	 */
    public List<Goods> getGoodsLists(String keyword, int currentPage,
			int pageSize) {
		 List<Goods> goodsList = goodsMapper.AllGoddsList(keyword,currentPage,pageSize);
		return goodsList;
	}

	@Override
	public int getKeywordCount(String keyword) {
		int i =goodsMapper.AllGoddsListCount(keyword);
		return i;
	}

	@Override
	public List<Goods> GoodsListsSh(String keyword, int currentPage,
			int pageSize) {
		 List<Goods> goodsList = goodsMapper.AllGoddsListSh(keyword,currentPage,pageSize);
		return goodsList;
	}

	@Override
	public int getKeywordCountSh(String keyword) {
		int i =goodsMapper.AllGoddsListCountSh(keyword);
		return i;
	}
	
	public int updateStatusBygoodsId(int id){
		return goodsMapper.updateStatusBygoodsId(id);
	}

	@Override
	public int updateGoodsStatusBygoodsId(String good_status, int id) {
		
		return goodsMapper.updateGoodsStatusBygoodsId(good_status, id);
	}

}