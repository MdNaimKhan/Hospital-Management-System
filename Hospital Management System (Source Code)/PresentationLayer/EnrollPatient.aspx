

<%--                                    Autor of This Page is :Md. Ahashan Alam Sojib (TEAM LEADER)
                                                 Email: ahashans@gmail.com                                                        --%>








<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EnrollPatient.aspx.cs" Inherits="PresentationLayer.EnrollPatient" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <%--<link href="/content/css/enroll-style.css" rel="stylesheet" type="text/css" />--%>
    <link href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,700" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:400,700" rel="stylesheet">
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
                background-image: url(/content/images/RegCoverFire.jpg);
                margin-bottom:5%; /*This*/
            }

        .pageTitle {
            font-family: 'Source Sans Pro', sans-serif;
            font-style: oblique;
            text-align: center;
            color: #2c3e50;
            font-weight: 700;
        }

        .formLabels {
            color: #3498db;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1 class="pageTitle">Enroll Patient Form</h1>
    <form runat="server">
        <table class="center">
            <tr>
                <td class="formLabels">
                    <asp:Label CssClass="label label-info" ID="lblPatientID" Text="Patient ID" runat="server" /></td>
                <td>
                    <asp:TextBox ID="txtPatientID" runat="server" CssClass="form-control input-lg" Enabled="false" ForeColor="#00CC99"/>
                </td>
            </tr>
            <tr>
                <td class="formLabels">
                    <asp:Label class="label label-info" ID="lblFName" Text="First Name" runat="server" /></td>
                <td>
                    <asp:TextBox ID="txtFName" runat="server" Class="form-control input-sm" />
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="reqFldValFName" runat="server" ControlToValidate="txtFName" Display="None" ErrorMessage="Please Enter First Name"></asp:RequiredFieldValidator>

                </td>
                <td>
                    <asp:RegularExpressionValidator ID="regExprValFName" runat="server" ControlToValidate="txtFName" Display="None" ErrorMessage="Only Lower and Upper case alphabets are allowed in First Name" ValidationExpression="[a-z,A-Z]*"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="formLabels">
                    <asp:Label CssClass="label label-info" ID="lblLName" Text="Last Name" runat="server" /></td>
                <td>
                    <asp:TextBox CssClass="form-control input-sm" ID="txtLName" runat="server" /></td>
                <td>
                    <asp:RequiredFieldValidator ID="reqFldValLName" runat="server" ControlToValidate="txtLName" Display="None" ErrorMessage="Please Enter Last Name"></asp:RequiredFieldValidator>

                </td>
                <td>
                    <asp:RegularExpressionValidator ID="regExprValLName" runat="server" ControlToValidate="txtLName" Display="None" ErrorMessage="Only Lower and Upper case alphabets are allowed in Last Name" ValidationExpression="[a-z,A-Z]*"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="formLabels">
                    <asp:Label class="label label-info " ID="lblDOB" Text="Date Of Birth" runat="server" /></td>
                <td>
                    <asp:TextBox Class="form-control input-sm" ID="txtDOB" runat="server" />
                </td>
                <td>
                    <asp:ImageButton ID="imgbtnCalender" Height="40px" Width="40px" ImageUrl="content/images/calendar-image-png-29558.png" runat="server" CausesValidation="false" BorderStyle="None" BorderWidth="0px" />
                    <ajaxToolkit:CalendarExtender runat="server" PopupButtonID="imgbtnCalender" TargetControlID="txtDOB" Format="dd/MM/yyyy"></ajaxToolkit:CalendarExtender>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="reqFldValDOB" runat="server" ControlToValidate="txtDOB" Display="None" ErrorMessage="Please Enter Date of Birth"></asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:RegularExpressionValidator ID="regExprValDOB" runat="server" ControlToValidate="txtDOB" Display="None" ErrorMessage="Only 'dd/MM/yyyy' format is allowed" ValidationExpression="^(((0[1-9]|[12]\d|3[01])\/(0[13578]|1[02])\/((1[6-9]|[2-9]\d)\d{2}))|((0[1-9]|[12]\d|30)\/(0[13456789]|1[012])\/((1[6-9]|[2-9]\d)\d{2}))|((0[1-9]|1\d|2[0-8])\/02\/((1[6-9]|[2-9]\d)\d{2}))|(29\/02\/((1[6-9]|[2-9]\d)(0[48]|[2468][048]|[13579][26])|((16|[2468][048]|[3579][26])00))))$"></asp:RegularExpressionValidator>
                </td>
                <td>
                    <asp:CompareValidator ID="ComparevalidatorDOB" runat="server" ErrorMessage="The date must be less than on equal to today"
            Operator="LessThanEqual" ControlToValidate="txtDOB" Type="date" Display="None" />
                </td>
            </tr>
            <tr>
                <td class="formLabels">
                    <asp:Label class="label label-info" ID="lblemail" Text="Email" runat="server" /></td>
                <td>
                    <asp:TextBox Class="form-control input-sm" ID="txtemail" runat="server" TextMode="Email" /></td>
                <td>
                    <asp:RequiredFieldValidator ID="reqFldValEmail" runat="server" ControlToValidate="txtemail" Display="None" ErrorMessage="Please Enter email"></asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:RegularExpressionValidator ID="regExprValEmail" runat="server" ControlToValidate="txtemail" Display="None" ErrorMessage="Please enter a valid email like 'abc@def.com' " ValidationExpression="^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="formLabels">
                    <asp:Label class="label label-info" ID="lblPhnNum" Text="Phone Number" runat="server" />
                </td>
                <td>
                    <asp:TextBox Class="form-control input-sm" ID="txtPhnNum" runat="server" />
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="reqFldValPhone" runat="server" ControlToValidate="txtPhnNum" Display="None" ErrorMessage="Please Enter Phone Number"></asp:RequiredFieldValidator>

                </td>
                <td>
                    <asp:RegularExpressionValidator ID="regExprValPhone" runat="server" ControlToValidate="txtPhnNum" Display="None" ErrorMessage="Please Enter a valid mobile number with 10 digits." ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="formLabels">
                    <asp:Label CssClass="label label-info" ID="lblState" Text="State" runat="server" />
                </td>
                <td>
                    <asp:DropDownList CssClass="form-control input-sm" ID="ddlState" runat="server">
                    </asp:DropDownList>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="reqFldValState" runat="server" Display="None" ControlToValidate="ddlState" InitialValue="Select a State" ErrorMessage="Please select a state" />
                </td>
            </tr>
            <tr>
                <td class="formLabels">
                    <asp:Label class="label label-info" ID="lblPlan" Text="Insurence Plan" runat="server" />
                </td>
                <td>
                    <asp:DropDownList CssClass="form-control input-sm" ID="ddlPlan" runat="server">
                    </asp:DropDownList>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="reqFldVal" runat="server" Display="None" ControlToValidate="ddlPlan" InitialValue="Select a Plan" ErrorMessage="Please select an Insurence Plan" />
                </td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <asp:Button CssClass="btn btn-primary btn-sm" ID="btnSubmit" Text="Submit" runat="server" OnClick="btnSubmit_Click" CausesValidation="true" />
                </td>
                <td>
                    <asp:Button CssClass="btn btn-primary btn-sm" ID="btnReset" Text="Reset" runat="server" OnClientClick="" OnClick="btnReset_Click" CausesValidation="false" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:ValidationSummary ID="ValSumRegister" runat="server" ShowMessageBox="true" ShowSummary="false" />
                </td>
            </tr>
        </table>
        <%--<asp:ScriptManagerProxy id="ScriptManagerProxy1" runat="server"/>--%>

        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    </form>
</asp:Content>
