<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.master" CodeBehind="HideNoDataItem.aspx.cs" Inherits="WebFormsWizardCustomization.HideNoDataItem" %>
<%@ Register Assembly="DevExpress.XtraReports.v26.1.Web.WebForms, Version=26.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraReports.Web" TagPrefix="dx" %>

<asp:Content ID="Content" ContentPlaceHolderID="MainContent" runat="server">
    <!--region HideNoDataItem-->
    <script type="text/javascript">
        function beforeSectionInit(args) {
            if(args.sectionId === DevExpress.Reporting.Designer.Wizard.FullscreenReportWizardSectionId.ChooseDataSourceTypePage) {
                args.section.typeItems.pop();
            }
        }
        function beforePageInit(args) {
            if(args.pageId === DevExpress.Reporting.Designer.Wizard.FullscreenReportWizardPageId.SelectDataSourcePage) {
                args.page.events.addHandler("beforeSectionInitialize", beforeSectionInit);
            }
        }

        function CustomizeWizard(s, e) {
            if(e.Type === "ReportWizard") {
                e.Wizard.events.addHandler("beforePageInitialize", beforePageInit)
            }
        }
    </script>

    <dx:ASPxReportDesigner ID="ASPxReportDesigner5" runat="server">
        <ClientSideEvents CustomizeWizard="CustomizeWizard" />
    </dx:ASPxReportDesigner>
    <!--endregion HideNoDataItem-->
</asp:Content>