<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.master" CodeBehind="ProhibitNewDataSourceCreation.aspx.cs" Inherits="WebFormsWizardCustomization.ProhibitNewDataSourceCreation" %>
<%@ Register Assembly="DevExpress.XtraReports.v26.1.Web.WebForms, Version=26.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraReports.Web" TagPrefix="dx" %>

<asp:Content ID="Content" ContentPlaceHolderID="MainContent" runat="server">
    <!--region ProhibitNewDataSourceCreation-->
    <script type="text/javascript">
        function beforeSectionInit(args) {
            // Indetify the section that allows users to select available data sources.
            if (args.sectionId === DevExpress.Reporting.Designer.Wizard.FullscreenReportWizardSectionId.ChooseAvailableDataSourcePage) {   
                // Disable the capability to create new data sources (hide the radio group with a choice).             
                args.section.canCreateNew(false);
            }
        }

        function beforePageInit(args) {
            // Identify the "Select Data Source" page.
            if(args.pageId === DevExpress.Reporting.Designer.Wizard.FullscreenReportWizardPageId.SelectDataSourcePage) {
                // Remove the "Select the data source type" section.
                args.page.unregisterSection(DevExpress.Reporting.Designer.Wizard.FullscreenReportWizardSectionId.ChooseDataSourceTypePage);
                // Make the remaining section occupy the entire page.
                args.page.setSectionPosition(DevExpress.Reporting.Designer.Wizard.FullscreenReportWizardSectionId.ChooseAvailableDataSourcePage);
                // Handle the page's beforeSectionInitialize event.
                args.page.events.addHandler("beforeSectionInitialize", beforeSectionInit)
                // // Override the navigation logic to skip the removed section.
                args.page.getNextPageId = function(pageId) {
                    if(!pageId) return DevExpress.Reporting.Designer.Wizard.FullscreenReportWizardSectionId.ChooseAvailableDataSourcePage;
                }
            }
        }

        function afterInit(args) {
            // Remove the "Specify Data Source Settings (Database)" page's metadata from the factory.
            args.wizard.pageFactory.unregisterMetadata(DevExpress.Reporting.Designer.Wizard.FullscreenReportWizardPageId.SpecifySqlDataSourceSettingsPage);
            // Remove the "Specify Data Source Settings (JSON)" page's metadata from the factory.
            args.wizard.pageFactory.unregisterMetadata(DevExpress.Reporting.Designer.Wizard.FullscreenReportWizardPageId.SpecifyJsonDataSourceSettingsPage);
            // Override the navigation logic to skip the removed pages.
            var defaultGetNextPageId = args.wizard.iterator.getNextPageId;
            args.wizard.iterator.getNextPageId = function (pageId) {
                if (pageId === DevExpress.Reporting.Designer.Wizard.FullscreenReportWizardPageId.SelectDataSourcePage) {
                    return DevExpress.Reporting.Designer.Wizard.FullscreenReportWizardPageId.DefineReportLayoutPage;
                } else {
                    return defaultGetNextPageId.apply(this, [pageId]);
                }
            }
        }

        function CustomizeWizard(s, e) {
            if(e.Type === "ReportWizard") {
                e.Wizard.events.addHandler("afterInitialize", afterInit)
                e.Wizard.events.addHandler("beforePageInitialize", beforePageInit)
            }
        }
    </script>

    <dx:ASPxReportDesigner ID="ASPxReportDesigner6" runat="server">
        <ClientSideEvents CustomizeWizard="CustomizeWizard" />
    </dx:ASPxReportDesigner>
    <!--endregion ProhibitNewDataSourceCreation-->
</asp:Content>