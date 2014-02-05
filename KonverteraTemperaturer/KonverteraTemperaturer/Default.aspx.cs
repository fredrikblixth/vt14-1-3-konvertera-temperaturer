using KonverteraTemperaturer.Model;
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
                int startTemp;
                int stopTemp;
                int interval;
                int currentTemp;

                var convertFromCelsius = CelsiusToFahrenheitRadioButton.Checked;

                try
                {
                    startTemp = int.Parse(StartTempTextbox.Text);
                    stopTemp = int.Parse(StopTempTextbox.Text);
                    interval = int.Parse(TempIntervalTextbox.Text);
                }
                catch
                {
                    throw new FormatException();
                }

                currentTemp = startTemp;
                var numberOfRows = (stopTemp - startTemp) / interval + 1;

                var headerRow = new TableHeaderRow();
                var celsiusCell = new TableCell();
                var fahrenheitCell = new TableCell();
                var tableRows = new TableRow[numberOfRows];
                celsiusCell.Text = "°C";
                fahrenheitCell.Text = "°F";

                if(convertFromCelsius)
                {
                    headerRow.Cells.Add(celsiusCell);
                    headerRow.Cells.Add(fahrenheitCell);
                }
                else
                {
                    headerRow.Cells.Add(fahrenheitCell);
                    headerRow.Cells.Add(celsiusCell);
                }

                headerRow.TableSection = TableRowSection.TableHeader;
                ResultTable.Rows.Add(headerRow);

                for (int i = 0; i < numberOfRows; i++)
                {
                    var currentRow = new TableRow();
                    var currentCelsiusCell = new TableCell();
                    var currentFahrenheitCell = new TableCell();

                    if(convertFromCelsius)
                    {
                        currentCelsiusCell.Text = string.Format("{0}", currentTemp);
                        currentFahrenheitCell.Text = string.Format("{0}", TemperatureConverter.CelsiusToFahrenheit(currentTemp).ToString());

                        currentRow.Cells.Add(currentCelsiusCell);
                        currentRow.Cells.Add(currentFahrenheitCell);
                    }
                    else
                    {
                        currentFahrenheitCell.Text = string.Format("{0}", currentTemp);
                        currentCelsiusCell.Text = string.Format("{0}", TemperatureConverter.FahrenheitToCelsius(currentTemp).ToString());

                        currentRow.Cells.Add(currentFahrenheitCell);
                        currentRow.Cells.Add(currentCelsiusCell);
                    }
                    tableRows[i] = currentRow;
                    currentTemp += interval;
                    
                }
                ResultTable.Rows.AddRange(tableRows);
                ResultTable.Visible = true;
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