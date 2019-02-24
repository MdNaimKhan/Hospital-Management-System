using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PresentationLayer
{
    public partial class AddPhysician : System.Web.UI.Page
    {
        HMSEntities objHMSEnt = new HMSEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) {
                stateLoad();
                InsurencePlanLoad();
                DepartmentLoad();
            }
        }
        public void MsgBox(String ex, Page pg, Object obj)
        {
            string s = "<SCRIPT language='javascript'>alert('" + ex.Replace("\r\n", "\\n").Replace("'", "") + "'); </SCRIPT>";
            Type cstype = obj.GetType();
            ClientScriptManager cs = pg.ClientScript;
            cs.RegisterClientScriptBlock(cstype, s, s.ToString());
        }
        public void AddData()
        {
            bool nameExists = false;
            nameExists = objHMSEnt.tblPhysicians.Any(a => a.first_name.Equals(txtFristN.Text) && a.last_name.Equals(txtLastN.Text));
            if (!nameExists) {
                tblPhysician tblPhsicianDtlsObj = new tblPhysician();
                tblPhsicianDtlsObj.first_name = txtFristN.Text;
                tblPhsicianDtlsObj.last_name = txtLastN.Text;
                tblPhsicianDtlsObj.department_id = DropDownLDepartment.SelectedItem.Value;
                tblPhsicianDtlsObj.educational_qualification = TextBoxEduQ.Text;
                tblPhsicianDtlsObj.years_of_experience = Convert.ToInt32(TextBoxExp.Text);
                tblPhsicianDtlsObj.state = DropDownLState.SelectedItem.Value;
                tblPhsicianDtlsObj.plan_id = DropDownLPlns.SelectedItem.Value;
                objHMSEnt.AddTotblPhysicians(tblPhsicianDtlsObj);
                objHMSEnt.SaveChanges();
                MsgBox("Data insertion successful", this.Page, this);

            }
            else {
                MsgBox("Name already Exists", this.Page, this);
            }
            //Response.Redirect("Home.aspx");
        }
        protected void btnRegister_Click(object sender, EventArgs e)
        {
            AddData();
        }
        public void stateLoad()
        {
            var stateID = from State in objHMSEnt.tblStates
                          select new {
                              stateID = State.state_id,
                              stateIDName= State.state_id+" - "+State.name
                          };
            DropDownLState.DataSource = stateID.ToList();
            DropDownLState.DataValueField = "stateID";
            DropDownLState.DataTextField = "stateIDName";
            DropDownLState.DataBind();
            DropDownLState.Items.Insert(0, "Select a State");
        }
        public void InsurencePlanLoad()
        {
            var planID = from Plan in objHMSEnt.tblPlans
                         select new {
                             planID = Plan.plan_id,
                         };
            DropDownLPlns.DataSource = planID.ToList();
            DropDownLPlns.DataValueField = "planID";
            DropDownLPlns.DataTextField = "planID";
            DropDownLPlns.DataBind();
            DropDownLPlns.Items.Insert(0, "Select a Plan");
        }
        public void DepartmentLoad()
        {
            var departmentID = from Department in objHMSEnt.tblDepartments
                         select new {
                             departmentID = Department.department_id,
                             departmentIDName=Department.department_id +" - "+Department.department_name
                         };
            DropDownLDepartment.DataSource = departmentID.ToList();
            DropDownLDepartment.DataValueField = "departmentID";
            DropDownLDepartment.DataTextField = "departmentIDName";
            DropDownLDepartment.DataBind();
            DropDownLDepartment.Items.Insert(0, "Select a Department");
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            txtFristN.Text = "";
            txtLastN.Text = "";
            DropDownLDepartment.SelectedIndex = 0;
            TextBoxEduQ.Text = "";
            TextBoxExp.Text = "";
            DropDownLPlns.SelectedIndex = 0;
            DropDownLState.SelectedIndex = 0;
        }
    }
}