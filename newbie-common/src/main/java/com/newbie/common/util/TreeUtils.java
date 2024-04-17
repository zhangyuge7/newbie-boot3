package com.newbie.common.util;


import java.util.*;
import java.util.function.BiConsumer;
import java.util.function.Function;
import java.util.stream.Collectors;

/**
 * 无侵入方式生成新的树形状结构数据
 * <pre>
 *     功能：
 *          1：对象数组或map数组 <==>树形状结构数组
 *          2：对象数组和map数组查找指定节点的顺序上层节点对象数组
 *          3：对象数组或map数组==>筛选指定属性的对象
 *     特点：
 *          1.不会重新创造对象
 *          2.不改变对象排序，若要排序，请先排序好再使用
 *          3.仅仅需要jdk8就可以运行，不需要引入其他包
 *          4.自测通过，效率不差。(三万条 List<Map> 数据的用时对比，下边 0.038 秒，对比递归遍历来源数组 30.917 秒)
 *                            (三万条 List<T> 数据用时对比，下边 0.119 秒，对比递归遍历来源数组 10.349 秒)
 *          5.都是基于java.util的特定处理代码，不太复杂
 *     使用：
 *          1.实体对象数组使用的例子:TreeUtils.list2Tree(myObjectList,MyObject::getId,MyObject::getParentId,MyObject::getSonList)
 *          2.Map对象数组使用的例子:TreeUtils.list2Tree(mapList,"id","parentId","child")
 *     疑问：
 *          1.总数不对可能因为环形结构的节点被抛弃
 *          2.总数不对可能因为有父节点 id 但父节点不存在的节点会被抛弃
 *          3.完全不支持多线程处理同一个源数据数组
 *      说明：
 *          所见即所得，希望你觉得好用。良心若不痛，删掉作者信息，占为己用都不碍事。
 *
 *      补充：
 *          date：2023-11-20
 *          updateBy：ZhangYuGe
 *          1、之前：仅支持单根节点树组装；    现在：支持多根节点树；
 *          2、之前：根节点的 pid 必须为 null； 现在：任何值
 *          3、之前：字段必须为 String 类型；   现在：任何类型，一般仅为基本数据类型及 String，基本类型最好为包装类。
 *          4、之前：必须初始化子节点存储容器；  现在：可选初始化子节点存储容器。
 *          5、之前：树转列表没有将 child 清空；现在：可选是否清空 child
 *          6、移除【对象数组或map数组==>筛选指定属性的对象】
 *
 * </pre>
 *
 * @Author: JunOneWolf
 * @version 1.0
 * @Date: 2022-04-15
 */

public class TreeUtils {
    private TreeUtils() {
    }

    /**
     * 递归往上查找节点，可防止环形结构导致的无限制递归
     *
     * @param srcArray      单列表节点
     * @param equalsId      目标查找id
     * @param idField       查找的字段
     * @param parentIdField 父节点字段
     * @param <T>           泛型
     * @return 上层对象节点数组(父, 爷顺序往上)
     */
    public static <T> List<T> findParentListById(Object equalsId, List<T> srcArray, Function<T, ?> idField, Function<T, ?> parentIdField) {
        List<T> result = new ArrayList<>();
        if (srcArray == null || srcArray.isEmpty() || idField == null || parentIdField == null) {
            return result;
        }
        Map<Object, Object> idAndParentIdMap = new HashMap<>(srcArray.size());
        Map<Object, T> map = new HashMap<>(srcArray.size());
        for (T t : srcArray) {
            if (t != null) {
                Object id = idField.apply(t);
                Object parentId = parentIdField.apply(t);
                if (!isEmpty(id)) {
                    map.put(id, t);
                    if (!isEmpty(parentId)) {
                        idAndParentIdMap.put(id, parentId);
                    }
                }
            }
        }
        List<Object> userIdList = new ArrayList<>();
        findParentListByMap(userIdList, equalsId, idAndParentIdMap);
        userIdList.forEach(s -> result.add(map.get(s)));
        return result.stream().filter(Objects::nonNull).collect(Collectors.toList());
    }

