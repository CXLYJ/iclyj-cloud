package com.lyj.system.controller;

import com.lyj.common.core.utils.StringUtils;
import com.lyj.common.core.web.controller.BaseController;
import com.lyj.common.core.web.domain.AjaxResult;
import com.lyj.common.core.web.page.TableDataInfo;
import com.lyj.system.domain.SysClientDetails;
import com.lyj.system.service.ISysClientDetailsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @author ：lyj
 * @email: : iclyj@iclyj.cn
 * @date ：2020/6/10 22:56
 *
 * 授权表信息操作
 */
@RestController
@RequestMapping("/client")
public class SysClientDetailsController extends BaseController
{

    @Autowired
    private ISysClientDetailsService sysClientDetailsService;

    /**
     * 查询终端配置列表
     */
    @PreAuthorize("@ss.hasPermi('system:client:list')")
    @GetMapping("/list")
    public TableDataInfo list(SysClientDetails sysClientDetails)
    {
        startPage();
        List<SysClientDetails> list = sysClientDetailsService.selectSysClientDetailsList(sysClientDetails);
        return getDataTable(list);
    }

    /**
     * 获取终端配置详细信息
     */
//    @PreAuthorize("@ss.hasPermi('system:client:query')")
    @GetMapping(value = "/{clientId}")
    public AjaxResult getInfo(@PathVariable("clientId") String clientId)
    {
        return AjaxResult.success(sysClientDetailsService.selectSysClientDetailsById(clientId));
    }

    /**
     * 新增终端配置
     */
//    @PreAuthorize("@ss.hasPermi('system:client:add')")
    @PostMapping
    public AjaxResult add(@RequestBody SysClientDetails sysClientDetails)
    {
        String clientId = sysClientDetails.getClientId();
        if (StringUtils.isNotNull(sysClientDetailsService.selectSysClientDetailsById(clientId)))
        {
            return AjaxResult.error("新增终端'" + clientId + "'失败，编号已存在");
        }
        return toAjax(sysClientDetailsService.insertSysClientDetails(sysClientDetails));
    }

    /**
     * 修改终端配置
     */
//    @PreAuthorize("@ss.hasPermi('system:client:edit')")
    @PutMapping
    public AjaxResult edit(@RequestBody SysClientDetails sysClientDetails)
    {
        return toAjax(sysClientDetailsService.updateSysClientDetails(sysClientDetails));
    }

    /**
     * 删除终端配置
     */
//    @PreAuthorize("@ss.hasPermi('system:client:remove')")
    @DeleteMapping("/{clientIds}")
    public AjaxResult remove(@PathVariable String[] clientIds)
    {
        return toAjax(sysClientDetailsService.deleteSysClientDetailsByIds(clientIds));
    }

}
