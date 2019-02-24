 
<%--                                          Autor of This Page is :Md. Fokhor Uddin 
                                                 Email: tareq007.mt@gmail.com                                   --%>









<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddPhysician.aspx.cs" Inherits="PresentationLayer.AddPhysician" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        body {
            background: inherit;
            margin-top:5%; /*This*/
        }
                        
        table {
            width:50%;
        }

            table.center {
                margin: 0 auto;
                border: 3px solid #bdc3c7;
                border-width: thick;
                border-collapse: separate;
                border-spacing: 1.4em;
                /*background: rgba(211,76,190,0.88);*/
                margin-bottom:5%; /*This*/
                background-image: url(/content/images/physician_tools.jpg);
            }

        .pageTitle {
            font-family: 'Source Sans Pro', sans-serif;
            font-style: oblique;
            text-align: center;
            color:#2c3e50;
            font-weight:700;
        }
        .formLabels{
            color: #3498db;

        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form  method="post" runat="server">
        <table class="center">
            <tr >
                <td class="">
                    <asp:Label class="label label-info" ID="lblFristN" Text="First Name" runat="server" /></td>
                <td>
                    <asp:TextBox ID="txtFristN" runat="server" Class="form-control input-sm"/>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="reqFieldValidatorFName" runat="server" ControlToValidate="txtFristN" Display="None" ErrorMessage="Please Enter First Name"></asp:RequiredFieldValidator>

                </td>
                <td>
                    <asp:RegularExpressionValidator ID="regExpressionValidatorFName" runat="server" ControlToValidate="txtFristN" Display="None" ErrorMessage="Only Lower and Upper case alphabets are allowed in First Name" ValidationExpression="[a-z,A-Z]*"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="">
                    <asp:Label class="label label-info" ID="lblLastN"  Text="Last Name" runat="server" /></td>
                <td>
                    <asp:TextBox Class="form-control input-sm" ID="txtLastN" runat="server" /></td>
                <td>
                    <asp:RequiredFieldValidator ID="reqFieldValidatorLastN" runat="server" ControlToValidate="txtLastN" Display="None" ErrorMessage="Enter the Last Name"></asp:RequiredFieldValidator>

                </td>
                <td>
                    <asp:RegularExpressionValidator ID="regExpressionValidatorLastN" runat="server" ControlToValidate="txtLastN" Display="None" ErrorMessage="Only Lower and Upper case alphabets are allowed in Last Name" ValidationExpression="[a-z,A-Z]*"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="">
                    <asp:Label class="label label-info" ID="labelDepartment" Text="Department" runat="server" />
                </td>
                <td>
                    <asp:DropDownList CssClass="form-control input-sm" ID="DropDownLDepartment" runat="server">
                    </asp:DropDownList>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="reqFieldValidatorDeparment" runat="server" Display="None" ControlToValidate="DropDownLDepartment" InitialValue="Select a Plan" ErrorMessage="Please select an Insurence Plan" />
                </td>
            </tr>
            <tr>
                <td class="">
                    <asp:Label class="label label-info" ID="LabelEduQ"  Text="Educational Qualification" runat="server" /></td>
                <td>
                    <asp:TextBox Class="form-control input-sm" ID="TextBoxEduQ" runat="server" /></td>
                <td>
                    <asp:RequiredFieldValidator ID="ReqFieldValidatorEduQ" runat="server" ControlToValidate="TextBoxEduQ" Display="None" ErrorMessage="Please Enter Educational Qualification"></asp:RequiredFieldValidator>

                </td>
                <td>
                    <asp:RegularExpressionValidator ID="RegExpressionValidatorEduQ" runat="server" ControlToValidate="TextBoxEduQ" Display="None" ErrorMessage="Only Lower and Upper case alphabets and '.'`s and space's are allowed in Educational Qualification" ValidationExpression="[a-zA-Z\s\.]*"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="">
                    <asp:Label class="label label-info" ID="LabelExp"  Text="Years of Experience" runat="server" /></td>
                <td>
                    <asp:TextBox Class="form-control input-sm" ID="TextBoxExp" runat="server" /></td>
                <td>
                    <asp:RequiredFieldValidator ID="ReqFieldValidatorExp" runat="server" ControlToValidate="TextBoxExp" Display="None" ErrorMessage="Please Enter Years of experience"></asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:RegularExpressionValidator ID="RegExpressionValidatorExp" runat="server" ControlToValidate="TextBoxExp" Display="None" ErrorMessage="Only a one or two digit integer is allowed in Years of Experience" ValidationExpression="[0-9]{1,2}"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
            <td class="">
                    <asp:Label class="label label-info" ID="LabelState" Text="State" runat="server" />
                </td>
                <td>
                    <asp:DropDownList CssClass="form-control input-sm" ID="DropDownLState" runat="server">
                    </asp:DropDownList>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="reqFieldValidatorState" runat="server" Display="None" ControlToValidate="DropDownLState" InitialValue="Select a State" ErrorMessage="Please select a state" />
                </td>
            </tr>
            <tr>
                <td class="">
                    <asp:Label class="label label-info" ID="LabelIns" Text="Insurence Plan" runat="server" />
                </td>
                <td>
                    <asp:DropDownList CssClass="form-control input-sm" ID="DropDownLPlns" runat="server">
                    </asp:DropDownList>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="ReqFieldValidatorIns" runat="server" Display="None" ControlToValidate="DropDownLPlns" InitialValue="Select a Plan" ErrorMessage="Please select an Insurence Plan" />
                </td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <asp:Button  class="btn btn-primary btn-sm" ID="buttonRegister" Text="Register" runat="server" OnClick="btnRegister_Click" CausesValidation="true" />
                </td>
                <td>
                    <asp:Button class="btn btn-primary btn-sm" ID="buttonReset" Text="Reset" runat="server" OnClientClick="" OnClick="btnReset_Click" CausesValidation="false" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:ValidationSummary ID="ValSumRegister" runat="server" ShowMessageBox="true" ShowSummary="false" />
                </td>
            </tr>
        </table>
    </form>
</asp:Content>
