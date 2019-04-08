package cn.edoc.dao;

import cn.edoc.entity.Category;
import cn.edoc.entity.Entry;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface EntryMapper {

    List<Entry> getEntryByCategoryId(@Param("categoryId")long categoryId,@Param("startPos")int startPos,@Param("endPos")int endPos);

    List<Category> getAllCategoryName();

    Entry getEntryById(@Param("id")long id);

    Integer delEntryById(@Param("id") long id);

    int getEntryTotalCount(@Param("categoryId") long categoryId);

    int addEntry(Entry entry);

    int updateEntry(Entry entry);
}
