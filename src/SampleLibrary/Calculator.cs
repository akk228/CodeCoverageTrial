using System;

namespace SampleLibrary
{
    public class Calculator
    {
        public double Divide(double number1, double number2)
        {
            if (number2 == 0)
            {
                throw new ArgumentOutOfRangeException("Division by zero is not allowed.");
            }

            var result = number1 / number2;
            
            return result;
        }

        public double Add(double number1, double number2)
        {
            return number1 + number2;
        }
    }
}