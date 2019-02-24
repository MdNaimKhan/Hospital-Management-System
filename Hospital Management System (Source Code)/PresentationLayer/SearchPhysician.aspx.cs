using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PresentationLayer
{
    public partial class SearchPhysician : System.Web.UI.Page
    {
        HMSEntities phyobjHMSEnt = new HMSEntities();
        public void MsgBox(String ex, Page pg, Object obj) {
            string s = "<SCRIPT language='javascript'>alert('" + ex.Replace("\r\n", "\\n").Replace("'", "") + "'); </SCRIPT>";
            Type cstype = obj.GetType();
            ClientScriptManager cs = pg.ClientScript;
            cs.RegisterClientScriptBlock(cstype, s, s.ToString());
        }
        protected void Page_Load(object sender, EventArgs e) {

            if (!IsPostBack) {
                stateLoad();
                PlanLoad();
                DepartmentLoad();
            }

        }

        public void stateLoad()
        {
            var stateID = from State in  phyobjHMSEnt.tblStates
                          select new
                          {
                              stateID = State.state_id,
                              stateIDName = State.state_id + " - " + State.name,
                          };
            ddlState.DataSource = stateID.ToList();
            ddlState.DataValueField = "stateID";
            ddlState.DataTextField = "stateIDName";
            ddlState.DataBind();
            ddlState.Items.Insert(0, "Select a State");
        }
        public void PlanLoad() {
            var planID = from Plan in phyobjHMSEnt.tblPlans
                         select new {
                             planID = Plan.plan_id,
                         };
            ddlPlan.DataSource = planID.ToList();
            ddlPlan.DataValueField = "planID";
            ddlPlan.DataTextField = "planID";
            ddlPlan.DataBind();
            ddlPlan.Items.Insert(0, "Select a Plan");
        }

        public void DepartmentLoad() {
            var departmentID = from Department in phyobjHMSEnt.tblDepartments
                               select new {
                                   departmentID = Department.department_id,
                                   departmentIDName=Department.department_id+" - "+Department.department_name
                               };
            ddlDept.DataSource = departmentID.ToList();
            ddlDept.DataValueField = "departmentID";
            ddlDept.DataTextField = "departmentIDName";
            ddlDept.DataBind();
            ddlDept.Items.Insert(0, "Select a Department");
        }
        protected void AddPhysicianData()
        {
            int count;
                GridViewPhysician.DataSource = phyobjHMSEnt.SpPhysicianSearch(ddlState.SelectedItem.Value, ddlPlan.SelectedItem.Value, ddlDept.SelectedItem.Value);
                GridViewPhysician.DataBind();
                count = GridViewPhysician.Rows.Count;
                if (count == 0)
                {
                    MsgBox("No Record Found", this.Page, this);

                }

        }
        protected void BtnSearch_Click(object sender, EventArgs e) {
            //if (ddlDept.SelectedIndex == 0 || ddlPlan.SelectedIndex == 0 || ddlState.SelectedIndex == 0)
            //{
            //    MsgBox("Please Select The Fields", this.Page, this);
            //}
            //else
            //{
            AddPhysicianData();
            //}
        }

        protected void BtnReset_Click(object sender, EventArgs e) {
            ddlState.SelectedIndex = 0;
            ddlPlan.SelectedIndex = 0;
            ddlDept.SelectedIndex = 0;
            GridViewPhysician.DataSource = null;
            GridViewPhysician.DataBind();

        }
    }
}