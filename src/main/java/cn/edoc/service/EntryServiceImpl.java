package cn.edoc.service;

import cn.edoc.dao.EntryMapper;
import cn.edoc.entity.Category;
import cn.edoc.entity.Entry;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("entryService")
public class EntryServiceImpl implements EntryService {
    @Resource
    private EntryMapper entryMapper;

    @Override
    public List<Entry> getEntryByCategoryId(long categoryId, int startPos, int endPos) {
        return entryMapper.getEntryByCategoryId(categoryId,startPos,endPos);
    }

    @Override
    public List<Category> getAllCategoryName() {
        return entryMapper.getAllCategoryName();
    }

    @Override
    public Integer delEntryById(long id) {
        return entryMapper.delEntryById(id);
    }

    @Override
    public int getEntryTotalCount(@Param("categoryId") long categoryId) {
        return entryMapper.getEntryTotalCount(categoryId);
    }

    @Override
    public int addEntry(Entry entry) {
        return entryMapper.addEntry(entry);
    }

    @Override
    public int updateEntry(Entry entry) {
        return entryMapper.updateEntry(entry);
    }

    @Override
    public Entry getEntryById(long id) {
        return entryMapper.getEntryById(id);
    }
}
