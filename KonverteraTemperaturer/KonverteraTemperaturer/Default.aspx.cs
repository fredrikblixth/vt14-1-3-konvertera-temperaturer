using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KonverteraTemperaturer
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ConvertButton_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                // Do stuff.
            }
        }

        protected void RadioButtonValidation_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (CelsiusToFahrenheitRadioButton.Checked == true || FahrenheitToCelsiusRadioButton.Checked == true)
            {
                args.IsValid = true;
            }
            else
            {
                args.IsValid = false;
            }
        }
    }
}