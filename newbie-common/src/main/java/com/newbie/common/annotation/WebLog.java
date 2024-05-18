package com.newbie.common.annotation;

import java.lang.annotation.*;

/**
 * 此注解使用在 controller 层
 * 可以使用在类上或者方法上
 *          使用在类上时，此 controller 类下的所有接口方法记录日志
 *          使用在方法上，此接口方法记录日志
 */
@Target({ElementType.TYPE, ElementType.METHOD})
@Retention(RetentionPolicy.RUNTIME)
@Documented
@Inherited
public @interface WebLog {
    String description() default "";
}
