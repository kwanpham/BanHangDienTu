<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="QuanLyLoaiSanPham.aspx.cs" Inherits="QuanLyLoaiSanPham" %>

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
            <h5>Danh mục loại sản phẩm</h5>              
        </div>
        <div class="ibox-content">
            <asp:GridView AutoGenerateColumns="false" runat="server" ID="dgvSanPham" class="table table-bordered">
                <Columns>
                    <asp:BoundField HeaderText="Mã Loại Sản Phẩm" DataField="MaLoaiSP" />
                    <asp:BoundField HeaderText="Tên Loại Sản Phẩm" DataField="TenLoaiSP" />
                   
                    
                   
                    <asp:TemplateField>
                        <HeaderTemplate>Active</HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox Enabled="false" runat="server" Checked='<%# Eval("Active").ToString() == "True" ? true : false %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>Chức năng</HeaderTemplate>
                        <ItemTemplate>
                            <asp:LinkButton runat="server" ID="btnSua" title="Sửa" CommandArgument='<%# Eval("MaLoaiSP").ToString() %>' OnCommand="btnSua_Command"><i class="fa fa-edit"></i></asp:LinkButton>
                            <asp:LinkButton runat="server" ID="btnXoa" title="Xóa" CommandArgument='<%# Eval("MaLoaiSP").ToString() %>' OnCommand="btnXoa_Command"><i style="color:red;" class="fa fa-times-circle"></i></asp:LinkButton>
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
                <label class="col-sm-2 control-label">Mã Loại Sản Phẩm: </label>
                <div class="col-sm-10">
                    <asp:Label runat="server" ID="txtMaSP" type="text" class="form-control">
                    </asp:Label>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">Tên Loại Sản Phẩm: </label>
                <div class="col-sm-10">
                    <asp:TextBox runat="server" ID="txtTenSP" type="text" class="form-control">
                    </asp:TextBox>
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
            <asp:Button class="btn btn-outline btn-primary" runat="server" Text="Thêm mới" OnClick="btnThem_Click" />
            <asp:Button class="btn btn-outline btn-primary" runat="server" Text="Sửa" ID="btnSua" OnClick="btnSua_Click" />
        </div>
    </div>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
    
</asp:Content>

