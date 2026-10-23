<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.master" CodeBehind="SelectDataFields.aspx.cs" Inherits="WebFormsWizardCustomization.SelectDataFields" %>
<%@ Register Assembly="DevExpress.XtraReports.v26.1.Web.WebForms, Version=26.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraReports.Web" TagPrefix="dx" %>

<asp:Content ID="Content" ContentPlaceHolderID="MainContent" runat="server">
    <!--region SelectDataFields-->
    <script type="text/javascript">
        function afterSectionInit(args) {
            if (args.sectionId === DevExpress.Reporting.Designer.Wizard.FullscreenReportWizardSectionId.SelectDataMembersPage_Members) {
                args.section.selectAllDataFields();

                // Uncomment these lines to select specific data fields.
                //args.section.selectDataField("Categories.CategoryID")
                //args.section.selectDataField("Categories.CategoryName")

                // Uncomment this line to select the 'Products' table's fields.
                //args.section.selectDataFields("Products")
            }
        }
        function afterPageInit(args) {
            if(args.pageId === DevExpress.Reporting.Designer.Wizard.FullscreenReportWizardPageId.DefineReportLayoutPage) {
                args.page.events.addHandler("afterSectionInitialize", afterSectionInit);
            }
        }

        function CustomizeWizard(s, e) {
            if(e.Type === "ReportWizard") {
                e.Wizard.events.addHandler("afterPageInitialize", afterPageInit)
            }
        }
    </script>

    <dx:ASPxReportDesigner ID="ASPxReportDesigner8" runat="server">
        <ClientSideEvents CustomizeWizard="CustomizeWizard" />
    </dx:ASPxReportDesigner>
    <!--endregion SelectDataFields-->
</asp:Content>