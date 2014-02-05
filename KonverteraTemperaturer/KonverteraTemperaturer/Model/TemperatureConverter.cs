using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace KonverteraTemperaturer.Model
{
    public static class TemperatureConverter
    {
        public static int CelsiusToFahrenheit(int degreesC)
        {
            return Convert.ToInt32((degreesC * 1.8) + 32);
        }
        public static int FahrenheitToCelsius(int degreesF)
        {
            return Convert.ToInt32((degreesF - 32) * (5.0 / 9.0));
        }
    }
}