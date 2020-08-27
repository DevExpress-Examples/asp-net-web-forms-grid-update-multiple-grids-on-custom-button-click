<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.15.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxCallbackPanel" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.15.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.15.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPanel" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.15.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ASPxGridView batch editing - Hide update / cancel links</title>
    <script type="text/ecmascript">
        function OnUpdateClick(s, e) {
            cp.PerformCallback("Update");
        }

        function OnCancelClick(s, e) {
            cp.PerformCallback("Cancel");
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <dx:ASPxCallbackPanel ID="cp" runat="server" ClientInstanceName="cp" OnCallback="cp_Callback">
            <PanelCollection>
                <dx:PanelContent runat="server" SupportsDisabledAttribute="True">
                    <dx:ASPxGridView ID="gv1" runat="server" AutoGenerateColumns="False" DataSourceID="ads1"
                        KeyFieldName="CategoryID" OnRowUpdating="gv1_RowUpdating" OnCommandButtonInitialize="gv_CommandButtonInitialize">
                        <Columns>
                            <dx:GridViewCommandColumn ShowEditButton="True" ShowInCustomizationForm="True"
                                VisibleIndex="0">
                            </dx:GridViewCommandColumn>
                            <dx:GridViewDataTextColumn FieldName="CategoryID" ReadOnly="True"
                                ShowInCustomizationForm="True" VisibleIndex="1">
                                <EditFormSettings Visible="False" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="CategoryName"
                                ShowInCustomizationForm="True" VisibleIndex="2">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Description"
                                ShowInCustomizationForm="True" VisibleIndex="3">
                            </dx:GridViewDataTextColumn>
                        </Columns>
                    </dx:ASPxGridView>
                    <dx:ASPxGridView ID="gv2" runat="server" AutoGenerateColumns="False" DataSourceID="ads2"
                        KeyFieldName="ProductID" OnRowUpdating="gv2_RowUpdating" OnCommandButtonInitialize="gv_CommandButtonInitialize">
                        <Columns>
                            <dx:GridViewCommandColumn ShowEditButton="True" ShowInCustomizationForm="True"
                                VisibleIndex="0">
                            </dx:GridViewCommandColumn>
                            <dx:GridViewDataTextColumn FieldName="ProductID" ReadOnly="True"
                                ShowInCustomizationForm="True" VisibleIndex="1">
                                <EditFormSettings Visible="False" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="ProductName"
                                ShowInCustomizationForm="True" VisibleIndex="2">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="UnitPrice" ShowInCustomizationForm="True"
                                VisibleIndex="3">
                            </dx:GridViewDataTextColumn>
                        </Columns>
                    </dx:ASPxGridView>
                </dx:PanelContent>
            </PanelCollection>
        </dx:ASPxCallbackPanel>
        <dx:ASPxButton ID="updateBtn" runat="server" Text="Update" AutoPostBack="false">
            <ClientSideEvents Click="OnUpdateClick" />
        </dx:ASPxButton>
        <dx:ASPxButton ID="cancelBtn" runat="server" Text="Cancel" AutoPostBack="false">
            <ClientSideEvents Click="OnCancelClick" />
        </dx:ASPxButton>
        <asp:AccessDataSource ID="ads1" runat="server" DataFile="~/App_Data/nwind.mdb"
            SelectCommand="SELECT [CategoryID], [CategoryName], [Description] FROM [Categories]"
            UpdateCommand="UPDATE [Categories] SET [CategoryName] = ?, [Description] = ? WHERE [CategoryID] = ?">
            <UpdateParameters>
                <asp:Parameter Name="CategoryName" Type="String" />
                <asp:Parameter Name="Description" Type="String" />
                <asp:Parameter Name="CategoryID" Type="Int32" />
            </UpdateParameters>
        </asp:AccessDataSource>
        <asp:AccessDataSource ID="ads2" runat="server" DataFile="~/App_Data/nwind.mdb"
            SelectCommand="SELECT TOP 8 [ProductID], [ProductName], [UnitPrice] FROM [Products]"
            UpdateCommand="UPDATE [Products] SET [ProductName] = ?, [UnitPrice] = ? WHERE [ProductID] = ?">
            <UpdateParameters>
                <asp:Parameter Name="ProductName" Type="String" />
                <asp:Parameter Name="UnitPrice" Type="Decimal" />
                <asp:Parameter Name="ProductID" Type="Int32" />
            </UpdateParameters>
        </asp:AccessDataSource>
    </form>
</body>
</html>
