package com.lyj.system.service;

import com.lyj.system.api.domain.SysUser;

/**
 * 用户 业务层
 * 
 * @author ruoyi
 */
public interface ISysUserService
{

    /**
     * 通过用户名查询用户
     * 
     * @param userName 用户名
     * @return 用户对象信息
     */
    public SysUser selectUserByUserName(String userName);

}
