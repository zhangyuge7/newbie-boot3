package com.newbie.common.util;

/**
 * 驼峰式变换器
 */
public class CamelCaseConverter {

    /**
     * 将下划线命名转换为小驼峰命名。
     *
     * @param underscoreStr 下划线命名的字符串
     * @return 小驼峰命名的字符串
     */
    public static String toLowerCaseCamel(String underscoreStr) {
        StringBuilder result = new StringBuilder();
        boolean nextUpperCase = false;
        for (char c : underscoreStr.toCharArray()) {
            if (c == '_') {
                nextUpperCase = true;
            } else {
                if (nextUpperCase) {
                    result.append(Character.toUpperCase(c));
                    nextUpperCase = false;
                } else {
                    result.append(c);
                }
            }
        }
        return result.toString();
    }

    /**
     * 将下划线命名转换为大驼峰命名。
     *
     * @param underscoreStr 下划线命名的字符串
     * @return 大驼峰命名的字符串
     */
    public static String toUpperCaseCamel(String underscoreStr) {
        StringBuilder result = new StringBuilder();
        boolean nextUpperCase = true;
        for (char c : underscoreStr.toCharArray()) {
            if (c == '_') {
                nextUpperCase = true;
            } else {
                if (nextUpperCase) {
                    result.append(Character.toUpperCase(c));
                    nextUpperCase = false;
                } else {
                    result.append(c);
                }
            }
        }
        return result.toString();
    }

    /**
     * 将驼峰命名转换为下划线命名。
     *
     * @param camelStr 驼峰命名的字符串
     * @return 下划线命名的字符串
     */
    public static String toUnderscore(String camelStr) {
        StringBuilder result = new StringBuilder();
        for (char c : camelStr.toCharArray()) {
            if (Character.isUpperCase(c)) {
                result.append('_');
                result.append(Character.toLowerCase(c));
            } else {
                result.append(c);
            }
        }
        return result.toString().toUpperCase().startsWith("_") ? result.toString().substring(1) : result.toString();
    }


    public static void main(String[] args) {
        String text = "sys_dict_data";
        System.out.println(toUpperCaseCamel(text));
    }
}
