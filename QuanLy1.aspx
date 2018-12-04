<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="QuanLy1.aspx.cs" Inherits="QuanLy1" validateRequest="false"  %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"> 
    <style>
        .form-group{
            padding-bottom: 30px;
        }
    </style>
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <div class="ibox float-e-margins">
        <div class="ibox-title">
            <h5>Danh mục sản phẩm</h5>              
        </div>
        <div class="ibox-content">
            <asp:GridView AutoGenerateColumns="false" runat="server" ID="dgvSanPham" class="table table-bordered">
                <Columns>
                    <asp:BoundField HeaderText="Mã Sản Phẩm" DataField="MaSP" />
                    <asp:BoundField HeaderText="Tên Sản Phẩm" DataField="TenSP" />
                    <asp:BoundField HeaderText="Hình Đại Diện" DataField="HinhDaiDien" />
                    <asp:BoundField HeaderText="Mô Tả" DataField="MoTaSP" Visible="false" />
                    
                    <asp:TemplateField>
                        <HeaderTemplate>Loại Sản Phẩm</HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lbLoaiSP" Text='<%# Eval("MaLoaiSP").ToString() %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField>
                        <HeaderTemplate>Xuất Sứ</HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lbNhaCC" Text='<%# Eval("XuatSu").ToString() %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:BoundField HeaderText="Số Lượng Tồn" DataField="SoLuongTon" />
                  
                    <asp:BoundField HeaderText="Giá Bán" DataField="GiaBan" />
                    <asp:TemplateField>
                        <HeaderTemplate>SP Hot</HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox Enabled="false" runat="server" Checked='<%# Eval("isHot").ToString() == "True" ? true : false %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>Active</HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox Enabled="false" runat="server" Checked='<%# Eval("Active").ToString() == "True" ? true : false %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>Chức năng</HeaderTemplate>
                        <ItemTemplate>
                            <asp:LinkButton runat="server" ID="btnSua" title="Sửa" CommandArgument='<%# Eval("MaSP").ToString() %>' OnCommand="btnSua_Command"><i class="fa fa-edit"></i></asp:LinkButton>
                            <asp:LinkButton runat="server" ID="btnXoa" title="Xóa" CommandArgument='<%# Eval("MaSP").ToString() %>' OnCommand="btnXoa_Command"><i style="color:red;" class="fa fa-times-circle"></i></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </div>

    <div class="ibox float-e-margins">
        <div class="ibox-title">
            <h5>Cập nhật dữ liệu</h5>              
        </div>
        <div class="ibox-content">
            <div class="form-group">
                <label class="col-sm-2 control-label">Mã Sản Phẩm: </label>
                <div class="col-sm-10">
                    <asp:TextBox runat="server" ID="txtMaSP" type="text" class="form-control">
                    </asp:TextBox>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">Tên Sản Phẩm: </label>
                <div class="col-sm-10">
                    <asp:TextBox runat="server" ID="txtTenSP" type="text" class="form-control">
                    </asp:TextBox>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">Hình Sản Phẩm: </label>
                <div class="col-sm-10">
                    <asp:HiddenField runat="server" ID="hfHinhAnh" />
                    <asp:Image runat="server" ID="imgHinhAnh" Width="300px" />
                    <asp:FileUpload runat="server" ID="upHinhAnh"  />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">Mô Tả: </label>
                <div class="col-sm-10">
                    <asp:TextBox TextMode="MultiLine" runat="server" ID="txtMoTa" type="text" class="form-control" ClientIDMode="Static">
                    </asp:TextBox>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">Mã Loại: </label>
                <div class="col-sm-10">
                    <asp:TextBox runat="server" ID="txtMaLoaiSP" type="text" class="form-control">
                    </asp:TextBox>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label" >Xuất sứ</label>
                <div class="col-sm-10">
                    <asp:TextBox runat="server" ID="txtMaNCC" type="text" class="form-control">
                    </asp:TextBox>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">Số lượng tồn: </label>
                <div class="col-sm-10">
                    <asp:TextBox runat="server" ID="txtSoLuongTon" type="text" class="form-control">
                    </asp:TextBox>
                </div>
            </div>
            
            <div class="form-group">
                <label class="col-sm-2 control-label">Giá bán: </label>
                <div class="col-sm-10">
                    <asp:TextBox runat="server" ID="txtGiaBan" type="text" class="form-control">
                    </asp:TextBox>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">Sản Phẩm Hot: </label>
                <div class="col-sm-10">
                    <asp:CheckBox runat="server" ID="chkIsHot" Checked="true" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">Active: </label>
                <div class="col-sm-10">
                    <asp:CheckBox runat="server" ID="chkActive" Checked="true" />
                </div>
            </div>
            <div style="clear:both"></div>
        </div>
        <div class="ibox-content">
            <asp:Button class="btn btn-outline btn-primary" runat="server" Text="Thêm mới" OnClick="Unnamed_Click" />
            <asp:Button class="btn btn-outline btn-primary" runat="server" Text="Sửa" ID="btnSua" OnClick="btnSua_Click" />
        </div>
    </div>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
    <script src="ckplugin/ckeditor/ckeditor.js"></script>
    <script>
        $(document).ready(function () {
            var editor = CKEDITOR.replace('txtMoTa', {
                toolbar: [
                { name: 'clipboard', groups: ['clipboard', 'undo'], items: ['Cut', 'Copy', 'Paste', 'PasteText', 'PasteFromWord', '-', 'Undo', 'Redo'] },
                { name: 'basicstyles', groups: ['basicstyles', 'cleanup'], items: ['Bold', 'Italic', 'Underline', 'Strike', 'Subscript', 'Superscript', '-', 'RemoveFormat'] },
                { name: 'paragraph', groups: ['list', 'indent', 'blocks', 'align', 'bidi'], items: ['NumberedList', 'BulletedList', '-', 'Outdent', 'Indent', '-', 'Blockquote', 'CreateDiv', '-', 'JustifyLeft', 'JustifyCenter', 'JustifyRight', 'JustifyBlock', '-', 'BidiLtr', 'BidiRtl', 'Language'] },
                { name: 'colors', items: ['TextColor', 'BGColor'] },
                { name: 'insert', items: ['Image', 'Table', 'HorizontalRule', 'SpecialChar', 'PageBreak'] },
                { name: 'links', items: ['Link', 'Unlink', 'Anchor'] },
                { name: 'styles', items: ['Styles', 'Format', 'Font', 'FontSize'] },
                '/',
                { name: 'tools', items: ['Maximize', 'ShowBlocks'] },
                { name: 'document', items: ['Source'] }
                ]
            });
        });
    </script>
</asp:Content>

