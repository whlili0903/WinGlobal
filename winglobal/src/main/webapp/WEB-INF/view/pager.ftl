<div class="row pager-control" id="pager-cont" style="margin-top: 40px;">
    <div class="col-md-4" style="margin-left:20px;float: left;">
                    每页显示:
       <select class="form-control input-sm scselect" name="pageSize" style="width:60px;">
            <option <#if pager.pageSize == 5>selected</#if> value="5">5</option>
            <#--
            <option <#if pager.pageSize == 20>selected</#if> value="20">20</option>
            <option <#if pager.pageSize == 50>selected</#if> value="50">50</option>
            <option <#if pager.pageSize == 100>selected</#if> value="100">100</option>
            -->
        </select>&nbsp;&nbsp;总记录数:${(pager.totalRecords)!0}(共${(pager.totalPages)!0}页)
        </div>
    <input name="pageNo" value="${(pager.pageNo)!0}" type="hidden" >
    <input name="pages" value="${(pager.totalPages)!0}" type="hidden" >
    <div class="col-md-8 bottom-right" style="float: right;margin-right:20px;" id="pager-menu"></div>
</div>