<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.master" CodeBehind="CustomizeWizardResult.aspx.cs" Inherits="WebFormsWizardCustomization.CustomizeWizardResult" %>
<%@ Register Assembly="DevExpress.XtraReports.v26.1.Web.WebForms, Version=26.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraReports.Web" TagPrefix="dx" %>

<asp:Content ID="Content" ContentPlaceHolderID="MainContent" runat="server">
    <!--region CustomizeWizardResult-->
    <script type="text/javascript">
        function beforeFinish(s) {          
            if(!s.wizardModel.ReportTitle) {
                s.wizardModel.ReportTitle = "My Report"
                s.state.reportTitle = "My Report "
            }
        }
        function afterFinish(s) {
            s.wizardResult.name(s.state.reportTitle.replace(/ /g, ""))
            s.wizardResult.displayName(s.state.reportTitle)
        }
        function CustomizeWizard(s, e) {
            if(e.Type === "ReportWizard") {
                e.Wizard.events.addHandler("beforeFinish", beforeFinish)
                e.Wizard.events.addHandler("afterFinish", afterFinish)
            }
        }
    </script>

    <dx:ASPxReportDesigner ID="ASPxReportDesigner9" runat="server">
        <ClientSideEvents CustomizeWizard="CustomizeWizard" />
    </dx:ASPxReportDesigner>
    <!--endregion CustomizeWizardResult-->
</asp:Content>