    /**
     * 递归往上查找节点，可防止环形结构导致的无限制递归
     *
     * @param srcArray      单列表节点
     * @param idObj         目标查找id
     * @param idField       查找的字段
     * @param parentIdField 父节点字段
     * @return 顺序的上层对象节点数组
     */
    public static <T1, T2> List<Map<T1, T2>> findParentListById(Object idObj, List<Map<T1,T2>> srcArray, String idField, String parentIdField) {
        List<Map<T1, T2>> result = new ArrayList<>();
        if (srcArray == null || srcArray.isEmpty() || idObj == null || isEmpty(idField) || isEmpty(parentIdField)) {
            return result;
        }
        Map<Object, Object> idAndParentIdMap = new HashMap<>(srcArray.size());
        Map<String, Map<T1, T2>> map = new HashMap<>(srcArray.size());

        for (Object obj : srcArray) {
            if (obj != null) {
                Map t = (Map) obj;
                Object id = t.get(idField);
                Object parentId = t.get(parentIdField);
                if (!isEmpty(id)) {
                    map.put(id.toString(), t);
                    if (!isEmpty(parentId)) {
                        idAndParentIdMap.put(id.toString(), parentId.toString());
                    }
                }
            }
        }
        String equalsId = idObj.toString();
        List<Object> userIdList = new ArrayList<>();
        findParentListByMap(userIdList, equalsId, idAndParentIdMap);
        userIdList.forEach(s -> result.add(map.get(s)));
        return result.stream().filter(Objects::nonNull).collect(Collectors.toList());
    }


    /**
     * 树形状结构转化为数组
     *
     * @param srcList    来源数组
     * @param childField 属性字段
     * @param childSetField 用于删除子节点，如果为空，则不设置
     * @param <T>        泛型
     * @return 对象数组
     */
    public static <T> List<T> treeToList(List<T> srcList, Function<T, ? extends List<T>> childField,BiConsumer<T, List<T>> childSetField) {
        if (srcList == null || srcList.isEmpty() || childField == null) {
            return srcList;
        } else {
            List<T> resultList = new ArrayList<>(srcList.size());
            for (T t : srcList) {
                findAllSonByChildField(t, resultList, childField);
            }
            if(childSetField != null){
                resultList.forEach(item->childSetField.accept(item,null));
            }
            return resultList;
        }
    }

    /**
     * 树形状转化单一列表
     *
     * @param srcList    来源对象
     * @param childField 子节点对象
     * @param removeChild 移除子节点
     * @param <T1>       泛型
     * @param <T2>       泛型
     * @return 单列表数组
     */
    public static <T1, T2> List<Map<T1, T2>> treeToList(List<Map<T1, T2>> srcList, String childField, boolean removeChild) {
        if (srcList == null || srcList.isEmpty() || isEmpty(childField)) {
            return srcList;
        } else {
            List<Map<T1, T2>> resultList = new ArrayList<>(srcList.size());
            for (Object obj : srcList) {
                Map t = (Map) obj;
                findAllSonByChildField(t, resultList, childField);
            }
            if(removeChild){
                resultList.forEach(item->item.put((T1)childField,null));
            }
            return resultList;
        }
    }


    private static <T1, T2> List<Map<T1, T2>> list2Tree(List<Map<T1, T2>> srcList, String idName, String parentIdName, String childName, Object rootParentValue) {
        if (idName.equals(parentIdName) || idName.equals(childName) || parentIdName.equals(childName)) {
            throw new RuntimeException("编码异常，三个字段不能任意相等");
        }
        List<Map<T1, T2>> resultList = new ArrayList<>();
        Map<String, List<Map<T1, T2>>> parentIdAndObjListMap = new HashMap<>(srcList.size());
        for (Object obj : srcList) {
            Map<T1, T2> map = (Map<T1, T2>) obj;
            if (map == null || isEmpty(map.get(idName))) {
                continue;
            }
            if (Objects.equals(map.get(parentIdName), rootParentValue)) {
                resultList.add(map);
            } else {
                List<Map<T1, T2>> tempList = parentIdAndObjListMap.computeIfAbsent(map.get(parentIdName) == null ? "null" : map.get(parentIdName).toString(), k -> new ArrayList<>());
                tempList.add(map);
            }
        }
        for (Map<T1, T2> s : resultList) {
            insertSonList2ChildAttribute(s, parentIdAndObjListMap, idName, childName);
        }
        return resultList;

    }

    /**
     * 生成树形状结构数据
     *
     * @param srcList      对象数组
     * @param idName       当前节点标识
     * @param parentIdName 上层节点标识
     * @param childName    存储的子节点数组
     * @return 目标对象
     */
    public static <T1, T2> List<Map<T1, T2>> listToTree(List<Map<T1, T2>> srcList, String idName, String parentIdName, String childName) {
        if (srcList == null || srcList.isEmpty() || isEmpty(idName) || isEmpty(parentIdName) || isEmpty(childName)) {
            return srcList;
        }
        // 查找所有根节点的父级值
        List<?> idList = srcList.stream().map(item -> item.get(idName)).distinct().collect(Collectors.toList());
        List<?> rootParentValueList = srcList
                .stream()
                .map(item -> item.get(parentIdName))
                .filter(t -> !idList.contains(t))
                .distinct()
                .collect(Collectors.toList());

        List<Map<T1, T2>> ts = new ArrayList<>();
        rootParentValueList.forEach(rootParentValue ->
                ts.addAll(list2Tree(srcList, idName, parentIdName, childName, rootParentValue))
        );
        return ts;

    }

