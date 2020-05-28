package com.lyj.system.mapper;

import com.lyj.system.api.domain.SysUser;

/**
 * 用户表 数据层
 * 
 * @author ruoyi
 */
public interface SysUserMapper
{

    /**
     * 通过用户名查询用户
     * 
     * @param userName 用户名
     * @return 用户对象信息
     */
    public SysUser selectUserByUserName(String userName);

}
