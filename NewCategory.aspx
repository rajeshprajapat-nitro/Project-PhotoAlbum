<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="NewCategory.aspx.vb" Inherits="NewCategory" title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table width="650">
        <tr>
            <td colspan="3" valign="top" width="15%">
                <strong><span style="font-size: 20px; color: #cc9900">Adding New Category</span></strong></td>
        </tr>
        <tr>
            <td valign="top" width="15%">
                <asp:Label ID="lblCategoryTitle" runat="server" Text="New Category" Font-Bold="True"></asp:Label></td>
            <td style="width: 20%" valign="top">
                <asp:TextBox ID="txtCategoryTitle" runat="server" Width="200px"></asp:TextBox></td>
            <td valign="top" width="25%">
                <asp:RequiredFieldValidator ID="ReqCategoryTitle" runat="server" ControlToValidate="txtCategoryTitle"
                    ErrorMessage="Please enter category title"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td valign="top" width="15%">
                <asp:Label ID="lblCategoryDescription" runat="server" Text="Category Description" Font-Bold="True"></asp:Label></td>
            <td style="width: 20%" valign="top">
                <asp:TextBox ID="txtCategoryDescription" runat="server" Height="100px" TextMode="MultiLine" Width="200px"></asp:TextBox></td>
            <td valign="top" width="25%">
                <asp:RequiredFieldValidator ID="reqCategoryDescription" runat="server" ControlToValidate="txtCategoryDescription"
                    ErrorMessage="Please enter description"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td valign="top" width="15%">
            </td>
            <td style="width: 20%; text-align: center;" valign="top">
                <asp:Button ID="btnNewCategory" runat="server" Text="New Category" /><br />
                <asp:Label ID="lblNewCatMessage" runat="server" Text="New category added.." ForeColor="Green" Visible="False" Width="100%"></asp:Label></td>
            <td valign="top" width="25%">
            </td>
        </tr>
    </table>
</asp:Content>

