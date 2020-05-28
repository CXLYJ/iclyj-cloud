package com.lyj.system.service;


import java.util.List;
import java.util.Set;

/**
 * 菜单 业务层
 * 
 * @author ruoyi
 */
public interface ISysMenuService
{

    /**
     * 根据用户ID查询权限
     * 
     * @param userId 用户ID
     * @return 权限列表
     */
    public Set<String> selectMenuPermsByUserId(Long userId);


}