    private static <T> List<T> list2Tree(List<T> srcList, Function<T, ?> idField, Function<T, ?> parentIdField, Function<T, ? extends List<T>> childField, BiConsumer<T, List<T>> childSetField, Object rootParentValue) {
        List<T> resultList = new ArrayList<>(srcList.size());
        Map<String, List<T>> parentIdAndObjListMap = new HashMap<>(srcList.size());
        for (T t : srcList) {
            if (t == null || isEmpty(idField.apply(t))) {
                continue;
            }

            if (childSetField == null && childField.apply(t) == null) {
                throw new RuntimeException("编码异常，实体必须初始化，比如：private List child = new ArrayList ();");
            }

            Object parentId = parentIdField.apply(t);
            if (Objects.equals(rootParentValue, parentId)) {
                resultList.add(t);
            } else {
                List<T> tempList = parentIdAndObjListMap.computeIfAbsent(String.valueOf(parentId), k -> new ArrayList<>());
                tempList.add(t);
            }
        }
        resultList.forEach(s -> insertSonList2ChildAttribute(s, parentIdAndObjListMap, idField, childField, childSetField));
        return resultList;
    }

    /**
     * 生成树形状数组
     *
     * @param srcList       源数组
     * @param idField       字段
     * @param parentIdField 父字段
     * @param childField    子节点的存储位置
     * @param childSetField 子节点赋值字段,如果为空，则子节点必须初始化，比如：private List child = new ArrayList ();
     * @param <T>           泛型
     * @return 新的结构后数据数组
     */
    public static <T> List<T> listToTree(List<T> srcList, Function<T, ?> idField, Function<T, ?> parentIdField, Function<T, ? extends List<T>> childField, BiConsumer<T, List<T>> childSetField) {
        if (srcList == null || srcList.isEmpty() || idField == null || parentIdField == null || childField == null) {
            return srcList;
        }

        // 查找所有根节点的父级值
        List<?> idList = srcList.stream().map(idField).distinct().collect(Collectors.toList());
        List<?> rootParentValueList = srcList
                .stream()
                .map(parentIdField)
                .filter(t -> !idList.contains(t))
                .distinct()
                .collect(Collectors.toList());

        List<T> ts = new ArrayList<>();
        rootParentValueList.forEach(rootParentValue ->
                ts.addAll(list2Tree(srcList, idField, parentIdField, childField, childSetField, rootParentValue))
        );
        return ts;
    }

    private static <T> void insertSonList2ChildAttribute(T t, Map<String, List<T>> parentIdAndObjListMap, Function<T, ?> idField, Function<T, ? extends List<T>> childField, BiConsumer<T, List<T>> childSetField) {
        Object id = idField.apply(t);
        List<T> tempObjList = parentIdAndObjListMap.get(String.valueOf(id));
        if (tempObjList != null) {
            if (childField.apply(t) == null && childSetField != null) {
                childSetField.accept(t, new ArrayList<>());
            }
            childField.apply(t).addAll(tempObjList);
            for (T tempObj : tempObjList) {
                insertSonList2ChildAttribute(tempObj, parentIdAndObjListMap, idField, childField, childSetField);
            }
        }
    }

    private static void insertSonList2ChildAttribute(Map t, Map allList, String idName, String childName) {
        String id = t.get(idName) == null ? "null" : t.get(idName).toString();
        List mapList = (List) allList.get(id);
        if (mapList != null) {
            t.put(childName, mapList);
            for (Object o : mapList) {
                insertSonList2ChildAttribute((Map) o, allList, idName, childName);
            }
        }
    }

    private static boolean isEmpty(Object obj) {
        return obj == null || obj.toString().isEmpty();
    }

    private static void findParentListByMap(List<Object> userIdList, Object id, Map<Object, Object> idAndParentIdMap) {
        if (idAndParentIdMap.containsKey(id)) {
            Object parentId = idAndParentIdMap.get(id);
            //防止环形数据
            if (userIdList.contains(parentId)) {
                return;
            }
            userIdList.add(parentId);
            findParentListByMap(userIdList, parentId, idAndParentIdMap);
        }

    }

    private static <T> void findAllSonByChildField(T t, List<T> keepList, Function<T, ? extends List<T>> childField) {
        keepList.add(t);
        if (t == null) {
            return;
        }
        List<T> childSon = childField.apply(t);
        if (childSon != null) {
            for (T tempObject : childSon) {
                findAllSonByChildField(tempObject, keepList, childField);
            }
        }
    }

    private static void findAllSonByChildField(Map t, List keepList, String childField) {
        keepList.add(t);
        if (t == null) {
            return;
        }
        List<Map> childSon = (List<Map>) t.get(childField);
        if (childSon != null) {
            for (Map tempObject : childSon) {
                findAllSonByChildField(tempObject, keepList, childField);
            }
        }
    }


}