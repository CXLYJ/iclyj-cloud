package com.lyj.system.service;

import com.lyj.system.domain.SysClientDetails;

import java.util.List;

/**
 * 授权终端配置Service接口
 * 
 * @author ruoyi
 */
public interface ISysClientDetailsService
{
    /**
     * 查询终端配置
     * 
     * @param clientId 终端配置ID
     * @return 终端配置
     */
     SysClientDetails selectSysClientDetailsById(String clientId);

    /**
     * 查询终端配置列表
     * 
     * @param sysClientDetails 终端配置
     * @return 终端配置集合
     */
     List<SysClientDetails> selectSysClientDetailsList(SysClientDetails sysClientDetails);

    /**
     * 新增终端配置
     * 
     * @param sysClientDetails 终端配置
     * @return 结果
     */
     int insertSysClientDetails(SysClientDetails sysClientDetails);

    /**
     * 修改终端配置
     * 
     * @param sysClientDetails 终端配置
     * @return 结果
     */
     int updateSysClientDetails(SysClientDetails sysClientDetails);

    /**
     * 批量删除终端配置
     * 
     * @param clientIds 需要删除的终端配置ID
     * @return 结果
     */
     int deleteSysClientDetailsByIds(String[] clientIds);

    /**
     * 删除终端配置信息
     * 
     * @param clientId 终端配置ID
     * @return 结果
     */
     int deleteSysClientDetailsById(String clientId);
}
