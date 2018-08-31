<table id="msgManagerDg" style="width:98%;height:100%"></table> <div id="msgManagerToolbar" style="padding: 5px;"> <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="msgManager.new()">新增</a> <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="msgManager.edit()">编辑</a> <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="msgManager.destroy()">删除</a> </div> <div id="msgManagerDlg" class="easyui-dialog" style="width:400px" data-options="closed:true,modal:true,border:'thin',buttons:'#msgManagerDlgButtons'"> <form id="msgManagerFm" method="post" novalidate style="margin:0;padding:20px 50px"> <div hidden style="margin-bottom:10px"> <input name="msgId" class="easyui-textbox" label="消息ID:" style="width:100%"> </div> <div style="margin-bottom:10px"> <input name="msgTitle" class="easyui-textbox" label="消息标题:" style="width:100%"> </div> <div style="margin-bottom:10px"> <input name="msgSource" class="easyui-textbox" label="消息来源:" style="width:100%"> </div> <div style="margin-bottom:10px"> <input name="msgDestination" class="easyui-textbox" label="消息目标:" style="width:100%"> </div> <div style="margin-bottom:10px"> <input name="lastTime" class="easyui-datetimebox" label="最后更新:" style="width:100%"> </div> <div style="margin-bottom:10px"> <input name="createTime" class="easyui-datetimebox" label="创建时间:" style="width:100%"> </div> </form> </div> <div id="msgManagerDlgButtons"> <a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok" onclick="msgManager.save()" style="width:90px">保存</a> <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#msgManagerDlg').dialog('close')" style="width:90px">取消</a> </div> <script type="text/javascript"> var msgManager = datagrid({ menuName: 'msgManager', menuTitle: '消息管理', pk: 'msgId', columns: [[ { field: 'msgId', title: '消息ID', width: 50, hidden: true, }, { field: 'msgTitle', title: '消息标题', width: 50, }, { field: 'msgSource', title: '消息来源', width: 50, }, { field: 'msgDestination', title: '消息目标', width: 50, }, { field: 'lastTime', title: '最后更新', width: 50, formatter: dateFormatter, }, { field: 'createTime', title: '创建时间', width: 50, formatter: dateFormatter, }, ]], api: { save: '/msg/save', delete: '/msg/delete', update: '/msg/update', query: '/msg/query' } }); $(function () { msgManager.initTable(); }); </script>