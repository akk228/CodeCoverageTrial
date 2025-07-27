using System;

namespace SampleLibrary
{
    public class Calculator
    {
        public double Divide(double number1, double number2)
        {
            if (number2 == 0)
            {
                throw new ArgumentOutOfRangeException("why r u dividing by zero, stupid fuck?");
            }
            
            return number1 / number2;
        }
    }
}