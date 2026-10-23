<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.master" CodeBehind="RemovePageSection.aspx.cs" Inherits="WebFormsWizardCustomization.RemovePageSection" %>
<%@ Register Assembly="DevExpress.XtraReports.v26.1.Web.WebForms, Version=26.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraReports.Web" TagPrefix="dx" %>

<asp:Content ID="Content" ContentPlaceHolderID="MainContent" runat="server">
    <!--region RemovePageSection-->
    <script type="text/javascript">
       function beforePageInit(args) {
           // Identify the "Select Data Source" page.
           if (args.pageId === DevExpress.Reporting.Designer.Wizard.FullscreenReportWizardPageId.SelectDataSourcePage) {
               // Remove the page's section that displays available data sources.
               args.page.unregisterSection(DevExpress.Reporting.Designer.Wizard.FullscreenReportWizardSectionId.ChooseAvailableDataSourcePage);
               // Make the "Select data source type" section occupy the entire page.
               args.page.setSectionPosition(DevExpress.Reporting.Designer.Wizard.FullscreenReportWizardSectionId.ChooseDataSourceTypePage);
               // Override the navigation logic to skip the removed section.
               args.page.getNextSectionId = function(sectionId) {
                   if(!sectionId) return DevExpress.Reporting.Designer.Wizard.FullscreenReportWizardSectionId.ChooseDataSourceTypePage;
               }
           }
       }

       function CustomizeWizard(s, e) {
           if(e.Type === "ReportWizard") {
               e.Wizard.events.addHandler("beforePageInitialize", beforePageInit)
           }
       }
    </script>

    <dx:ASPxReportDesigner ID="ASPxReportDesigner3" runat="server">
        <ClientSideEvents CustomizeWizard="CustomizeWizard" />
    </dx:ASPxReportDesigner>
    <!--endregion RemovePageSection-->
</asp:Content>