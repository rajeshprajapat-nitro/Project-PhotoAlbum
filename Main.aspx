<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="Main.aspx.vb" Inherits="Main" title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:DataList ID="DataList1" runat="server" DataKeyField="PKPhotoId" DataSourceID="PhotoDS"
        RepeatColumns="5" RepeatDirection="Horizontal">
        <ItemTemplate>
            <a href='<%# Eval("Filename", "./Gallery/{0}") %>' target="_blank">
            <asp:Image ID="Image1" runat="server" Height="50px" ImageUrl='<%# Eval("Filename", "~\Gallery\{0}")%>'
                Width="50px" ToolTip='<%# Eval("Memo") %>'/>
            </a>
        </ItemTemplate>
    </asp:DataList><asp:SqlDataSource ID="PhotoDS" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
        SelectCommand="SELECT [PKPhotoId], [Filename], [FKCategoryId], [Memo] FROM [Photo] WHERE ([FKCategoryId] = @FKCategoryId)">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="0" Name="FKCategoryId" QueryStringField="Category"
                Type="Decimal" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

