<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="QuanLyDonHang.aspx.cs" Inherits="QuanLyDonHang" %>

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
            <h5>Danh mục Đơn Hàng</h5>              
        </div>
        <div class="ibox-content">
            <asp:GridView AutoGenerateColumns="false" runat="server" ID="dgvSanPham" class="table table-bordered">
                <Columns>
                    <asp:BoundField HeaderText="Mã Đơn Hàng" DataField="MaDH" />
                    <asp:BoundField HeaderText="Tên Khách Hàng" DataField="TenKhachHang" />
                    <asp:BoundField HeaderText="Địa Chỉ Nhận" DataField="DiaChiNhan" />
                    <asp:BoundField HeaderText="SĐT" DataField="SDT"  />
                      <asp:BoundField HeaderText="Email" DataField="Email"  />
                      <asp:BoundField HeaderText="Ghi Chú" DataField="GhiChu" Visible="false" />
                    
                    <asp:TemplateField>
                        <HeaderTemplate>Sản Phẩm</HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lbLoaiSP" Text='<%#GetTenSP(Eval("MaSP").ToString()) %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    

                    <asp:BoundField HeaderText="Ngày Đặt" DataField="NgayDat" />
                  
                    <asp:TemplateField>
                        <HeaderTemplate>Xác Nhận Mua Hàng</HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox Enabled="false" runat="server" Checked='<%# Eval("XacNhanMuaHang").ToString() == "True" ? true : false %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                 
                    <asp:TemplateField>
                        <HeaderTemplate>Đã Nhận Hàng</HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox Enabled="false" runat="server" Checked='<%# Eval("DaNhanHang").ToString() == "True" ? true : false %>' />
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
                            <asp:LinkButton runat="server" ID="btnSua" title="Sửa" CommandArgument='<%# Eval("MaDH").ToString() %>' OnCommand="btnSua_Command"><i class="fa fa-edit"></i></asp:LinkButton>
                            <asp:LinkButton runat="server" ID="btnXoa" title="Xóa" CommandArgument='<%# Eval("MaDH").ToString() %>' OnCommand="btnXoa_Command"><i style="color:red;" class="fa fa-times-circle"></i></asp:LinkButton>
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
                <label class="col-sm-2 control-label">Mã Đơn Hàng: </label>
                <div class="col-sm-10">
                    <asp:TextBox runat="server" ID="txtMaSP" type="text" class="form-control">
                    </asp:TextBox>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">Tên Khách Hàng: </label>
                <div class="col-sm-10">
                    <asp:TextBox runat="server" ID="txtTenSP" type="text" class="form-control">
                    </asp:TextBox>
                </div>
            </div>

           
            <div class="form-group">
                <label class="col-sm-2 control-label">Địa Chỉ Nhận Hàng: </label>
                <div class="col-sm-10">
                    <asp:TextBox TextMode="MultiLine" runat="server" ID="txtMoTa" type="text" class="form-control" ClientIDMode="Static">
                    </asp:TextBox>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">SDT: </label>
                <div class="col-sm-10">
                    <asp:TextBox runat="server" ID="txtMaLoaiSP" type="text" class="form-control">
                    </asp:TextBox>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label" >Email</label>
                <div class="col-sm-10">
                    <asp:TextBox runat="server" ID="txtMaNCC" type="text" class="form-control">
                    </asp:TextBox>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">Ghi Chú: </label>
                <div class="col-sm-10">
                    <asp:TextBox runat="server" ID="txtSoLuongTon" type="text" class="form-control">
                    </asp:TextBox>
                </div>
            </div>
            
            <div class="form-group">
                <label class="col-sm-2 control-label">Mã Sản Phẩm: </label>
                <div class="col-sm-10">
                    <asp:TextBox runat="server" ID="txtGiaBan" type="text" class="form-control">
                    </asp:TextBox>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">Xác Nhận Mua Hàng: </label>
                <div class="col-sm-10">
                    <asp:CheckBox runat="server" ID="chkIsHot" Checked="true" />
                </div>
            </div>

             <div class="form-group">
                <label class="col-sm-2 control-label">Đã Nhận Hàng: </label>
                <div class="col-sm-10">
                    <asp:CheckBox runat="server" ID="CheckBox1" Checked="true" />
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
           
            <asp:Button class="btn btn-outline btn-primary" runat="server" Text="Sửa" ID="btnSua" OnClick="btnSua_Click" />
        </div>
    </div>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
    
</asp:Content>