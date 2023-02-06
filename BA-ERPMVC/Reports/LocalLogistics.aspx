<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LocalLogistics.aspx.cs" Inherits="BA_ERPMVC.Reports.LocalLogistics1" %>
<%@ Register Assembly="CrystalDecisions.Web" Namespace="CrystalDecisions.Web" TagPrefix="CR" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
       <form id="form1" runat="server">
        <div>
             <CR:CrystalReportViewer ID="Crv" runat="server" AutoDataBind="true" 
             BestFitPage="False" Width="100%" 
            EnableDatabaseLogonPrompt="False" HasCrystalLogo="False" DisplayToolbar="True" 
            EnableDrillDown="True" SelectionFormula = "" EnableParameterPrompt="False" 
            HasRefreshButton="True"  PageZoomFactor="100" ToolPanelView="None" />
        </div>
    </form>

</body>
</html>
