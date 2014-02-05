<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="KonverteraTemperaturer.Default" ViewStateMode="Disabled"%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Konvertera Temperaturer</title>
</head>
<body>
    <form id="convertTempForm" runat="server">
        <div>
            <%-- Labels and input fields --%>
            <div>
                <asp:Label ID="StartTempLabel" runat="server" Text="Starttemperatur:"></asp:Label>
                <asp:TextBox ID="StartTempTextbox" runat="server"></asp:TextBox>

                <%-- Validation --%>
                <asp:RequiredFieldValidator ID="StartTempRequiredFieldValidator" runat="server" 
                    ErrorMessage="Starttemperatur är obligatoriskt" 
                    ControlToValidate="StartTempTextbox" 
                    Display="None"></asp:RequiredFieldValidator>

                <asp:CompareValidator ID="StartTempDataTypeValidator" runat="server" 
                    ErrorMessage="Starttemperatur måste vara ett heltal" 
                    ControlToValidate="StartTempTextbox" 
                    Type="Integer" 
                    Operator="DataTypeCheck" 
                    Display="None"></asp:CompareValidator>
            </div>
            <div>
                <asp:Label ID="StopTempLabel" runat="server" Text="Sluttemperatur:"></asp:Label>
                <asp:TextBox ID="StopTempTextbox" runat="server"></asp:TextBox>

                <%-- Validation --%>
                <asp:RequiredFieldValidator ID="StopTempRequriedFieldValidator" runat="server" 
                    ErrorMessage="Sluttemperatur är obligatoriskt"
                    ControlToValidate="StopTempTextbox" 
                    Display="None"></asp:RequiredFieldValidator>

                <asp:CompareValidator ID="StopTempValueValidator" runat="server" 
                    ErrorMessage="Sluttemperatur måste vara ett heltal större än Starttemperatur" 
                    ControlToValidate="StopTempTextbox" 
                    ControlToCompare="StartTempTextbox" 
                    Type="Integer" Operator="GreaterThan" 
                    Display="None"></asp:CompareValidator>
            </div>
            <div>
                <asp:Label ID="TempIntervalLabel" runat="server" Text="Temperaturintervall:"></asp:Label>
                <asp:TextBox ID="TempIntervalTextbox" runat="server"></asp:TextBox>

                <%-- Validation --%>
                <asp:RequiredFieldValidator ID="TempIntevalTextboxValidator" runat="server" 
                    ErrorMessage="Temperaturintervall är obligatoriskt"
                    ControlToValidate="TempIntervalTextbox" 
                    Display="None"></asp:RequiredFieldValidator>

                <asp:CompareValidator ID="TempIntervalMinimumValidator" runat="server" 
                    ErrorMessage="Temperaturintervall måste vara ett heltal större än 1" 
                    ControlToValidate="TempIntervalTextbox"
                    Type="Integer" Operator="GreaterThanEqual" ValueToCompare="1" 
                    Display="None"></asp:CompareValidator>

                <asp:CompareValidator ID="CompareValidator1" runat="server" 
                    ErrorMessage="Temperaturintervall måste vara ett heltal mindre än 100" 
                    ControlToValidate="TempIntervalTextbox"
                    Type="Integer" Operator="LessThanEqual" ValueToCompare="100" 
                    Display="None"></asp:CompareValidator>
            </div>
            <div>
                <asp:Label ID="ConversionTypeLabel" runat="server" Text="Typ av konvertering"></asp:Label>
                <asp:RadioButton ID="CelsiusToFahrenheitRadioButton" runat="server" Text="Celsius till Fahrenheit" GroupName="ConversionType" />
                <asp:RadioButton ID="FahrenheitToCelsiusRadioButton" runat="server" Text="Fahrenheit till Celsius" GroupName="ConversionType" />

                <%-- Validation --%>
                <asp:CustomValidator ID="RadioButtonValidation" runat="server" ErrorMessage="Typ av konvertering måste väljas" Display="None" OnServerValidate="RadioButtonValidation_ServerValidate" ClientValidationFunction="validateRadioButtons"></asp:CustomValidator>
                <script type="text/javascript">
                    function validateRadioButtons(oSrc, args) {
                        args.IsValid = (document.querySelector("#CelsiusToFahrenheitRadioButton").checked === true || document.querySelector("#FahrenheitToCelsiusRadioButton").checked === true) ? true : false;
                    }
                </script>
            </div>
            <div>
                <%-- Validationsummary --%>
                <asp:ValidationSummary ID="ValidationSummary" runat="server" />
            </div>
            <%-- Submitbutton --%>
            <div>
                <asp:Button ID="ConvertButton" runat="server" Text="Button" OnClick="ConvertButton_Click" />
            </div>
            <div>
                <asp:Table ID="ResultTable" runat="server" Visible="False"></asp:Table>
            </div>
        </div>
    </form>
</body>
</html>
