<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Intake.aspx.vb" Inherits="VRUTracking._Intake" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" dir="rtl">
<head id="Head1" runat="server">
    <title>VRU Software</title>

    <script src="Script/jquery-1.4.1.min.js" type="text/javascript"></script>

    <script src="Script/jquery.maskedinput-1.3.min.js" type="text/javascript"></script>


    <script language="javascript" type="text/javascript">
// <!CDATA[


function CheckBrowser()
{
     // Check Browser Close [X] , Alt+F4 , File -> Close  
     if(window.event.clientX < 0 && window.event.clientY <0)
    {
          //alert('hi')
          
          
          window.open("CleanObjects.aspx");

    }
}

function window_onload() {
javascript:history.go(1)
}

function form1_onsubmit() {
function enableDIV() {
         document.getElementById("divTop").style.zIndex=999
         document.getElementById("divTop").style.height=1000
         document.getElementById("divTop").style.backgroundColor=DEDBD5
         document.getElementById("divTop").innerHTML = 'الرجاء الانتظار بينما ينفذ طلبك'
        }
enableDIV();
}

function window_onunload() {
CheckBrowser();
}

// ]]>
    </script>

    <style type="text/css">
        *
        {
            margin: 0;
            background-repeat: no-repeat;
        }
    </style>
    <link href="css/formmenu.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript">
        $(document).ready(function(){
            $("#txtShipmentDate").mask ("99/99/2012") ;
                   });
    </script>

