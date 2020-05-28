package com.lyj.system.service.impl;

import com.lyj.common.core.utils.StringUtils;
import com.lyj.system.api.domain.SysRole;
import com.lyj.system.mapper.SysRoleMapper;
import com.lyj.system.service.ISysRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

/**
 * 角色 业务层处理
 * 
 * @author ruoyi
 */
@Service
public class SysRoleServiceImpl implements ISysRoleService
{
    @Autowired
    private SysRoleMapper roleMapper;


    /**
     * 根据用户ID查询权限
     * 
     * @param userId 用户ID
     * @return 权限列表
     */
    @Override
    public Set<String> selectRolePermissionByUserId(Long userId)
    {
        List<SysRole> perms = roleMapper.selectRolePermissionByUserId(userId);
        Set<String> permsSet = new HashSet<>();
        for (SysRole perm : perms)
        {
            if (StringUtils.isNotNull(perm))
            {
                permsSet.addAll(Arrays.asList(perm.getRoleKey().trim().split(",")));
            }
        }
        return permsSet;
    }




}
