<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.master" CodeBehind="PredefinedSettings.aspx.cs" Inherits="WebFormsWizardCustomization.PredefinedSettings" %>
<%@ Register Assembly="DevExpress.XtraReports.v26.1.Web.WebForms, Version=26.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraReports.Web" TagPrefix="dx" %>

<asp:Content ID="Content" ContentPlaceHolderID="MainContent" runat="server">

    <!--region PredefinedSettings-->
    <script type="text/javascript">
        function beforeInit(args) {
            // Customize the default page size and orientation.
            args.state.pageSetup.paperKind = "A4";
            args.state.pageSetup.landscape = true;
        }

        function CustomizeWizard(s, e) {
            if (e.Type === "ReportWizard") {
                e.Wizard.events.addHandler("beforeInitialize", beforeInit)
            }
        }
    </script>

    <dx:ASPxReportDesigner ID="ASPxReportDesigner1" runat="server">
        <ClientSideEvents CustomizeWizard="CustomizeWizard" />
    </dx:ASPxReportDesigner>
    <!--endregion PredefinedSettings-->
</asp:Content>