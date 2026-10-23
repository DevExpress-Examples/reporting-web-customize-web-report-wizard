<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.master" CodeBehind="CustomizeColorSchemes.aspx.cs" Inherits="WebFormsWizardCustomization.CustomizeColorSchemes" %>
<%@ Register Assembly="DevExpress.XtraReports.v26.1.Web.WebForms, Version=26.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraReports.Web" TagPrefix="dx" %>

<asp:Content ID="Content" ContentPlaceHolderID="MainContent" runat="server">
    <!--region CustomizeColorSchemes-->
    <script type="text/javascript">
        function beforeSectionInit(args) {
            if (args.sectionId === DevExpress.Reporting.Designer.Wizard.FullscreenReportWizardSectionId.ConfigurePageSettingsPage) {
                // Remove specific color schemes and the capability to specify a custom scheme.
                args.section.removeColorScheme("Grey", "Jeans Blue", "Light Green", "Custom");
                // Uncomment this line to remove all color schemes.
                // args.section.removeAllColorSchemes();
                args.section.addColorScheme("My Color", "255, 96, 110, 246", 6);
            }
        }
        function beforePageInit(args) {
            if(args.pageId === DevExpress.Reporting.Designer.Wizard.FullscreenReportWizardPageId.SpecifyPageSettingsPage) {
                args.page.events.addHandler("beforeSectionInitialize", beforeSectionInit);
            }
        }

        function CustomizeWizard(s, e) {
            if(e.Type === "ReportWizard") {
                e.Wizard.events.addHandler("beforePageInitialize", beforePageInit)
            }
        }
    </script>

    <dx:ASPxReportDesigner ID="ASPxReportDesigner7" runat="server">
        <ClientSideEvents CustomizeWizard="CustomizeWizard" />
    </dx:ASPxReportDesigner>
    <!--endregion CustomizeColorSchemes-->
</asp:Content>