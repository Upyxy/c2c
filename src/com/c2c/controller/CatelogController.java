package com.c2c.controller;

import com.c2c.service.CatelogService;
import org.springframework.stereotype.Controller;

import javax.annotation.Resource;

/**
 * 分类管理
 * <p>Title:CatelogController</p>
 * <p>Description: 分类管理</p>
 * <p>Company:com.c2c</p>
 * @author Muling
 * @date 2017年10月11日 下午3:59:35
 * @version 1.0
 */
@Controller
public class CatelogController {
    @Resource
    private CatelogService catelogService;

}
