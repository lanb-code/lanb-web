<table id="codeInfoSetting" style="width: 100%">
    <tr>
        <td>
            <table id="codeTypeManagerDg" style="width:100%; height:1000px;"></table>
            <div id="codeTypeManagerToolbar" style="padding: 5px;"><a href="javascript:void(0)"
                                                                      class="easyui-linkbutton"
                                                                      iconCls="icon-add" plain="true"
                                                                      onclick="codeTypeManager.new()">新增</a> <a
                    href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true"
                    onclick="codeTypeManager.edit()">编辑</a> <a href="javascript:void(0)" class="easyui-linkbutton"
                                                               iconCls="icon-remove" plain="true"
                                                               onclick="codeTypeManager.destroy()">删除</a></div>
            <div id="codeTypeManagerDlg" class="easyui-dialog" style="width:400px"
                 data-options="closed:true,modal:true,border:'thin',buttons:'#codeTypeManagerDlgButtons'">
                <form id="codeTypeManagerFm" method="post" novalidate style="margin:0;padding:20px 50px">
                    <div hidden style="margin-bottom:10px"><input name="codeTypeId" class="easyui-textbox"
                                                                  label="代码类型ID:"
                                                                  style="width:100%"></div>
                    <div style="margin-bottom:10px"><input name="codeTypeName" class="easyui-textbox" label="代码类型名:"
                                                           style="width:100%"></div>
                </form>
            </div>
            <div id="codeTypeManagerDlgButtons"><a href="javascript:void(0)" class="easyui-linkbutton c6"
                                                   iconCls="icon-ok"
                                                   onclick="codeTypeManager.save()" style="width:90px">保存</a> <a
                    href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel"
                    onclick="javascript:$('#codeTypeManagerDlg').dialog('close')" style="width:90px">取消</a></div>
            <script type="text/javascript"> var codeTypeManager = datagrid({
                menuName: 'codeTypeManager',
                menuTitle: '代码类别设置',
                pk: 'codeTypeId',
                columns: [[{field: 'codeTypeId', title: '代码类型ID', width: 50, hidden: true,}, {
                    field: 'codeTypeName',
                    title: '代码类型名',
                    width: 50,
                },]],
                api: {
                    save: '/codeType/save',
                    delete: '/codeType/delete',
                    update: '/codeType/update',
                    query: '/codeType/query'
                },
                extra: {
                    onClickRow: function (index, row) {
                        codeInfoSetting.dg.datagrid("load", {
                                    'codeTypeId': row.codeTypeId
                                }
                        );
                        codeInfoSetting.fm.form('load', row);
                    }
                }
            });
            $(function () {
                codeTypeManager.initTable();
            }); </script>

        </td>
        <td>
            <table id="codeInfoSettingDg" style="width:100%; height:1000px;"></table>
            <div id="codeInfoSettingToolbar" style="padding: 5px;"><a href="javascript:void(0)"
                                                                      class="easyui-linkbutton"
                                                                      iconCls="icon-add" plain="true"
                                                                      onclick="codeInfoSetting.new()">新增</a> <a
                    href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true"
                    onclick="codeInfoSetting.edit()">编辑</a> <a href="javascript:void(0)" class="easyui-linkbutton"
                                                               iconCls="icon-remove" plain="true"
                                                               onclick="codeInfoSetting.destroy()">删除</a></div>
            <div id="codeInfoSettingDlg" class="easyui-dialog" style="width:400px"
                 data-options="closed:true,modal:true,border:'thin',buttons:'#codeInfoSettingDlgButtons'">
                <form id="codeInfoSettingFm" method="post" novalidate style="margin:0;padding:20px 50px">
                    <div hidden style="margin-bottom:10px"><input name="codeInfoId" class="easyui-textbox"
                                                                  label="代码信息ID:"
                                                                  style="width:100%"></div>
                    <div style="margin-bottom:10px">
                        <select name="codeTypeId" class="easyui-combobox" label="代码类型ID:"
                                data-options="url: '/codeType/query',valueField:'codeTypeId',textField:'codeTypeName'"
                                style="width:100%"></select></div>
                    <div style="margin-bottom:10px"><input name="name" class="easyui-textbox" label="代码名:"
                                                           style="width:100%"></div>
                    <div style="margin-bottom:10px"><input name="value" class="easyui-textbox" label="代码值:"
                                                           style="width:100%">
                    </div>
                    <div style="margin-bottom:10px"><input name="sort" class="easyui-textbox" label="排序:"
                                                           style="width:100%"></div>
                </form>
            </div>
            <div id="codeInfoSettingDlgButtons"><a href="javascript:void(0)" class="easyui-linkbutton c6"
                                                   iconCls="icon-ok"
                                                   onclick="codeInfoSetting.save()" style="width:90px">保存</a> <a
                    href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel"
                    onclick="javascript:$('#codeInfoSettingDlg').dialog('close')" style="width:90px">取消</a></div>
            <script type="text/javascript"> var codeInfoSetting = datagrid({
                menuName: 'codeInfoSetting',
                menuTitle: '代码信息设置',
                pk: 'codeInfoId',
                clearForm: false,
                columns: [[{field: 'codeInfoId', title: '代码信息ID', width: 50, hidden: true,}, {
                    field: 'codeTypeId',
                    title: '代码类型ID',
                    hidden: true,
                    width: 50,
                }, {
                    field: 'codeTypeName',
                    title: '代码类型',
                    width: 50,
                }, {field: 'name', title: '代码名', width: 50,}, {field: 'value', title: '代码值', width: 50,}, {
                    field: 'sort',
                    title: '排序',
                    width: 50,
                }]],
                api: {
                    save: '/codeInfo/save',
                    delete: '/codeInfo/delete',
                    update: '/codeInfo/update',
                    query: '/codeInfo/query'
                }
            });
            $(function () {
                codeInfoSetting.initTable();
            }); </script>
        </td>
    </tr>
</table>