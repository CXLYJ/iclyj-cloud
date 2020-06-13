package com.lyj.system.controller;

import com.lyj.common.core.domain.R;
import com.lyj.common.core.web.controller.BaseController;
import com.lyj.common.core.web.domain.AjaxResult;
import com.lyj.common.security.config.IclyjInner;
import com.lyj.common.security.utils.SecurityUtils;
import com.lyj.system.api.domain.SysUser;
import com.lyj.system.api.model.UserInfo;
import com.lyj.system.service.ISysPermissionService;
import com.lyj.system.service.ISysUserService;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.web.bind.annotation.*;
import java.util.Set;

/**
 * 用户信息
 * 
 * @author ruoyi
 */
@RestController
@RequestMapping("/user")
public class SysUserController extends BaseController
{
    @Autowired
    private ISysUserService userService;

    @Autowired
    private ISysPermissionService permissionService;


    /**
     * 获取当前用户信息
     */
    @IclyjInner
    @GetMapping("/info/{username}")
    public R<UserInfo> info(@PathVariable("username") String username)
    {
        SysUser sysUser = userService.selectUserByUserName(username);
        // 角色集合
        Set<String> roles = permissionService.getRolePermission(sysUser.getUserId());
        // 权限集合
        Set<String> permissions = permissionService.getMenuPermission(sysUser.getUserId());
        UserInfo sysUserVo = new UserInfo();
        sysUserVo.setSysUser(sysUser);
        sysUserVo.setRoles(roles);
        sysUserVo.setPermissions(permissions);
        return R.ok(sysUserVo);
    }

    /**
     * 获取用户信息
     *
     * @return 用户信息
     */
    @GetMapping("getInfo")
    public AjaxResult getInfo()
    {
        Long userId = SecurityUtils.getLoginUser().getUserId();
        // 角色集合
        Set<String> roles = permissionService.getRolePermission(userId);
        // 权限集合
        Set<String> permissions = permissionService.getMenuPermission(userId);
        AjaxResult ajax = AjaxResult.success();
//        ajax.put("user", userService.selectUserById(userId));
        ajax.put("roles", roles);
        ajax.put("permissions", permissions);
        return ajax;
    }

}
