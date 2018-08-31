<table id="orgManagerDg" style="width:98%;height:100%"></table> <div id="orgManagerToolbar" style="padding: 5px;"> <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="orgManager.new()">新增</a> <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="orgManager.edit()">编辑</a> <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="orgManager.destroy()">删除</a> </div> <div id="orgManagerDlg" class="easyui-dialog" style="width:400px" data-options="closed:true,modal:true,border:'thin',buttons:'#orgManagerDlgButtons'"> <form id="orgManagerFm" method="post" novalidate style="margin:0;padding:20px 50px"> <div hidden style="margin-bottom:10px"> <input name="orgId" class="easyui-textbox" label="机构ID:" style="width:100%"> </div> <div style="margin-bottom:10px"> <input name="orgName" class="easyui-textbox" label="机构名:" style="width:100%"> </div> <div style="margin-bottom:10px"> <input name="parentOrgId" class="easyui-textbox" label="父机构ID:" style="width:100%"> </div> <div style="margin-bottom:10px"> <input name="sortNo" class="easyui-textbox" label="排序:" style="width:100%"> </div> <div style="margin-bottom:10px"> <input name="createTime" class="easyui-datetimebox" label="创建时间:" style="width:100%"> </div> </form> </div> <div id="orgManagerDlgButtons"> <a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok" onclick="orgManager.save()" style="width:90px">保存</a> <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#orgManagerDlg').dialog('close')" style="width:90px">取消</a> </div> <script type="text/javascript"> var orgManager = datagrid({ menuName: 'orgManager', menuTitle: '机构管理', pk: 'orgId', columns: [[ { field: 'orgId', title: '机构ID', width: 50, hidden: true, }, { field: 'orgName', title: '机构名', width: 50, }, { field: 'parentOrgId', title: '父机构ID', width: 50, }, { field: 'sortNo', title: '排序', width: 50, }, { field: 'createTime', title: '创建时间', width: 50, formatter: dateFormatter, }, ]], api: { save: '/org/save', delete: '/org/delete', update: '/org/update', query: '/org/query' } }); $(function () { orgManager.initTable(); }); </script>