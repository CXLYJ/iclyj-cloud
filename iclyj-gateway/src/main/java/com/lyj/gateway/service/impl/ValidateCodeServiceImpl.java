package com.lyj.gateway.service.impl;

import com.google.code.kaptcha.Producer;
import com.lyj.common.core.constant.Constants;
import com.lyj.common.core.exception.CaptchaException;
import com.lyj.common.core.utils.IdUtils;
import com.lyj.common.core.utils.StringUtils;
import com.lyj.common.core.utils.sign.Base64;
import com.lyj.common.core.web.domain.AjaxResult;
import com.lyj.common.redis.service.RedisService;
import com.lyj.gateway.service.ValidateCodeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.FastByteArrayOutputStream;
import org.springframework.util.MultiValueMap;

import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.concurrent.TimeUnit;

/**
 * @author ：lyj
 * @email: : iclyj@iclyj.cn
 * @date ：2020/6/5
 * <p>
 * 验证码实现处理逻辑
 */
@Service
public class ValidateCodeServiceImpl implements ValidateCodeService {

    @Autowired
    private RedisService redisService;

    @Autowired
    private Producer producer;

    /**
     * 生成验证码
     *
     * @return
     * @throws IOException
     * @throws CaptchaException
     */
    @Override
    public AjaxResult createCapcha() throws IOException, CaptchaException {
        // 生成验证码
        String capText = producer.createText();
        String capStr = capText.substring(0, capText.lastIndexOf("@"));
        String verifyCode = capText.substring(capText.lastIndexOf("@") + 1);
        BufferedImage image = producer.createImage(capStr);
        // 保存验证码信息
        String uuid = IdUtils.simpleUUID();
        String verifyKey = Constants.CAPTCHA_CODE_KEY + uuid;
        //将验证码存到redis中设置2分钟的过期时间
        redisService.setCacheObject(verifyKey, verifyCode, Constants.CAPTCHA_EXPIRATION, TimeUnit.MINUTES);
        // 转换流信息写出
        FastByteArrayOutputStream os = new FastByteArrayOutputStream();
        try {
            ImageIO.write(image, "jpg", os);
        } catch (IOException e) {
            return AjaxResult.error(e.getMessage());
        }

        AjaxResult ajax = AjaxResult.success();
        ajax.put("uuid", uuid);
        ajax.put("img", Base64.encode(os.toByteArray()));
        return ajax;
    }

    /**
     * 校验验证码
     *
     * @param getQueryParams
     * @throws CaptchaException
     */
    @Override
    public void checkCapcha(MultiValueMap<String, String> getQueryParams) throws CaptchaException {
        String code = getQueryParams.getFirst("code");
        String uuid = getQueryParams.getFirst("uuid");
        if (StringUtils.isEmpty(code)) {
            throw new CaptchaException("验证码不能为空");
        }
        if (StringUtils.isEmpty(uuid)) {
            throw new CaptchaException("验证码已失效");
        }
        String verifyKey = Constants.CAPTCHA_CODE_KEY + uuid;
        //从redis中拿出验证码
        String captcha = redisService.getCacheObject(verifyKey);
        redisService.deleteObject(verifyKey);
        //校验从redis中拿出的验证码是否与前端拿出的验证码是否一致
        if (!code.equalsIgnoreCase(captcha)) {
            throw new CaptchaException("验证码错误");
        }
    }
}
