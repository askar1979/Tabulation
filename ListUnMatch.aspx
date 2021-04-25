<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="ListUnMatch.aspx.vb" Inherits="VRUTracking.ListUnMatch" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" dir="rtl">
<head runat="server">
    <title>VRU Software</title>
    <link href="css/formmenu.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <div class="divimage">
            <asp:Image ID="Image2" runat="server" ImageUrl="~/Images/VRU_Header.jpg" />
        </div>
        <div class="divMenu">
            <table cellspacing="2" cellpadding="3" rules="all" border="0" id="Table1" style="background-color: #6395EC;
                font-family: Arial; font-size: Medium; font-weight: bold;" >
                <tr style="background-color: #D4D0C8; font-weight: bold;">
                    <td align="right">
                        <asp:Menu ID="Menu1" runat="server" DynamicHorizontalOffset="2" Font-Bold="True"
                            Font-Names="Tahoma" Font-Size="Small" ForeColor="#000066" Orientation="Horizontal"
                            StaticSubMenuIndent="15px" BackColor="#FFFFC6">
                            <StaticSelectedStyle BackColor="#507CD1" />
                            <StaticMenuItemStyle HorizontalPadding="9px" VerticalPadding="10px" />
                            <DynamicHoverStyle BackColor="#284E98" ForeColor="White" />
                            <DynamicMenuStyle BackColor="#B5C7DE" />
                            <DynamicSelectedStyle BackColor="#507CD1" />
                            <DynamicMenuItemStyle HorizontalPadding="10px" VerticalPadding="5px" />
                            <StaticHoverStyle BackColor="#284E98" ForeColor="White" />
                            <Items>
                                <asp:MenuItem NavigateUrl="~/ListUnMatch.aspx" Text="التصحيح" Value="التصحيح"></asp:MenuItem>
                                <asp:MenuItem Text="حالة الاستمارة" Value="Scan" NavigateUrl="~/FormStatus.aspx">
                                </asp:MenuItem>
                                <asp:MenuItem NavigateUrl="~/changePass.aspx" Text="تغيير كلمة السر" Value="Change Password">
                                </asp:MenuItem>
                                <asp:MenuItem NavigateUrl="~/logout.aspx" Text="الخروج" Value="Log out"></asp:MenuItem>
                            </Items>
                        </asp:Menu>
                    </td>
                </tr>
            </table>
        </div>
        <div id="FormName" class="formName">
            <asp:Label ID="lblFormName" runat="server" Text="واجهة التصحيح"></asp:Label>
        </div>
        <div class="barcode-container">
            <div>
                <asp:Label ID="lblBarcode" runat="server" Text="رقم الباركود"></asp:Label>
                <asp:TextBox ID="txtBarcode" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="Large"
                    MaxLength="8" AutoCompleteType="Disabled" TabIndex="1"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtBarcode"
                    ErrorMessage="***" Font-Bold="True" Font-Names="Arial" Font-Size="X-Large"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtBarCode"
                    ErrorMessage="ارقام فقط - ثمانية مراتب" ValidationExpression="[0-9]{8,8}" Font-Bold="True"
                    Font-Names="Arial" Font-Size="Large"></asp:RegularExpressionValidator>
                <div class="buttons">
                    <asp:Button ID="btnSearch" runat="server" Text="بحث" TabIndex="2" CssClass="save" />
                    <asp:Button ID="btnSearchAll" runat="server" Text="عرض الكل" CssClass="ok" />
                </div>
            </div>
        </div>
        <div class="divMenu">
              <asp:Panel ID="Panel1" runat="server" HorizontalAlign="Center">
            <table align="center" width="100%">
              <%--  <tr>
                    <td>
                        <asp:TextBox ID="txtBarcode" runat="server" MaxLength="8"></asp:TextBox>
                        <asp:CompareValidator ID="cvPerId" runat="server" ErrorMessage="ادخل ارقام فقط" ControlToValidate="txtBarcode"
                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                    </td>
                    <td>
                        <asp:Button ID="btnSearch" runat="server" Text="بحث" Font-Bold="True" Font-Names="Arial"
                            Font-Size="Medium" />
                        <asp:Button ID="btnSearchAll" runat="server" Text="عرض الكل" Font-Bold="True" Font-Names="Arial"
                            Font-Size="Medium" />
                    </td>
                </tr>--%>
                <tr>
                    <td align="right">
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White"
                            BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal"
                            Style="margin-bottom: 0px" DataSourceID="SqlDataSource1" 
                            DataKeyNames="TrackingId" Width="300px">
                            <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                            <Columns>
                                <asp:BoundField DataField="Barcode" HeaderText="Barcode" SortExpression="Barcode" />
                                <asp:BoundField DataField="TrackingId" HeaderText="TrackingId" InsertVisible="False"
                                    ReadOnly="True" SortExpression="TrackingId" Visible="False" />
                                <asp:CommandField ShowSelectButton="True" />
                            </Columns>
                            <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" BorderStyle="Solid" />
                            <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                            <AlternatingRowStyle BackColor="#F7F7F7" />
                        </asp:GridView>
                    </td>
                </tr>
            </table>
        </asp:Panel>
        </div>
        <div>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:IHEC_VRUConnectionString %>"
                SelectCommand="usp_listMismatch" SelectCommandType="StoredProcedure" CancelSelectOnNullParameter="False">
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtBarcode" Name="Barcode" PropertyName="Text" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </div>
    </form>
</body>
</html>
