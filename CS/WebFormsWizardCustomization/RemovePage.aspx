<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.master" CodeBehind="RemovePage.aspx.cs" Inherits="WebFormsWizardCustomization.RemovePage" %>
<%@ Register Assembly="DevExpress.XtraReports.v26.1.Web.WebForms, Version=26.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraReports.Web" TagPrefix="dx" %>

<asp:Content ID="Content" ContentPlaceHolderID="MainContent" runat="server">
    <!--region RemovePage-->
    <script type="text/javascript">
       function beforeInit(args) {
           args.state.dataSourceType = 1;
       }

       function afterInit(args) {
           // Remove the "Select Data Source" page's metadata from the factory.
           args.wizard.pageFactory.unregisterMetadata(DevExpress.Reporting.Designer.Wizard.FullscreenReportWizardPageId.SelectDataSourcePage);
           // Override the navigation logic to skip the "Select Data Source" page.
           var defaultGetNextPageId = args.wizard.iterator.getNextPageId;
           args.wizard.iterator.getNextPageId = function (pageId) {
               if (pageId === DevExpress.Reporting.Designer.Wizard.FullscreenReportWizardPageId.SelectReportTypePage) {
                   return DevExpress.Reporting.Designer.Wizard.FullscreenReportWizardPageId.SpecifySqlDataSourceSettingsPage;
               } else {
                   return defaultGetNextPageId.apply(this, [pageId]);
               }
           }
       }

       function CustomizeWizard(s, e) {
           if (e.Type === "ReportWizard") {
               e.Wizard.events.addHandler("beforeInitialize", beforeInit)
               e.Wizard.events.addHandler("afterInitialize", afterInit)
           }
       }
    </script>

    <dx:ASPxReportDesigner ID="ASPxReportDesigner2" runat="server">
        <ClientSideEvents CustomizeWizard="CustomizeWizard" />
    </dx:ASPxReportDesigner>
    <!--endregion RemovePage-->
</asp:Content>
