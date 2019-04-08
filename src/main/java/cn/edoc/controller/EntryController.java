package cn.edoc.controller;

import cn.edoc.entity.Category;
import cn.edoc.entity.Entry;
import cn.edoc.entity.Page;
import cn.edoc.service.EntryService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

@Controller
@RequestMapping("/entry")
public class EntryController {

    @Resource
    private EntryService entryService;

    @RequestMapping("/list")
    public String list(@RequestParam(required = false,defaultValue = "0") long categoryId , @RequestParam(required = false) Integer currPageNo, Model model){
        List<Category> categoryList = entryService.getAllCategoryName();
        int totalCount = entryService.getEntryTotalCount(categoryId);
        Page page = new Page();
        currPageNo = currPageNo == null ? 1 :currPageNo;  //当前页码
        page.setCurrentPageNo(currPageNo);
        page.setPageSize(3);
        page.setTotalCount(totalCount);
        Integer startPos = (page.getCurrentPageNo() - 1) * page.getPageSize();
        List<Entry> entryList = entryService.getEntryByCategoryId(categoryId,startPos,page.getPageSize());
        model.addAttribute("categoryList",categoryList);
        model.addAttribute("page",page);
        model.addAttribute("entryList",entryList);
        model.addAttribute("categoryId",categoryId);
        return "entryList";
    }

    @RequestMapping(value = "/del")
    @ResponseBody
    public Integer del(@RequestParam("id") Integer id){

        int res = entryService.delEntryById(id);
        if(res > 0){
            return res;
        }else{
            return 0;
        }
    }

    @RequestMapping("/doAdd")
    public String goToAdd(Model model){
        List<Category> categoryList = entryService.getAllCategoryName();
        model.addAttribute("categoryList",categoryList);
        return "addEntry";
    }

    @RequestMapping(value = "/addEntry")
    public String addEntry(Entry entry){
        if(entry.getTitle() == null){
            return "redirect:/entry/doAdd";
        }else {
            int res = entryService.addEntry(entry);
                return "redirect:/entry/list";
        }
    }
    @RequestMapping("/toUpdate")
    public String toUp(long id,Model model){
        List<Category> categoryList = entryService.getAllCategoryName();
        Entry entry = entryService.getEntryById(id);
        model.addAttribute("entry",entry);
        model.addAttribute("categoryList",categoryList);
        return "updateEntry";
    }

    @RequestMapping("/updateEntry")
    public String Up(Entry entry,Model model){
        if(entry.getTitle() == null){
            return "redirect:/entry/toUpdate";
        }else{
            int res = entryService.updateEntry(entry);
                return "redirect:/entry/list";
        }
    }
}
