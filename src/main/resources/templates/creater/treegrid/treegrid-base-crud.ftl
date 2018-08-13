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
    <#--当前页面对象,防止冲突-->
    var ${menuName} =
    {
        initTable: function () {
            var self = this;
        <#--表格-->
            $('#${menuName}Dg').treegrid({
                url: "/${tableName}/queryPage",
                toolbar: "#${menuName}Toolbar",
                pagination: true,<#--是否分页-->
                rownumbers: true,<#--是否显示行号-->
                fitColumns: true,
                singleSelect: true,<#--是否单选-->
                title: "${menuTitle}",
                border: true,
                columns: [[
                    <#list columns as column>
                        {
                            field: '${column._columnName}',
                            title: '${column.columnComment}',
                            width: 50,
                                <#if PK == column._columnName>hidden: true,</#if><#if column.columnType == 'easyui-datetimebox'>formatter: dateFormatter,</#if>
                        },
                    </#list>]],
                onDblClickRow: function (index, row) {<#--双击事件-->
                    self.edit();
                }
            });
        }
    ,

    <#--新增-->
        new
    :

        function () {
            var row = $('#${menuName}Dg').treegrid('getSelected');
            $('#${menuName}Dlg').dialog('open').dialog('center').dialog('setTitle', '${menuTitle}新增');
            $('#${menuName}Fm').form('clear');
        ${menuName}
        .
            url = '/${tableName}/save';
        }

    ,

    <#--编辑-->
        edit: function () {
            var row = $('#${menuName}Dg').treegrid('getSelected');
            if (row) {
                $('#${menuName}Dlg').dialog('open').dialog('center').dialog('setTitle', '${menuTitle}编辑');
                $('#${menuName}Fm').form('load', row);
            ${menuName}
            .
                url = '/${tableName}/update';
            }
        }
    ,

    <#--保存-->
        save: function () {
            $('#${menuName}Fm').form('submit', {
                        url: ${menuName}.url,
                    onSubmit
        :

            function () {
                return $(this).form('validate');
            }

        ,
            success: function (result) {
                var result = eval('(' + result + ')');
                if (result.errorMsg) {
                    $.messager.show({
                        title: '错误',
                        msg: result.errorMsg
                    });
                } else {
                    $('#${menuName}Dlg').dialog('close');
                    $('#${menuName}Dg').treegrid('reload');
                    $.messager.show({
                        title: '信息',
                        msg: "操作成功"
                    });
                }
            }
        })
            ;
        }
    ,

    <#--删除-->
        destroy: function () {
            var row = $('#${menuName}Dg').treegrid('getSelected');
            if (row) {
                $.messager.confirm('Confirm', '确认要删除该项?', function (r) {
                    if (r) {
                    $.post('/${tableName}/delete', <#if PK??>{${PK}:
                            row.${PK}}<#else >row</#if>,
                            function (result) {
                                if (result.success) {
                                    $('#${menuName}Dg').treegrid('reload');
                                    $.messager.show({
                                        title: '信息',
                                        msg: "操作成功"
                                    });
                                } else {
                                    $.messager.show({
                                        title: '错误',
                                        msg: result.errorMsg
                                    });
                                }
                            }

                            ,
                            'json'
                    )
                        ;
                    }
                });
            }
        }
    }
    ;

    $(function () {
    ${menuName}.
        initTable();
    });

</script>
</@compress>