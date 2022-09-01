package com.example.demo.proxy.modeling;

import com.example.demo.model.modeling.CalendarDetail;
import org.springframework.util.ObjectUtils;
import xyz.erupt.annotation.fun.DataProxy;

/**
 * @author 一只闲鹿
 */
public class CalendarDetailDataProxy implements DataProxy<CalendarDetail> {

    @Override
    public void beforeAdd(CalendarDetail calendarDetail) {
        validateNotNull(calendarDetail);
    }

    @Override
    public void beforeUpdate(CalendarDetail calendarDetail) {
        validateNotNull(calendarDetail);
    }

    private void validateNotNull(CalendarDetail calendarDetail) {
        if (ObjectUtils.isEmpty(calendarDetail.getStartTime())) {
            throw new RuntimeException("操作失败：开始日期必填");
        }
        Boolean cyclePeriod = calendarDetail.getCyclePeriod();
        // 循环
        if (cyclePeriod) {
            if (ObjectUtils.isEmpty(calendarDetail.getPeriod())) {
                throw new RuntimeException("操作失败：周期必填");
            }
            if (ObjectUtils.isEmpty(calendarDetail.getTimeInterval())) {
                throw new RuntimeException("操作失败：间隔必填");
            }
            if (ObjectUtils.isEmpty(calendarDetail.getDays())) {
                throw new RuntimeException("操作失败：天数必填");
            }
        } else {
            // 固定日期
            if (ObjectUtils.isEmpty(calendarDetail.getEndTime())) {
                throw new RuntimeException("操作失败：结束日期必填");
            }
        }
    }
}
