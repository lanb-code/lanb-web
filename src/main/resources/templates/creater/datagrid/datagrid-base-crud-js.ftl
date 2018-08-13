<@compress single_line=true>
<#--数据表格-->
<table id="${menuName}Dg" style="width:98%;height:100%"></table>
<#--工具栏-->
<div id="${menuName}Toolbar" style="padding: 5px;">
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true"
       onclick="${menuName}.new()">新增</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true"
       onclick="${menuName}.edit()">编辑</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true"
       onclick="${menuName}.destroy()">删除</a>
</div>
<#--弹窗页面-->
<div id="${menuName}Dlg" class="easyui-dialog" style="width:400px"
     data-options="closed:true,modal:true,border:'thin',buttons:'#${menuName}DlgButtons'">
<#--编辑表单-->
    <form id="${menuName}Fm" method="post" novalidate style="margin:0;padding:20px 50px">

    <#--开始遍历字段-->
        <#list columns as column>
            <#if PK == column._columnName>
            <div hidden style="margin-bottom:10px">
            <#else>
            <div style="margin-bottom:10px">
            </#if>
            <input name="${column._columnName}" class="${column.columnType}" label="${column.columnComment}:"
                   style="width:100%">
        </div>
        </#list>
    </form>
</div>
<#--操作按钮-->
<div id="${menuName}DlgButtons">
    <a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok" onclick="${menuName}.save()"
       style="width:90px">保存</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel"
       onclick="javascript:$('#${menuName}Dlg').dialog('close')" style="width:90px">取消</a>
</div>
<script type="text/javascript">
    var ${menuName} = datagrid({
        menuName: '${menuName}',
        menuTitle: '${menuTitle}',
        pk: '${PK}',
        columns: [[
        <#list columns as column>
            {
                field: '${column._columnName}',
                title: '${column.columnComment}',
                width: 50,
                    <#if PK == column._columnName>hidden: true,</#if><#if column.columnType == 'easyui-datetimebox'>formatter: dateFormatter,</#if>
            },
        </#list>]],
        api: {
            save: '/${tableName}/save',
            delete: '/${tableName}/delete',
            update: '/${tableName}/update',
            query: '/${tableName}/query'
        }
    });
    $(function () {
        ${menuName}.initTable();
    });
</script>
</@compress>