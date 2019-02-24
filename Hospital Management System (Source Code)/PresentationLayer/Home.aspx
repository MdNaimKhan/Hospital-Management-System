<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="PresentationLayer.Home" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        body {
            background: inherit;
        }

        .carousel-inner > .item > img,
        .carousel-inner > .item > a > img {
            min-height: 350px; /* Set slide height here */
            max-height: 550px;
            width: 100%;
        }
        .align{
            text-align:center;
            list-style:none;
            margin-left:-35px;
            margin-bottom:-35px;
        }




        .setbodyleft{
    float: left;
    width: 50%;
    margin-right: -100%;
    padding-top:25px;
    padding-left: 25px;
    padding-right: 25px;
    padding-bottom:25px;
    box-sizing: border-box;
}

                .setbodyright{
    float: right;
    width: 50%;
    margin-left: -100%;
    padding-right: 25px;
    padding-left: 25px;
    padding-top:25px;
    padding-bottom:25px;
    box-sizing: border-box;
    
}


               




        #description{
            /*background-color:rgba(88,150,255,0.75);*/
            background:white;
            color:#ff6a00;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server" >
    <form id="form1" runat="server">
    <div id="myCarousel" class="carousel slide" data-ride="carousel"style="margin-left:-10px;margin-right:-4px" >
        <!-- Indicators -->
        <ol class="carousel-indicators">
            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
            <li data-target="#myCarousel" data-slide-to="1"></li>
            <li data-target="#myCarousel" data-slide-to="2"></li>
        </ol>

        <!-- Wrapper for slides -->
        <div class="carousel-inner">
            <div class="item active" >
                <img src="content/images/hospital1.jpg" alt="Chania">
                <div class="carousel-caption">
                    <h3>Always Ready</h3>
                    <p>We are always ready for you</p>
                </div>
            </div>

            <div class="item">
                <img src="content/images/hospital-ad-2.jpg" alt="Chicago">
                <div class="carousel-caption">
                    <h3>Equipments</h3>
                    <p>All the cutting-age machinaries are here</p>
                </div>
            </div>

            <div class="item">
                <img src="content/images/hospital-ad-3.jpg" alt="New York">
                <div class="carousel-caption">
                    <h3>Operating</h3>
                    <p>Every operation is important to us</p>
                </div>
            </div>
        </div>

        <!-- Left and right controls -->
        <a class="left carousel-control" href="#myCarousel" data-slide="prev">
            <span class="glyphicon glyphicon-chevron-left"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="right carousel-control" href="#myCarousel" data-slide="next">
            <span class="glyphicon glyphicon-chevron-right"></span>
            <span class="sr-only">Next</span>
        </a>
        
    </div>
    <div style="margin-left:-10px; "" >
       
       <h1 style="padding:15px 0px 15px 0px; margin:0px 0px 0px 0px;   background-color:black; color:white; text-align:center; font-family:'Times New Roman', Times, serif;width:100%">
    Welcome to XYZ Hospital</h1>
        

    </div>
     
   





    <div class="container-fluid" style="text-align:center;margin-left:-35px;margin-right:-30px ">


        <div class="setbodyleft" style="background-color:wheat;background-size:cover " >
                  <h3>Introduction</h3>
                      <p >

                           XYZ Hospital is a not-for-profit subsidiary of XYZ Health and Medical, 
                          Inc. A 106-bed acute care community hospital serving the residents of Greater New Haven and Fairfield Counties,
                          XYZ Hospital has over 300 active and courtesy physicians with admitting privileges.
             
                       </p>
                          <p><a class="btn btn-primary btn-lg">Learn more</a></p>
   
                 </div>

    

     

 
               <div class= "setbodyright" style="background-color:white ">
              <h3>Our Motto</h3>
                     <p>
                             Eiusmod qui labore aute, ut shankle veniam sint frankfurter lorem ball
                             tip dolor.  
                           Non beef ribs consectetur veniam, dolor chicken burgdoggen. Picanha
                             mollit enim pig. Drumstick bacon burgdoggen short loin consectetur
                             ham hock shoulder shank ut doner in.  
                          </p>
                 <p><a class="btn btn-primary btn-lg">Learn more</a></p>
        </div>

</div>
    

    <div class="container-fluid" style="text-align:center;margin-left:-35px;margin-right:-35px;background-color:rebeccapurple">
        <br />
        <br />
        <br />
        <h1 style="color:white;font-family:'Adobe Fangsong Std'">Patient Stories</h1>
        <p><a class="btn btn-default btn-lg" href="ViewPatientInformation.aspx">GO</a></p>
        <br />
        <br />
        <br />
    </div>


<div class="container-fluid" style="text-align:center;margin-left:-35px;margin-right:-30px">

         <div class="setbodyleft" style="background-color: black" >
                    <h1 style="font-family:'Adobe Hebrew';font-size: 100px;color:black"> 
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:HMSConnectionString %>" SelectCommand="sp_aggregate_patient_count" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
        <asp:BulletedList ID="BulletedList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="Column1"   ForeColor="White" CssClass="align"  >
                 </asp:BulletedList>
                      </h1>
               <br />
             <br />
 
                  <p style="font-family:'Times New Roman', Times, serif;font-size:40px;color:white">Patients Served</p>
                       
                 </div>


    <div class="setbodyright" style="background-color:rosybrown " >
              <%--  <h1 style="font-family:'Adobe Hebrew';font-size: 100px;color:white">1000</h1>--%>

                   <h1 style="font-family:'Adobe Hebrew';font-size: 100px;color:black"> 
                       <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:HMSConnectionString %>" SelectCommand="sp_aggregate_physician_count" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                       <asp:BulletedList ID="BulletedList2" runat="server" DataSourceID="SqlDataSource2" DataTextField="Column1"  ForeColor="White" CssClass="align" ></asp:BulletedList>
                      </h1>
               <br />
             <br />
    
              <p style="font-family:'Times New Roman', Times, serif;font-size:40px;color:black" >
                      Qualified Physician</p>
                       
                 </div>
</div>






      <div class="container-fluid" style="text-align:center;margin-left:-35px;margin-right:-35px;background-color:white/*background-image:url(/content/images/ourPhysician.jpg);background-size:cover*/">
        <br />
        <br />
             <br />
        <h1 style="color:black;font-family:'Adobe Caslon Pro'">Our Physician</h1>
        <p><a class="btn btn-default btn-lg" href="SearchPhysician.aspx">GO</a></p>
        <br />
        <br />
             <br />
    </div>




         
   
    </form>




         
   
</asp:Content>
