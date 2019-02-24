using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data; 
namespace PresentationLayer {
    
    public partial class ViewPatientInformation : System.Web.UI.Page
    {
        HMSEntities viewobjentity = new HMSEntities();
        public void MsgBox(String ex, Page pg, Object obj)
        {
            string s = "<SCRIPT language='javascript'>alert('" + ex.Replace("\r\n", "\\n").Replace("'", "") + "'); </SCRIPT>";
            Type cstype = obj.GetType();
            ClientScriptManager cs = pg.ClientScript;
            cs.RegisterClientScriptBlock(cstype, s, s.ToString());
        }
        protected void Page_Load(object sender, EventArgs e) {
            //GridView1.DataSource = objentity.SpViewPatient().ToList();
        }

        protected void btn_submit_Click(object sender, EventArgs e) {
            int detect;
            if (txtPtntID.Text ==""&&(txtFName.Text == "" || txtLName.Text == ""))
            {
                MsgBox("Please enter patient id or first name and last name", this.Page, this);

            }
            

            else
            {
                
               if (txtPtntID.Text !="") {
                int ptntId = int.Parse(txtPtntID.Text);
                   
                GridViewViewPat.DataSource = viewobjentity.SpViewPatient(ptntId);
                GridViewViewPat.DataBind();
                detect = GridViewViewPat.Rows.Count;
                 }
                else
                {
                    string ptntFName = Convert.ToString(txtFName.Text);
                    string ptntLName = Convert.ToString(txtLName.Text);
                    GridViewViewPat.DataSource = viewobjentity.SpViewPatientonFNameandLName(ptntFName,ptntLName);
                    //for(int i=0;i<GridViewViewPat.Rows.Count;i++)
                    //{
                    //    for(int j=i+1;j<GridViewViewPat.Rows.Count -1;j++)
                    //    {
                    //        string current = GridViewViewPat.Rows[i].Cells[0].Text;
                    //        string next = GridViewViewPat.Rows[j].Cells[0].Text;
                    //        if(current==next)
                    //        {
                    //            GridViewViewPat.Rows[j].Cells.RemoveAt(0);
                    //            GridViewViewPat.Rows[i].Cells[0].RowSpan = j - i + 1;
                    //        }

                    //    }
                    //    if (i == GridViewViewPat.Rows.Count - 2)
                    //        break;                        
                    //}

                    


                      GridViewViewPat.DataBind(); 
                     detect = GridViewViewPat.Rows.Count;

                }
                    
                    

             
               if (detect == 0)
                {
                MsgBox("Patient still not diagnosed", this.Page, this);

                }

                 

            }
            
        }

        protected void btn_reset_Click(object sender, EventArgs e) {
            txtPtntID.Text = "";
            txtFName.Text = "";
            txtLName.Text = "";
            GridViewViewPat.DataSource = null;
            GridViewViewPat.DataBind();

        }

        protected void GridViewViewPat_SelectedIndexChanged(object sender, EventArgs e)
        {
           
        }
    

    }
}