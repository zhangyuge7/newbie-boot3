<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<mapper namespace="${package.mapper}.${Entity}Mapper">

    <!-- 查询数据列表 -->
    <select id="selectList" resultType="${package.entity}.${Entity}Entity">
        SELECT
        <#list fields as field>
            <#if field_has_next>
        ${field.colName},
                <#else>
        ${field.colName}
            </#if>
        </#list>
        FROM ${tableName}
        <where>
            <#list fields as field>
                <#if field.type="String">
            <if test="entity.${field.name}!=null and entity.${field.name}!=''">AND ${field.colName} = ${r'#'}{entity.${field.name}}</if>
                <#else>
            <if test="entity.${field.name}!=null">AND ${field.colName} = ${r'#'}{entity.${field.name}}</if>
                </#if>
            </#list>
        </where>
    </select>

    <!-- 根据主键查询数据详情 -->
    <select id="selectByPkVal" resultType="${package.entity}.${Entity}Entity">
        SELECT
        <#list fields as field>
            <#if field_has_next>
                ${field.colName},
            <#else>
                ${field.colName}
            </#if>
        </#list>
        FROM ${tableName} WHERE ${pkey.colName}=${r'#'}{${pkey.name}}
    </select>

    <!-- 插入数据 -->
    <insert id="insertData">
        <trim prefix="INSERT INTO ${tableName}(" suffix=")" suffixOverrides=",">
            <#list fields as field>
                <#if field.type="String">
            <if test="${field.name}!=null and ${field.name}!=''">${field.colName},</if>
                <#else>
            <if test="${field.name}!=null">${field.colName},</if>
                </#if>
            </#list>
        </trim>
        <trim prefix="VALUES(" suffix=")" suffixOverrides=",">
            <#list fields as field>
                <#if field.type="String">
            <if test="${field.name}!=null and ${field.name}!=''">${r'#'}{${field.name}},</if>
                <#else>
            <if test="${field.name}!=null">${r'#'}{${field.name}},</if>
                </#if>
            </#list>
        </trim>
    </insert>

    <!-- 根据主键更新数据 -->
    <update id="updateByPkVal">
        UPDATE ${tableName}
        <trim prefix="SET" suffixOverrides=",">
            <#list fields as field>
                <#if !field.pk>
            <if test="${field.name}!=null">${field.colName} = ${r'#'}{${field.name}},</if>
                </#if>
            </#list>
        </trim>
        WHERE ${pkey.colName}=${r'#'}{${pkey.name}}
    </update>

    <!-- 根据主键删除数据 -->
    <delete id="deleteByPkVal">
        DELETE FROM ${tableName} WHERE ${pkey.colName}=${r'#'}{${pkey.name}}
    </delete>
</mapper>
