
<%--                                          Autor of This Page is :Md. Naim Khan 
                                                 Email: naim1248@gmail.com                                   --%>







<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewPatientInformation.aspx.cs" Inherits="PresentationLayer.ViewPatientInformation" %>
<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

 



    <style type="text/css">
        body {
            background: inherit;
            margin-top:5%;
        }
        table.center {
                margin-left: auto;
                margin-right: auto;
                border: 3px solid #bdc3c7;
                border-width: thick;
                border-collapse: separate;
                border-spacing: 1.5em;
                width:300px;
                height:200px;
                margin-bottom:5%;
            }
        
 

        .grid{ border-collapse:collapse;text-align:center}

.grid td{padding: 15px  ;border:1px solid #c1c1c1;color:#444;font-size:1em;}

.grid th{padding:10px 28px ; color:white;   border:1px solid #c1c1c1;font-size:1em;text-align:center ;}




.grid th a{color:White;text-decoration:none ; }

.grid th a:hover{color:#444;text-decoration:none ;}

.grid .alt{background:linear-gradient(#fff,#e6e6e6);}




    
     .panelStyle{

         position:fixed;
         top:10%;
         left:10px;
         width:300px;
         height:125px;
         text-align:center;
         background-color:white;
         padding-top:20px;
         
         border-radius:15px;
     }


    </style>
                                  
     
                                     
 

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <br />
    <br />
   


    <form  runat="server"  >
        <table id="textboxButtonContainer" class="center" style="font-family: 'Rockwell Extra Bold';
      background-size:cover;          background-image:url('/content/images/surgery-center.jpg');color:#FFFFFF; font-size:large; font-weight: bold; font-style: italic;">
            <tr>
                <td >
                    <asp:Label ID="lblPtntID" runat="server" Text="Patient ID" Class="label control-label"></asp:Label>
                </td>
                <td >
                    <asp:TextBox ID="txtPtntID" runat="server" Class="form-control input-sm" ForeColor="Black"></asp:TextBox>
                    
                </td>
               
                <td>
                      <asp:RegularExpressionValidator ID="regExprVal" runat="server" ControlToValidate="txtPtntID" Display="None" ErrorMessage="Please enter a valid id" ValidationExpression="[0-9]*"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr >
                <td  >
                    <asp:Label class="label control-label" ID="lblFName" Text="First Name" runat="server"  /></td>
                <td>
                    <asp:TextBox ID="txtFName" runat="server" Class="form-control input-sm"/>
                </td>
                 
                <td>
                    <asp:RegularExpressionValidator ID="regExprValFName" runat="server" ControlToValidate="txtFName" Display="None" ErrorMessage="Only Lower and Upper case alphabets are allowed in First Name" ValidationExpression="[a-z,A-Z]*"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td  >
                    <asp:Label class="label control-label" ID="lblLName"  Text="Last Name" runat="server" /></td>
                <td>
                    <asp:TextBox Class="form-control input-sm" ID="txtLName" runat="server" /></td>
                
                <td>
                    <asp:RegularExpressionValidator ID="regExprValLName" runat="server" ControlToValidate="txtLName" Display="None" ErrorMessage="Only Lower and Upper case alphabets are allowed in Last Name" ValidationExpression="[a-z,A-Z]*"></asp:RegularExpressionValidator>
                </td>
            </tr>

         <!----------------------------------------------------------------------Button--------------------------------------------------------------------->


            <tr>
                <td>
                    <asp:Button Class="btn btn-success" ID="btn_viewpat_submit" runat="server" OnClick="btn_submit_Click" Text="Submit"  />
                   
                   </td>
               
                <td>
                    <asp:Button Class=" btn btn-primary" ID="btn_reset" runat="server" Text="Reset" OnClick="btn_reset_Click"   />
                </td>
            </tr>
           
        </table>

         <asp:ValidationSummary ID="valSum_viewPat" runat="server"  ShowMessageBox="True" ShowSummary="False" style="margin-left: 596px" />


        <!-----------------------------------------------------------------------Grid------------------------------------------------------------------------------------------>



    
         
       
          <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <table id="gridViewContainer" class="center" style="border:none">
            <tr>
                <td>
                    <br />
                    <br />
                    <asp:GridView ID="GridViewViewPat" runat="server" CellPadding="4" border-radius="10px" GridLines="None" AutoGenerateColumns="False" CssClass="grid" ForeColor="White"
                         OnSelectedIndexChanged="GridViewViewPat_SelectedIndexChanged"   >
                        <AlternatingRowStyle BackColor="White" CssClass="alt" />
                        <Columns>
                            <asp:BoundField DataField="patient_id" HeaderText="Patient ID" />
                            <asp:BoundField DataField="first_name" HeaderText="First Name" />
                            <asp:BoundField DataField="last_name" HeaderText="Last Name" />
                            <asp:BoundField DataField="date_of_diagnosis" HeaderText="Date Of Diagnosis" DataFormatString="{0:d}" />
                            <asp:BoundField DataField="physician_id" HeaderText="Physician ID" />

                             <asp:TemplateField HeaderText="Symptoms">
                                 
                                <ItemTemplate> 
                                    <asp:LinkButton ID="lnkb_symptoms" runat="server" Text='<%#  Eval("symptoms").ToString().Length>7
                                            ? (Eval("symptoms") as string).Substring(0,7) : Eval("symptoms")%>'>Button</asp:LinkButton>
                                    
                                    <ajaxToolkit:ModalPopupExtender ID="popUp_Symptoms" runat="server" TargetControlID="lnkb_symptoms" PopupControlID="pnl_symptoms" 
                                      OkControlID="okButtonSymp"></ajaxToolkit:ModalPopupExtender>
                                       
                                    <asp:Panel ID="pnl_symptoms" runat="server" CssClass="panelStyle">
                                             <asp:Label ID="lbl_panel_symptoms" runat="server" Text='<%# Bind("symptoms") %>'></asp:Label>
                                                <asp:Button ID="okButtonSymp" runat="server" CssClass="close" Text="x" />
                                    </asp:Panel> 
                                  
              
                                </ItemTemplate>
                                  
                                                              
                            </asp:TemplateField>
                   

 

                            <asp:TemplateField HeaderText="Diagnosis">
                                <ItemTemplate>

                                    <asp:LinkButton ID="lnkb_diagnosis" runat="server" Text='<%#  Eval("diagnosis").ToString().Length>7
                                            ? (Eval("diagnosis") as string).Substring(0,7) : Eval("diagnosis")%>'>Button</asp:LinkButton>
                                    
                                    <ajaxToolkit:ModalPopupExtender ID="popUp_diagnosis" runat="server" TargetControlID="lnkb_diagnosis" PopupControlID="pnl_diagnosis" 
                                      OkControlID="okButtonDiag"></ajaxToolkit:ModalPopupExtender>
                                       
                                    <asp:Panel ID="pnl_diagnosis" runat="server" CssClass="panelStyle">
                                             <asp:Label ID="lbl_panel_diagnosis" runat="server" Text='<%# Bind("diagnosis") %>'></asp:Label>
                                                <asp:Button ID="okButtonDiag" runat="server" CssClass="close" Text="x" />
                                    </asp:Panel>



                                     
                                </ItemTemplate>
                            </asp:TemplateField>


                            <asp:BoundField DataField="date_of_followup" HeaderText="Follow UP Date" DataFormatString="{0:d}" />
                            <asp:BoundField DataField="bill_amount" HeaderText="Bill Amount" />

                           

                        </Columns>
                        <EditRowStyle BackColor="#2461BF" />
                        <FooterStyle BackColor="#507CD1" ForeColor="White" Font-Bold="True" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#EFF3FB" CssClass="info" />
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#F5F7FB" />
                        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                        <SortedDescendingCellStyle BackColor="#E9EBEF" />
                        <SortedDescendingHeaderStyle BackColor="#4870BE" />
                    </asp:GridView>
                   
                 
                    
 
                </td>
            </tr>
        </table>   
        
        
        
    </form>
</asp:Content>
