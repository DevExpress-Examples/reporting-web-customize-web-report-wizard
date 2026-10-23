<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.master" CodeBehind="HideReportTypes.aspx.cs" Inherits="WebFormsWizardCustomization.HideReportTypes" %>
<%@ Register Assembly="DevExpress.XtraReports.v26.1.Web.WebForms, Version=26.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraReports.Web" TagPrefix="dx" %>

<asp:Content ID="Content" ContentPlaceHolderID="MainContent" runat="server">
    <!--region HideReportTypes-->
    <script type="text/javascript">
        function beforePageInit(args) {
            // Remove the 'Empty Report' and 'Label Report' types.
            if(args.pageId === DevExpress.Reporting.Designer.Wizard.FullscreenReportWizardPageId.SelectReportTypePage) {
                args.page.typeItems.splice(0, 1);
                args.page.typeItems.pop();
            }
        }

        function CustomizeWizard(s, e) {
            if(e.Type === "ReportWizard") {
                e.Wizard.events.addHandler("beforePageInitialize", beforePageInit)
            }
        }
    </script>

    <dx:ASPxReportDesigner ID="ASPxReportDesigner4" runat="server">
        <ClientSideEvents CustomizeWizard="CustomizeWizard" />
    </dx:ASPxReportDesigner>
    <!--endregion HideReportTypes-->
</asp:Content>