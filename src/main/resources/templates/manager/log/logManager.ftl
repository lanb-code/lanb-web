<table id="logManagerDg" style="width:98%;height:100%"></table> <div id="logManagerToolbar" style="padding: 5px;"> <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="logManager.new()">新增</a> <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="logManager.edit()">编辑</a> <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="logManager.destroy()">删除</a> </div> <div id="logManagerDlg" class="easyui-dialog" style="width:400px" data-options="closed:true,modal:true,border:'thin',buttons:'#logManagerDlgButtons'"> <form id="logManagerFm" method="post" novalidate style="margin:0;padding:20px 50px"> <div hidden style="margin-bottom:10px"> <input name="logId" class="easyui-textbox" label="日志ID:" style="width:100%"> </div> <div style="margin-bottom:10px"> <input name="logType" class="easyui-textbox" label="日志类型:" style="width:100%"> </div> <div style="margin-bottom:10px"> <input name="logSource" class="easyui-textbox" label="日志来源:" style="width:100%"> </div> <div style="margin-bottom:10px"> <input name="logContent" class="easyui-textbox" label="日志内容:" style="width:100%"> </div> <div style="margin-bottom:10px"> <input name="createTime" class="easyui-datetimebox" label="创建时间:" style="width:100%"> </div> </form> </div> <div id="logManagerDlgButtons"> <a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok" onclick="logManager.save()" style="width:90px">保存</a> <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#logManagerDlg').dialog('close')" style="width:90px">取消</a> </div> <script type="text/javascript"> var logManager = datagrid({ menuName: 'logManager', menuTitle: '日志管理', pk: 'logId', columns: [[ { field: 'logId', title: '日志ID', width: 50, hidden: true, }, { field: 'logType', title: '日志类型', width: 50, }, { field: 'logSource', title: '日志来源', width: 50, }, { field: 'logContent', title: '日志内容', width: 50, }, { field: 'createTime', title: '创建时间', width: 50, formatter: dateFormatter, }, ]], api: { save: '/log/save', delete: '/log/delete', update: '/log/update', query: '/log/query' } }); $(function () { logManager.initTable(); }); </script>