
<%--                                          Autor of This Page is :Md. Golam Rabby
                                                 Email: golamrabby312@gmail.com                                   --%>






<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SearchPhysician.aspx.cs" Inherits="PresentationLayer.SearchPhysician" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        body {
            background: inherit;
            /*font-weight: 700;*/
            margin-top:5%;
        }

       
            table.center {
                 
             border-color: inherit;
                margin-bottom:5%;
                margin-left: auto;
                margin-right: auto;
                border: 3px solid #bdc3c7;
                border-width: thick;
                border-collapse: separate;
                border-spacing: 1.5em;
                width:300px;
                height:200px;

           }
            
        .pageTitle {
            font-family: 'Source Sans Pro', sans-serif;
            font-style: oblique;
            text-align: center;
            color:#2c3e50;
            font-weight:700;
        }
        .formLabels{
            color:black;

        }














        
        .grid{ border-collapse:collapse;text-align:center}

.grid td{padding:10px ;border:1px solid #c1c1c1;color:#444;font-size:1em;}

.grid th{padding:12px 8px ; color:white;   border:1px solid #c1c1c1;font-size:1em;text-align:center ;}




.grid th a{color:White;text-decoration:none ; }

.grid th a:hover{color:#444;text-decoration:none ;}

.grid .alt{background:linear-gradient(#fff,#e6e6e6);}
























    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
         <form  method="post" runat="server">
              
        <table class="center" style=" background-image: url('/content/images/doctor.jpg');">
            <tr >
                <td class="">
                    <asp:Label class="label label-info" ID="lbState" runat="server" Text="State"></asp:Label></td>
                <td>
                    <asp:DropDownList ID="ddlState" Class="form-control input-sm" runat="server"  >
                    </asp:DropDownList>
                    </td>
                <td>
                    <asp:RequiredFieldValidator ID="ReqFldVldState" runat="server" InitialValue="Select a State" Display="None" ErrorMessage="Please select a State" ControlToValidate="ddlState"></asp:RequiredFieldValidator>
                    </td>
                    </tr>
            <tr>
                <td class="">
                    <asp:Label   CssClass="label label-info" ID="lbPlan" runat="server" Text="Plan"></asp:Label></td>
                <td>
                    <asp:DropDownList CssClass="form-control input-sm" Width="155px" ID="ddlPlan" runat="server">
                    </asp:DropDownList></td>
                <td>
                    <asp:RequiredFieldValidator ID="ReqFldVldPlan" runat="server" InitialValue="Select a Plan" Display="None" ErrorMessage="Please select a Plan" ControlToValidate="ddlPlan"></asp:RequiredFieldValidator>
                    </td>
                </tr>
            <tr>
                <td class="">
                    <asp:Label class="label label-info" ID="lbDept" runat="server" Text="Department"></asp:Label></td>
                <td>
                    <asp:DropDownList CssClass="form-control input-sm" ID="ddlDept" runat="server">
                    </asp:DropDownList></td>
                <td>
                    <asp:RequiredFieldValidator ID="ReqFldVldDept" runat="server" InitialValue="Select a Department" Display="None" ErrorMessage="Please select a Department" ControlToValidate="ddlDept"></asp:RequiredFieldValidator>
                    </td>
                </tr>
            <tr>
                <td> 
                    <asp:Button CssClass="btn btn-info" ID="BtnSearch" runat="server" OnClick="BtnSearch_Click" Text="Search" />
                    
                    </td>
                <td>
                    <asp:Button CssClass="btn btn-default" ID="BtnReset" runat="server" OnClick="BtnReset_Click" Text="Reset" />
                    </td>
                
                </tr>
                    
                    </table>
             <asp:ValidationSummary ID="ValidationSumSearchPhy" runat="server" ShowMessageBox="True" ShowSummary="False" />
              
             <br />
             <br />
             <br />

             <table id="gridViewContainer" class="center" style="border:none">
              <tr>
                  <td> 
                      <asp:GridView ID="GridViewPhysician" runat="server" CellPadding="4" GridLines="none" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CssClass="grid">
                        <AlternatingRowStyle BackColor="#DCDCDC" CssClass="alt" />
                        <Columns>
                             <asp:BoundField DataField="physician_id" HeaderText="Physician ID" />
                            <asp:BoundField DataField="first_name" HeaderText="First Name" />
                            <asp:BoundField DataField="last_name" HeaderText="Last Name" />
                             <asp:BoundField DataField="department_id" HeaderText="Department ID" />
                            <asp:BoundField DataField="educational_qualification" HeaderText="Educational Qualification" />
                             <asp:BoundField DataField="years_of_experience" HeaderText="Years of Exprience" />
                            <asp:BoundField DataField="department_name" HeaderText="Department Name" />
                             <asp:BoundField DataField="plan_id" HeaderText="Plan" />
                            <asp:BoundField DataField="state" HeaderText="State" />
                            </Columns>
                      <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                        <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                        <RowStyle BackColor="#EEEEEE" ForeColor="Black" CssClass="info" />
                      </asp:GridView>

                  </td>
                    
               </tr>
                 
                 </table>
            
                
         </form>
</asp:Content>
