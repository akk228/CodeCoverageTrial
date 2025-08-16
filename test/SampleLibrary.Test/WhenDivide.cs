﻿using System;
using Xunit;

namespace SampleLibrary.Test
{
    public class WhenDivide
    {
        [Fact]
        public void ResultIsCorrect()
        {
            var calculator = new Calculator();
            var result = calculator.Divide(2, 4);
            Assert.Equal((double)0.5, result);
        }

        [Fact]
        public void DivisionByZeroThrowsException()
        {
            var calculator = new Calculator();
            Assert.Throws<DivideByZeroException>(() => calculator.Divide(2, 0));
        }
    }
}