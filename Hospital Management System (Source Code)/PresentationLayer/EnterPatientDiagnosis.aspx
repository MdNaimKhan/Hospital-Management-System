

<%--                                        Autor of This Page is :Kevin Stephen Biswas
                                                 Email:  bluergost@gmail.com                                          --%>  






<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EnterPatientDiagnosis.aspx.cs" Inherits="PresentationLayer.EnterPatientDiagnosis" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        body {
            background: inherit;
            margin-top:5%; /*This*/
            
        }

        table {
            width: 50%;
        }

            table.center {
                margin: 0 auto;
                border: 3px solid #bdc3c7;
                border-width: thick;
                border-collapse: separate;
                border-spacing: 1.4em;
                background: rgba(18, 52, 86, 0.88);
                margin-bottom:5%; /*This*/
            }

        .pageTitle {
            font-family: 'Source Sans Pro', sans-serif;
            font-style: oblique;
            text-align: center;
            color: #2c3e50;
            font-weight: 700;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server" class="auto-style1">
        <link href="/content/css/enroll-style.css" rel="stylesheet" type="text/css" />
        <table class="center">
            <tbody>
                <tr>
                    <td>
                        <asp:Label CssClass="label label-info" runat="server" Text="Patient ID" ID="lblPatinetId"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList CssClass="form-control input-sm" ID="ddlPatientId" runat="server"></asp:DropDownList>
                    </td>
                </tr>

                <tr>
                    <td>
                        <asp:Label CssClass="label label-info" runat="server" Text="Symptoms" ID="lblsymptoms"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox CssClass="form-control input-sm" ID="tbsymptoms" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator Display="None" ID="RequiredFieldValidatorSymptoms" runat="server" ErrorMessage="Symptoms Is Required" ForeColor="Red" ControlToValidate="tbsymptoms">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator Display="None" ID="RegularExpressionValidatorSymptoms" runat="server" ErrorMessage="Symptoms:Only Alpha-Numeric Character is allowed" ControlToValidate="tbsymptoms" ForeColor="Red" ValidationExpression="^[a-zA-Z0-9 ]+$">*</asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label CssClass="label label-info" ID="lbldiagnosisprovided" runat="server" Text="Diagnosis Provided"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox CssClass="form-control input-sm" ID="tbdiagnosisprovided" runat="server" Height="85px" TextMode="MultiLine" Width="344px"></asp:TextBox>
                        <asp:RequiredFieldValidator Display="None" ID="RequiredFieldValidatorDiagnosisProvided" runat="server" ErrorMessage="Diagnosis Provided Is Required" ControlToValidate="tbdiagnosisprovided" ForeColor="Red">*</asp:RequiredFieldValidator>

                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label CssClass="label label-info" ID="lblSelectPhysician" runat="server" Text="Select Physician"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlPhysician" CssClass="form-control input-sm" runat="server"></asp:DropDownList>
                        <asp:RequiredFieldValidator Display="None" ID="RequiredFieldValidatorPhysician" runat="server" ErrorMessage="Physican Is Required" ForeColor="Red" ControlToValidate="ddlPhysician" InitialValue="Select a Physician">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label CssClass="label label-info" runat="server" Text="Date of Diagnosis"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox CssClass="form-control input-sm" ID="tbDateOfDiagnosis" runat="server"></asp:TextBox>
                        <asp:Image ID="CalanderImgDateOfDiagnosis" runat="server" Height="28px" ImageUrl="~/content/images/calendar-image-png-29539.png" Width="33px" />
                        <ajaxToolkit:CalendarExtender ID="calanderDateOfDiagnosis" runat="server" PopupButtonID="CalanderImgDateOfDiagnosis" TargetControlID="tbDateOfDiagnosis" Format="dd/MM/yyyy" />
                        <asp:RequiredFieldValidator Display="None" ID="RequiredFieldValidatorDateOfDiagnosis" runat="server" ErrorMessage="Date Of Diagnosis Is required" ForeColor="Red" ControlToValidate="tbDateOfDiagnosis">*</asp:RequiredFieldValidator>
                        <asp:CompareValidator Display="None" ID="CompareValidatorDateOfDiagnosis" runat="server" ErrorMessage="Date Of Diagnosis can't be in the past" ControlToValidate="tbDateOfDiagnosis" Operator="GreaterThanEqual" Type="Date" ForeColor="Red">*</asp:CompareValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label CssClass="label label-info" ID="lblFollowUpRequired" runat="server" Text="Follow-up Required"></asp:Label>
                    </td>
                    <td>
                        <asp:CheckBox ID="cbFollowUpRequired" runat="server" Text="Yes" AutoPostBack="True" OnCheckedChanged="cbFollowUpRequired_CheckedChanged" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label CssClass="label label-info" ID="lblFollowUpDate" runat="server" Text="Follow-Up Date"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox CssClass="form-control input-sm" ID="tbFollowUpDate" runat="server" Enabled="False" EnableTheming="True"></asp:TextBox>
                        <asp:ImageButton runat="server" ID="imgFollowUpDate" ImageUrl="~/content/images/calendar-image-png-29539.png" Enabled="False" Height="28px" Width="34px" CausesValidation="False"></asp:ImageButton>
                        <ajaxToolkit:CalendarExtender runat="server" ID="calanderFollowUpDate" Format="dd/MM/yyyy" PopupButtonID="imgFollowUpDate" TargetControlID="tbFollowUpDate"></ajaxToolkit:CalendarExtender>
                        <asp:RequiredFieldValidator Display="None" ID="RequiredFieldValidatorFollowUpDate" runat="server" ErrorMessage="Follow Up Date Is required" ForeColor="Red" ControlToValidate="tbFollowUpDate" Enabled="false">*</asp:RequiredFieldValidator>
                        <asp:CompareValidator Display="None" ID="CompareValidatorFollowUpDate" runat="server" ErrorMessage="Follow Up Date can't be in the past" ControlToValidate="tbFollowUpDate" Operator="GreaterThan" Type="Date" ForeColor="Red">*</asp:CompareValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label CssClass="label label-info" ID="lblBillAmount" runat="server" Text="Bill Amount"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox CssClass="form-control input-sm" ID="tbBillAmount" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator Display="None" ID="RequiredFieldValidatorBillAmount" runat="server" ErrorMessage="Bill Amount Is required" ForeColor="Red" ControlToValidate="tbBillAmount">*</asp:RequiredFieldValidator>

                    </td>
                </tr>

                <tr>
                    <td>
                        <asp:Label CssClass="label label-info" runat="server" Text="Mode Of Payment:" ID="lblModeOfPayment"></asp:Label>
                    </td>
                    <td>
                        <div class="radio radiobuttonlist col-sm-9">
                            <asp:RadioButtonList ID="rblModeOfPayment" runat="server" BackColor="White"
                                RepeatDirection="Vertical" RepeatLayout="Flow" OnSelectedIndexChanged="rblModeOfPayment_SelectedIndexChanged" AutoPostBack="True">
                                <asp:ListItem Text="Card"></asp:ListItem>
                                <asp:ListItem Text="Cash"></asp:ListItem>
                            </asp:RadioButtonList>
                        </div>

                        <asp:RequiredFieldValidator Display="None" ID="RequiredFieldValidatorModeOfPayment" runat="server" ErrorMessage="Mode Of Payment Is required" ForeColor="Red" ControlToValidate="rblModeOfPayment" Enabled="True">*</asp:RequiredFieldValidator>

                    </td>
                </tr>

                <tr>
                    <td>
                        <asp:Label CssClass="label label-info" ID="lblCardNumber" runat="server" Text="Card Number:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox CssClass="form-control input-sm" ID="tbCardNumber" runat="server" Enabled="False"></asp:TextBox>
                        <asp:RequiredFieldValidator Display="None" ID="RequiredFieldValidatorCardNumber" runat="server" ErrorMessage="Card Number Is required" ForeColor="Red" ControlToValidate="tbCardNumber">*</asp:RequiredFieldValidator>
                    </td>
                </tr>

                <tr>
                    <td>
                        <asp:Button CssClass="btn btn-primary btn-sm" ID="btnSubmit" runat="server" Text="Submit" BackColor="#FF5050" ForeColor="Blue" OnClick="btnSubmit_Click" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label CssClass="label label-info" ID="lblServerSideValidationMassange" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:ValidationSummary ID="ValidationSummaryEnterPaientDiagnosis" runat="server" ForeColor="Red" ShowMessageBox="true" HeaderText="Validation Errors" ShowSummary="false" />
                    </td>
                </tr>
            </tbody>
        </table>
        <asp:ScriptManager runat="server" ID="ScriptManager1"></asp:ScriptManager>
    </form>

</asp:Content>
