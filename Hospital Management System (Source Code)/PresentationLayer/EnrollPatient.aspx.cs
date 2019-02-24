using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PresentationLayer {
    public partial class EnrollPatient : System.Web.UI.Page {
        HMSEntities ETObj = new HMSEntities();
        public void MsgBox(String ex, Page pg, Object obj) {
            string s = "<SCRIPT language='javascript'>alert('" + ex.Replace("\r\n", "\\n").Replace("'", "") + "'); </SCRIPT>";
            Type cstype = obj.GetType();
            ClientScriptManager cs = pg.ClientScript;
            cs.RegisterClientScriptBlock(cstype, s, s.ToString());
        }
        public void PatientIDLoad() {
            var result = new System.Data.Objects.ObjectParameter("id", 0);
            ETObj.usp_Get_ID_Value("tblPatientDtls", result);
            long id = Convert.ToInt64(result.Value) + 1;
            txtPatientID.Text = Convert.ToString(id);
        }
        protected void Page_Load(object sender, EventArgs e) {
            if (!IsPostBack) {
                stateLoad();
                InsurencePlanLoad();
                PatientIDLoad();
                string currentDate = DateTime.Now.ToString("dd/MM/yyyy");
                //Assign the value to compare here
                ComparevalidatorDOB.ValueToCompare = currentDate;
            }
        }
        public void AddData() {
            bool nameExists = false;
            nameExists = ETObj.tblPatientDtls.Any(a => a.first_name.Equals(txtFName.Text) && a.last_name.Equals(txtLName.Text));
            if (!nameExists) {
                tblPatientDtl tblPtntDtlsObj = new tblPatientDtl()
                {
                    first_name = txtFName.Text,
                    last_name = txtLName.Text,
                    date_of_birth = Convert.ToDateTime(txtDOB.Text),
                    phone_number = Convert.ToUInt64(txtPhnNum.Text),
                    email_id = txtemail.Text,
                    state = ddlState.SelectedItem.Value,
                    insurance_plan = ddlPlan.SelectedItem.Value
                };
                ETObj.tblPatientDtls.AddObject(tblPtntDtlsObj);
                ETObj.SaveChanges();
                MsgBox("Data insertion successful", this.Page, this);
            }
            else {
                MsgBox("Name already exist", this.Page, this);
            }
            //Response.Redirect("Home.aspx");
        }
        public void stateLoad() {
            var stateID = from State in ETObj.tblStates
                          select new {
                              stateID = State.state_id,
                              stateIDName = State.state_id + " - " + State.name,
                          };
            ddlState.DataSource = stateID.ToList();
            ddlState.DataValueField = "stateID";
            ddlState.DataTextField = "stateIDName";
            ddlState.DataBind();
            ddlState.Items.Insert(0, "Select a State");
        }
        public void InsurencePlanLoad() {
            var planID = from Plan in ETObj.tblPlans
                         select new {
                             planID = Plan.plan_id,
                         };
            ddlPlan.DataSource = planID.ToList();
            ddlPlan.DataValueField = "planID";
            ddlPlan.DataTextField = "planID";
            ddlPlan.DataBind();
            ddlPlan.Items.Insert(0, "Select a Plan");
        }

        protected void btnSubmit_Click(object sender, EventArgs e) {
            //if((txtDOB.Text=="" ) &&& (txtemail.Text == "") &&& (txtFName.Text = "") && (txtLName.Text"") && (ddlPlan.SelectedIndex == -1) && (ddlState.SelectedIndex == -1))
            AddData();
        }

        protected void btnReset_Click(object sender, EventArgs e) {
            txtFName.Text = "";
            txtLName.Text = "";
            txtDOB.Text = "";
            txtemail.Text = "";
            txtPhnNum.Text = "";
            txtPatientID.Text = "";
            PatientIDLoad();
            ddlPlan.SelectedIndex = 0;
            ddlState.SelectedIndex = 0;
        }
    }
}