</head>
<body onload="return window_onload()" onunload="return window_onunload()">
    <form id="form1" runat="server">
    <div class="divimage">
        <asp:Image ID="Image2" runat="server" ImageUrl="~/Images/VRU_Header.jpg" />
    </div>
    <div class="divMenu">
        <table cellspacing="2" cellpadding="3" rules="all" border="0" id="Table1" style="background-color: #6395EC;
            font-family: Arial; font-size: Medium; font-weight: bold;" align="right">
            <tr style="background-color: #D4D0C8; font-weight: bold;">
                <td align="right">
                    <asp:Menu ID="MainMenu" runat="server" DynamicHorizontalOffset="2" Font-Bold="True"
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
                            <asp:MenuItem NavigateUrl="~/intake.aspx" Text="الاستلام" Value="ادارة الملفات">
                            </asp:MenuItem>
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
    <div>
        <div>
            <asp:SqlDataSource ID="SDS_LoadIntake" runat="server" ConnectionString="<%$ ConnectionStrings:IHEC_VRUConnectionString %>"
                DeleteCommand="DELETE FROM [Intake] WHERE [IntakeId] = @IntakeId" InsertCommand="INSERT INTO [Intake] ([GovernorateId], [VRCId], [ShipmentNumber], [ShipmentDate], [IntakeUserId], [IntakeDate], [NumberOfForms], [NumberOfAdditionForms], [NumberOfChangeForms], [NumberOfCorrectionForms], [NumberOfDeletionForms], [NumberOfIDPForms]) VALUES (@GovernorateId, @VRCId, @ShipmentNumber, @ShipmentDate, @IntakeUserId, @IntakeDate, @NumberOfForms, @NumberOfAdditionForms, @NumberOfChangeForms, @NumberOfCorrectionForms, @NumberOfDeletionForms, @NumberOfIDPForms)"
                SelectCommand="SELECT * FROM [Intake]" UpdateCommand="UPDATE [Intake] SET [GovernorateId] = @GovernorateId, [VRCId] = @VRCId, [ShipmentNumber] = @ShipmentNumber, [ShipmentDate] = @ShipmentDate, [IntakeUserId] = @IntakeUserId, [IntakeDate] = @IntakeDate, [NumberOfForms] = @NumberOfForms, [NumberOfAdditionForms] = @NumberOfAdditionForms, [NumberOfChangeForms] = @NumberOfChangeForms, [NumberOfCorrectionForms] = @NumberOfCorrectionForms, [NumberOfDeletionForms] = @NumberOfDeletionForms, [NumberOfIDPForms] = @NumberOfIDPForms WHERE [IntakeId] = @IntakeId">
                <DeleteParameters>
                    <asp:Parameter Name="IntakeId" Type="Int32" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:Parameter Name="GovernorateId" Type="Int32" />
                    <asp:Parameter Name="VRCId" Type="Int32" />
                    <asp:Parameter Name="ShipmentNumber" Type="Int32" />
                    <asp:Parameter DbType="Date" Name="ShipmentDate" />
                    <asp:Parameter Name="IntakeUserId" Type="Int32" />
                    <asp:Parameter DbType="Date" Name="IntakeDate" />
                    <asp:Parameter Name="NumberOfForms" Type="Int32" />
                    <asp:Parameter Name="NumberOfAdditionForms" Type="Int32" />
                    <asp:Parameter Name="NumberOfChangeForms" Type="Int32" />
                    <asp:Parameter Name="NumberOfCorrectionForms" Type="Int32" />
                    <asp:Parameter Name="NumberOfDeletionForms" Type="Int32" />
                    <asp:Parameter Name="NumberOfIDPForms" Type="Int32" />
                    <asp:Parameter Name="IntakeId" Type="Int32" />
                </UpdateParameters>
                <InsertParameters>
                    <asp:Parameter Name="GovernorateId" Type="Int32" />
                    <asp:Parameter Name="VRCId" Type="Int32" />
                    <asp:Parameter Name="ShipmentNumber" Type="Int32" />
                    <asp:Parameter Name="ShipmentDate" />
                    <asp:SessionParameter Name="IntakeUserId" SessionField="sesUserID" Type="Int32" />
                    <asp:SessionParameter Name="IntakeDate" SessionField="sesIntakeDate" />
                    <asp:Parameter Name="NumberOfForms" Type="Int32" />
                    <asp:Parameter Name="NumberOfAdditionForms" Type="Int32" />
                    <asp:Parameter Name="NumberOfChangeForms" Type="Int32" />
                    <asp:Parameter Name="NumberOfCorrectionForms" Type="Int32" />
                    <asp:Parameter Name="NumberOfDeletionForms" Type="Int32" />
                    <asp:Parameter Name="NumberOfIDPForms" Type="Int32" />
                </InsertParameters>
            </asp:SqlDataSource>
        </div>
        <div id="FormName" class="formName">
            <asp:Label ID="lblFormName" runat="server" Text="واجهة الاستلام"></asp:Label>
        </div>
        <div class="changepassword">
            <table>
                <tr>
                    <td>
                        <asp:Label ID="lblgovNo" runat="server" Text="رقم المحافظة"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtGovID" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RFV_GovID" runat="server" ControlToValidate="txtGovID"
                            ErrorMessage="***" Font-Bold="True" Font-Names="Arial" Font-Size="X-Large"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="REV_GovNo" runat="server" ControlToValidate="txtGovID"
                            ErrorMessage="ارقام فقط " Font-Bold="True" Font-Names="Arial" Font-Size="Large"
                            ValidationExpression="[0-9]{1,2}"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblVRCID" runat="server" Text="رقم مركز التسجيل"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtVRC" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RFV_VRC" runat="server" ControlToValidate="txtVRC"
                            ErrorMessage="***" Font-Bold="True" Font-Names="Arial" Font-Size="X-Large"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="REV_VRC" runat="server" ControlToValidate="txtVRC"
                            ErrorMessage="ارقام فقط" Font-Bold="True" Font-Names="Arial" Font-Size="Large"
                            ValidationExpression="[0-9]{4,4}"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblShipmentNo" runat="server" Text="رقم الشحنة"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtShipmentNo" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RFV_ShipmentNo" runat="server" ControlToValidate="txtShipmentNo"
                            ErrorMessage="***" Font-Bold="True" Font-Names="Arial" Font-Size="X-Large"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="REV_ShipmentNo" runat="server" ControlToValidate="txtShipmentNo"
                            ErrorMessage="ارقام فقط " Font-Bold="True" Font-Names="Arial" Font-Size="Large"
                            ValidationExpression="[0-9]{1,20}"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblShipmentDate" runat="server" Text="تاريخ الشحنة"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtShipmentDate" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RFV_ShipmentDate" runat="server" ControlToValidate="txtShipmentDate"
                            ErrorMessage="***" Font-Bold="True" Font-Names="Arial" Font-Size="X-Large"></asp:RequiredFieldValidator>
                        <%--<asp:RegularExpressionValidator ID="REF_Date" runat="server" ControlToValidate="txtShipmentDate"
                            ErrorMessage="خطأ في تاريخ الشحنة"></asp:RegularExpressionValidator>--%>
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblNoForms" runat="server" Text="مجموع الاستمارات للشحنة"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtNoForms" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RFV_FormNo" runat="server" ControlToValidate="txtNoForms"
                            ErrorMessage="***" Font-Bold="True" Font-Names="Arial" Font-Size="X-Large"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="REV_FormNo" runat="server" ControlToValidate="txtNoForms"
                            ErrorMessage="ارقام فقط" Font-Bold="True" Font-Names="Arial" Font-Size="Large"
                            ValidationExpression="[0-9]{1,4}"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblNoAddition" runat="server" Text="عدد استمارات الاضافة"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtNoAddition" runat="server"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidatorAddition" runat="server"
                            ControlToValidate="txtNoAddition" ErrorMessage="ارقام فقط" Font-Bold="True" Font-Names="Arial"
                            Font-Size="Large" ValidationExpression="[0-9]{1,4}"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblNoChange" runat="server" Text="عدد استمارات التغيير"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtNoChange" runat="server"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidatorchange" runat="server"
                            ControlToValidate="txtNoChange" ErrorMessage="ارقام فقط" Font-Bold="True" Font-Names="Arial"
                            Font-Size="Large" ValidationExpression="[0-9]{1,4}"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblNoCorrection" runat="server" Text="عدد استمارات التصحيح"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtNoCorrection" runat="server"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtNoCorrection"
                            ErrorMessage="ارقام فقط" Font-Bold="True" Font-Names="Arial" Font-Size="Large"
                            ValidationExpression="[0-9]{1,4}"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblNoDeletion" runat="server" Text="عدد استمارات الحذف"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtNoDeletion" runat="server"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtNoDeletion"
                            ErrorMessage="ارقام فقط" Font-Bold="True" Font-Names="Arial" Font-Size="Large"
                            ValidationExpression="[0-9]{1,4}"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblNoIDP" runat="server" Text="Label" Enabled="False" Visible="False"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtNoIDP" runat="server" Enabled="false" Visible="False"></asp:TextBox>
                    </td>
                </tr>
            </table>
            <div class="buttons">
                <asp:Button ID="btnSave" runat="server" Text="خزن" CssClass="save" />
            </div>
        </div>
        <%-- <div class="Intake">
            <asp:DetailsView ID="DV_Intake" runat="server" AutoGenerateRows="False" BackColor="White"
                BorderColor="#2B6EC5" BorderStyle="Double" BorderWidth="3px" CellPadding="4"
                DataKeyNames="IntakeId,VRCId,ShipmentNumber" DataSourceID="SDS_LoadIntake" DefaultMode="Insert"
                GridLines="Horizontal" Height="50px" Width="898px">
                <FooterStyle BackColor="White" ForeColor="#333333" />
                <RowStyle BackColor="White" ForeColor="#333333" />
                <PagerStyle BackColor="#CE8639" ForeColor="White" HorizontalAlign="Center" />
                <Fields>
                    <asp:BoundField DataField="IntakeId" HeaderText="IntakeId" InsertVisible="False"
                        ReadOnly="True" SortExpression="IntakeId" />
                    <asp:TemplateField HeaderText="رقم المحافظة" SortExpression="GovernorateId">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("GovernorateId") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="txtGovID" runat="server" Columns="10" Font-Bold="True" Font-Names="Arial"
                                Font-Size="Medium" MaxLength="2" Text='<%# Bind("GovernorateId") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RFV_GovID" runat="server" ControlToValidate="txtGovID"
                                ErrorMessage="***" Font-Bold="True" Font-Names="Arial" Font-Size="X-Large"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="REV_GovNo" runat="server" ControlToValidate="txtGovID"
                                ErrorMessage="ارقام فقط " Font-Bold="True" Font-Names="Arial" Font-Size="Large"
                                ValidationExpression="[0-9]{1,2}"></asp:RegularExpressionValidator>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("GovernorateId") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="رقم مركز التسجيل" SortExpression="VRCId">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("VRCId") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="txtVRC" runat="server" Columns="15" Font-Bold="True" Font-Names="Arial"
                                Font-Size="Medium" MaxLength="4" Text='<%# Bind("VRCId") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RFV_VRC" runat="server" ControlToValidate="txtVRC"
                                ErrorMessage="***" Font-Bold="True" Font-Names="Arial" Font-Size="X-Large"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="REV_VRC" runat="server" ControlToValidate="txtVRC"
                                ErrorMessage="ارقام فقط" Font-Bold="True" Font-Names="Arial" Font-Size="Large"
                                ValidationExpression="[0-9]{4,4}"></asp:RegularExpressionValidator>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("VRCId") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="رقم الشحنة" SortExpression="ShipmentNumber">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("ShipmentNumber") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="txtShipmentNo" runat="server" Font-Bold="True" Font-Names="Arial"
                                Font-Size="Medium" Text='<%# Bind("ShipmentNumber") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RFV_ShipmentNo" runat="server" ControlToValidate="txtShipmentNo"
                                ErrorMessage="***" Font-Bold="True" Font-Names="Arial" Font-Size="X-Large"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="REV_ShipmentNo" runat="server" ControlToValidate="txtShipmentNo"
                                ErrorMessage="ارقام فقط " Font-Bold="True" Font-Names="Arial" Font-Size="Large"
                                ValidationExpression="[0-9]{1,20}"></asp:RegularExpressionValidator>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("ShipmentNumber") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="تاريخ الشحنة" SortExpression="ShipmentDate">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("ShipmentDate") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="txtShipmentDate" runat="server" Columns="15" Font-Bold="True" Font-Names="Arial"
                                Font-Size="Medium" Text='<%# Bind("ShipmentDate") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RFV_ShipmentDate" runat="server" ControlToValidate="txtShipmentDate"
                                ErrorMessage="***" Font-Bold="True" Font-Names="Arial" Font-Size="X-Large"></asp:RequiredFieldValidator>
                            <asp:CompareValidator ID="CompareValidatorDate" runat="server" ControlToValidate="txtShipmentDate"
                                ErrorMessage="تاريخ فقط" Operator="DataTypeCheck" Type="Date"></asp:CompareValidator>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("ShipmentDate") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="IntakeUserId" SortExpression="IntakeUserId" Visible="False">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("IntakeUserId") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("IntakeUserId") %>'></asp:TextBox>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("IntakeUserId") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="IntakeDate" SortExpression="IntakeDate" Visible="False">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("IntakeDate") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("IntakeDate") %>'></asp:TextBox>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label6" runat="server" Text='<%# Bind("IntakeDate") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="مجموع الاستمارات للشحنة" SortExpression="NumberOfForms">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("NumberOfForms") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="txtNoForms" runat="server" Columns="10" Font-Bold="True" Font-Names="Arial"
                                Font-Size="Medium" MaxLength="4" Text='<%# Bind("NumberOfForms") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RFV_FormNo" runat="server" ControlToValidate="txtNoForms"
                                ErrorMessage="***" Font-Bold="True" Font-Names="Arial" Font-Size="X-Large"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="REV_FormNo" runat="server" ControlToValidate="txtNoForms"
                                ErrorMessage="ارقام فقط" Font-Bold="True" Font-Names="Arial" Font-Size="Large"
                                ValidationExpression="[0-9]{1,4}"></asp:RegularExpressionValidator>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label7" runat="server" Text='<%# Bind("NumberOfForms") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="عدد استمارات الاضافة" SortExpression="NumberOfAdditionForms">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("NumberOfAdditionForms") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="txtNoAddition" runat="server" Columns="10" Font-Bold="True" Font-Names="Arial"
                                Font-Size="Medium" MaxLength="4" Text='<%# Bind("NumberOfAdditionForms") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RFV_AdditionNo" runat="server" ControlToValidate="txtNoAddition"
                                ErrorMessage="***" Font-Bold="True" Font-Names="Arial" Font-Size="X-Large"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="REV_AdditionNo" runat="server" ControlToValidate="txtNoAddition"
                                ErrorMessage="ارقام فقط" Font-Bold="True" Font-Names="Arial" Font-Size="Large"
                                ValidationExpression="[0-9]{1,4}"></asp:RegularExpressionValidator>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label8" runat="server" Text='<%# Bind("NumberOfAdditionForms") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="عدد استمارات التغيير" SortExpression="NumberOfChangeForms">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("NumberOfChangeForms") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="txtNoChange" runat="server" Columns="10" Font-Bold="True" Font-Names="Arial"
                                Font-Size="Medium" MaxLength="4" Text='<%# Bind("NumberOfChangeForms") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RFV_ChangeNo" runat="server" ControlToValidate="txtNoChange"
                                ErrorMessage="***" Font-Bold="True" Font-Names="Arial" Font-Size="X-Large"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="REV_ChangeNo" runat="server" ControlToValidate="txtNoChange"
                                ErrorMessage="ارقام فقط" Font-Bold="True" Font-Names="Arial" Font-Size="Large"
                                ValidationExpression="[0-9]{1,4}"></asp:RegularExpressionValidator>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label9" runat="server" Text='<%# Bind("NumberOfChangeForms") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="عدد استمارات التصحيح" SortExpression="NumberOfCorrectionForms">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox10" runat="server" Text='<%# Bind("NumberOfCorrectionForms") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="txtNoCorrection" runat="server" Columns="10" Font-Bold="True" Font-Names="Arial"
                                Font-Size="Medium" MaxLength="4" Text='<%# Bind("NumberOfCorrectionForms") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RFV_CorrectionNo" runat="server" ControlToValidate="txtNoCorrection"
                                ErrorMessage="***" Font-Bold="True" Font-Names="Arial" Font-Size="X-Large"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="REV_CorrectionNo" runat="server" ControlToValidate="txtNoCorrection"
                                ErrorMessage="ارقام فقط" Font-Bold="True" Font-Names="Arial" Font-Size="Large"
                                ValidationExpression="[0-9]{1,4}"></asp:RegularExpressionValidator>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label10" runat="server" Text='<%# Bind("NumberOfCorrectionForms") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="عدد استمارات الحذف" SortExpression="NumberOfDeletionForms">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox11" runat="server" Text='<%# Bind("NumberOfDeletionForms") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="txtNoDeletion" runat="server" Columns="10" Font-Bold="True" Font-Names="Arial"
                                Font-Size="Medium" MaxLength="4" Text='<%# Bind("NumberOfDeletionForms") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RFV_DeletionNo" runat="server" ControlToValidate="txtNoDeletion"
                                ErrorMessage="***" Font-Bold="True" Font-Names="Arial" Font-Size="X-Large"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="REV_DeletionNo" runat="server" ControlToValidate="txtNoDeletion"
                                ErrorMessage="ارقام فقط" Font-Bold="True" Font-Names="Arial" Font-Size="Large"
                                ValidationExpression="[0-9]{1,4}"></asp:RegularExpressionValidator>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label11" runat="server" Text='<%# Bind("NumberOfDeletionForms") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="عدد استمارات المهجرين" SortExpression="NumberOfIDPForms">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox12" runat="server" Text='<%# Bind("NumberOfIDPForms") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="txtNoIDP" runat="server" Columns="10" Font-Bold="True" Font-Names="Arial"
                                Font-Size="Medium" MaxLength="4" Text='<%# Bind("NumberOfIDPForms") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RFV_IDPNo" runat="server" ControlToValidate="txtNoIDP"
                                ErrorMessage="***" Font-Bold="True" Font-Names="Arial" Font-Size="X-Large"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="REV_IDPNo" runat="server" ControlToValidate="txtNoIDP"
                                ErrorMessage="ارقام فقط" Font-Bold="True" Font-Names="Arial" Font-Size="Large"
                                ValidationExpression="[0-9]{1,4}"></asp:RegularExpressionValidator>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label12" runat="server" Text='<%# Bind("NumberOfIDPForms") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:CommandField ButtonType="Button" InsertText="حفظ" ShowCancelButton="False" ShowInsertButton="True">
                        <ControlStyle Font-Bold="True" Font-Names="Arial" Font-Size="Medium" />
                    </asp:CommandField>
                </Fields>
                <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
                <EditRowStyle BackColor="#D2D6D9" Font-Bold="True" ForeColor="Black" />
            </asp:DetailsView>
            <asp:SqlDataSource ID="SDS_VRCs" runat="server" ConnectionString="<%$ ConnectionStrings:IHEC_VRUConnectionString %>"
                SelectCommand="SELECT VRC_ID, VRC_GOVID FROM VRC_NEW "></asp:SqlDataSource>
            <br />
            <br />
        </div>--%>
    </div>
    <div id="divTop" style="position: absolute; right: 0px; top: 0px; background-color: #afa29a;
        z-index: -2; font-family: Arial; font-size: xx-large; font-weight: bold; text-align: center;
        color: #FFFFFF; width: 100%; height: 1px;">
    </div>
    </form>
</body>
</html>
