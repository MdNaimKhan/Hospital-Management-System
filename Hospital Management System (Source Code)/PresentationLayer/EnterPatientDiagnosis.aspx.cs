using System;
using System.Collections.Generic;
using System.Data.Objects;
using System.Data.Objects.SqlClient;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PresentationLayer {
    public partial class EnterPatientDiagnosis : System.Web.UI.Page {
        public void MsgBox(String ex, Page pg, Object obj) {
            string s = "<SCRIPT language='javascript'>alert('" + ex.Replace("\r\n", "\\n").Replace("'", "") + "'); </SCRIPT>";
            Type cstype = obj.GetType();
            ClientScriptManager cs = pg.ClientScript;
            cs.RegisterClientScriptBlock(cstype, s, s.ToString());
        }
        protected void Page_Load(object sender, EventArgs e) {

            //rblPhysician.DataSource=tb
            if (!IsPostBack) {
                string CurrntDate = DateTime.Now.ToString("dd/MM/yyyy");
                CompareValidatorDateOfDiagnosis.ValueToCompare = CurrntDate;
                //string followUpdateCurrntDate = DateTime.Now.ToString("dd/MM/yyyy");
                CompareValidatorFollowUpDate.ValueToCompare = CurrntDate;
                physicianLoad();
                patientIdLoad();
            }

        }



        protected void cbFollowUpRequired_CheckedChanged(object sender, EventArgs e) {
            if (cbFollowUpRequired.Checked) {

                tbFollowUpDate.Enabled = true;
                imgFollowUpDate.Enabled = true;

            }
            else {
                tbFollowUpDate.Text = "";
                tbFollowUpDate.Enabled = false;
                imgFollowUpDate.Enabled = false;
            }
        }
        public void patientIdLoad() {
            HMSEntities objectEntities = new HMSEntities();
            var patient = from Patient in objectEntities.tblPatientDtls
                          select new {
                              patientID = SqlFunctions.StringConvert((decimal)Patient.patient_id).Trim(),
                              patientIDName = SqlFunctions.StringConvert((decimal)Patient.patient_id).Trim() + " - " + Patient.first_name + " " + Patient.last_name,
                          };
            ddlPatientId.DataSource = patient.ToList();
            ddlPatientId.DataValueField = "patientID";
            ddlPatientId.DataTextField = "patientIDName";
            ddlPatientId.DataBind();
        }

        public void physicianLoad() {


            HMSEntities objectEntities = new HMSEntities();
            var physician = from Physician in objectEntities.tblPhysicians
                            select new {
                                physicianID = SqlFunctions.StringConvert((decimal)Physician.physician_id).Trim(),
                                physicianIDName = SqlFunctions.StringConvert((decimal)Physician.physician_id).Trim() + " - " + Physician.first_name + " " + Physician.last_name,
                            };
            ddlPhysician.DataSource = physician.ToList();
            ddlPhysician.DataValueField = "physicianID";
            ddlPhysician.DataTextField = "physicianIDName";
            ddlPhysician.DataBind();
            ddlPhysician.Items.Insert(0, "Select a Physician");
        }

        public long billingID() {
            HMSEntities objectEntities = new HMSEntities();
            var billID = from Bill in objectEntities.tblBIllings
                         select new {
                             bill_ID = Bill.bill_id,
                         };
            long ID = Convert.ToInt64(billID.Last());
            return ID;
        }
        protected void btnSubmit_Click(object sender, EventArgs e) {
            // Inserting Billing Informations:::::::>


            HMSEntities objectEntities = new HMSEntities();



            //Bill Amount

            tblBIlling patientBillingInfo = new tblBIlling()
            {
                bill_amount = Convert.ToDecimal(tbBillAmount.Text),
                mode_of_payment = rblModeOfPayment.SelectedItem.Value
            };

            if (tbCardNumber.Enabled == true) {
                patientBillingInfo.card_number = tbCardNumber.Text;
            }
            objectEntities.AddTotblBIllings(patientBillingInfo);
            objectEntities.SaveChanges();
            var id = patientBillingInfo.bill_id;

            //patientBillingInfo.bill_amount = Convert.ToDecimal(tbBillAmount.Text);

            //Mode Of Payment(Cash/Card)
            //patientBillingInfo.mode_of_payment = rblModeOfPayment.SelectedItem.Text;


            //Card Number
            //patientBillingInfo.card_number = tbCardNumber.Text;

            //objectEntities.AddTotblBIllings(patientBillingInfo);
            //objectEntities.SaveChanges();
            //using (HMSEntities objHMS =new HMSEntities()) {
            //    ObjectParameter billingID = new ObjectParameter("billID", typeof(decimal));
            //        objHMS.usp_InsertBillInfo(Convert.ToInt64(tbBillAmount.Text),rblModeOfPayment.SelectedItem.Value,tbCardNumber.Text);
            //}
            //var billAmnt = new SqlParameter
            //{
            //    ParameterName = "bill_amount",
            //    Value = Convert.ToDecimal(tbBillAmount.Text)
            //};
            //var billMethod = new SqlParameter
            //{
            //    ParameterName = "mode_of_cash",
            //    Value = rblModeOfPayment.SelectedItem.Value
            //};
            //var cardNumber = new SqlParameter
            //{
            //    ParameterName = "card_number",
            //    Value = tbCardNumber
            //};


            // Inserting Patient-Diagnosis Informations:::::::>


            tblPatientDiagnosi patientDiognosisInfo = new tblPatientDiagnosi();


            patientDiognosisInfo.bill = Convert.ToInt64(id);

            patientDiognosisInfo.patient_id = Convert.ToInt64(ddlPatientId.SelectedItem.Value);

            patientDiognosisInfo.symptoms = tbsymptoms.Text;//Symptoms

            patientDiognosisInfo.diagnosis_provided = tbdiagnosisprovided.Text;//Diagnosis Details

            //Select Physician Controll Still Not FINISHED
            patientDiognosisInfo.administered_by = ddlPhysician.SelectedItem.Value;


            patientDiognosisInfo.date_of_diagnosis = Convert.ToDateTime(tbDateOfDiagnosis.Text);


            //Follow Up Date Required or Not
            if (cbFollowUpRequired.Checked) {

                patientDiognosisInfo.follow_up_required = "Y";//Yes   
                RequiredFieldValidatorFollowUpDate.Enabled = true;
                patientDiognosisInfo.date_of_followup = Convert.ToDateTime(tbFollowUpDate.Text);
            }
            else {
                patientDiognosisInfo.follow_up_required = "N";
            }





            //Server Side Validation
            if (Page.IsValid) {

                objectEntities.AddTotblPatientDiagnosis(patientDiognosisInfo);
                objectEntities.SaveChanges();
                lblServerSideValidationMassange.ForeColor = System.Drawing.Color.Green;
                  MsgBox("Data Saved Sucessfully",this.Page,this);
            }
            else {
                lblServerSideValidationMassange.ForeColor = System.Drawing.Color.Red;
                lblServerSideValidationMassange.Text = "Validation Failed, Data Not Saved";
            }


            ddlPatientId.SelectedIndex = 0;
            tbsymptoms.Text = "";
            tbdiagnosisprovided.Text = "";
            ddlPhysician.SelectedIndex = 0;
            tbDateOfDiagnosis.Text = "";
            cbFollowUpRequired.Checked = false;
             tbFollowUpDate.Text = "";
            tbBillAmount.Text = "";
            rblModeOfPayment.SelectedValue = null;
             tbCardNumber.Text = "";

        }



        protected void rblPhysician_SelectedIndexChanged(object sender, EventArgs e) {

        }

        protected void btnError_Click(object sender, EventArgs e) {
            // lblError.Text = //Checking Error With this Label Value
        }

        protected void rblModeOfPayment_SelectedIndexChanged(object sender, EventArgs e) {
            if (rblModeOfPayment.Text == "Card") {
                tbCardNumber.Enabled = true;
                RequiredFieldValidatorCardNumber.Enabled = true;
            }
            else//cash
            {
                tbCardNumber.Text = "";
                tbCardNumber.Enabled = false;
                RequiredFieldValidatorCardNumber.Enabled = false;
            }
        }
    }
}