<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="UploadPhoto.aspx.vb" Inherits="UploadPhoto" title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table>
        <tr>
            <td colspan="2" valign="top">
                <strong><span style="font-size: 15pt; color: #cc9900">Adding New Category</span></strong></td>
        </tr>
        <tr>
            <td style="width: 100px" valign="top">
                <asp:Label ID="lblCategory" runat="server" Text="Category"></asp:Label></td>
            <td style="width: 100px" valign="top">
                <asp:DropDownList ID="cmbCategory" runat="server" Width="200px" DataSourceID="DSCategory" DataTextField="Title" DataValueField="PKCategoryId">
                </asp:DropDownList><asp:SqlDataSource ID="DSCategory" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                    SelectCommand="SELECT [PKCategoryId], [Title] FROM [Category] ORDER BY [Title]">
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td style="width: 100px" valign="top">
                <asp:Label ID="lblPath" runat="server" Text="Path"></asp:Label></td>
            <td style="width: 100px" valign="top">
                <asp:FileUpload ID="PhotoUpload" runat="server" Width="200px" /></td>
        </tr>
        <tr>
            <td style="width: 100px" valign="top">
                <asp:Label ID="lblDescription" runat="server" Text="Description"></asp:Label></td>
            <td style="width: 100px" valign="top">
                <asp:TextBox ID="txtMemo" runat="server" Height="100px" TextMode="MultiLine" Width="200px"></asp:TextBox></td>
        </tr>
        <tr>
            <td style="width: 100px" valign="top">
            </td>
            <td style="width: 100px" valign="top">
                <asp:Button ID="btnAddToCategory" runat="server" Text="Upload" /><br />
                <asp:Label ID="lblUploadMessage" runat="server" ForeColor="Green" Text="File uploaded successfully..."
                    Width="200px"></asp:Label></td>
        </tr>
    </table>
</asp:Content>

