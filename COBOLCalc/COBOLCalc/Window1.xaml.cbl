       class-id COBOLCalc.Window1 is partial
                 inherits type System.Windows.Window.
       
      *Copyright (c) 2015 Mansib Rahman
      *Permission is hereby granted, free of charge, to any person obtaining a copy of this software 
      *and associated documentation files (the "Software"), to deal in the Software without restriction, 
      *including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, 
      *and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, 
      *subject to the following conditions:
      *
      *The above copyright notice and this permission notice shall be included in all copies or 
      *substantial portions of the Software
      *
      *THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS 
      *OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF 
      *MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. 
      *IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY 
      *CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT 
      *OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE
      *OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
       
       working-storage section. *> section of code that holds class scope variables
           01 ws-lastInput decimal value is 0.
           01 ws-operator string value is "none".
           01 ws-decimalFlag condition-value value is false.
           01 ws-firstDigitFlag condition-value value is true. *>condition-values are essentially booleans
           
       method-id NEW.
       procedure division.
           invoke self::InitializeComponent()
           goback.
       end method.

       method-id btnOne_Click. *>Click event raised from UI
       procedure division using by value sender as object e as type System.Windows.RoutedEventArgs. *> procedure division contains parameters and method logic
           invoke numberPrint("1") *>calls another method
       end method.

       method-id btnTwo_Click.
       procedure division using by value sender as object e as type System.Windows.RoutedEventArgs.
           invoke numberPrint("2")
       end method.

       method-id btnThree_Click.
       procedure division using by value sender as object e as type System.Windows.RoutedEventArgs.
           invoke numberPrint("3")
       end method.

       method-id btnFour_Click.
       procedure division using by value sender as object e as type System.Windows.RoutedEventArgs.
           invoke numberPrint("4")
       end method.

       method-id btnFive_Click.
       procedure division using by value sender as object e as type System.Windows.RoutedEventArgs.
           invoke numberPrint("5")
       end method.

       method-id btnSix_Click.
       procedure division using by value sender as object e as type System.Windows.RoutedEventArgs.
           invoke numberPrint("6")
       end method.

       method-id btnSeven_Click.
       procedure division using by value sender as object e as type System.Windows.RoutedEventArgs.
           invoke numberPrint("7")
       end method.

       method-id btnEight_Click.
       procedure division using by value sender as object e as type System.Windows.RoutedEventArgs.
           invoke numberPrint("8")
       end method.

       method-id btnNine_Click.
       procedure division using by value sender as object e as type System.Windows.RoutedEventArgs.
           invoke numberPrint("9")
       end method.

       method-id btnZero_Click.
       procedure division using by value sender as object e as type System.Windows.RoutedEventArgs.
           invoke numberPrint("0")
       end method.

       method-id btnDecimal_Click.
       local-storage section. *>local method variables must be declared in local-storage section, which always comes before procedure
           01 ls-post string.
       procedure division using by value sender as object e as type System.Windows.RoutedEventArgs.
	       if ws-decimalFlag equals false then
		       set ws-decimalFlag to true
               if OutputBox::Text equals "0" or ws-firstDigitFlag equals true then
			       set OutputBox::Text to "0."
		       else 
			       string OutputBox::Text delimited by size *>string verb allows us to concatenate strings
				       "." delimited by size
				       into ls-post
			       end-string
			       set OutputBox::Text to ls-post
		       end-if
               set ws-firstDigitFlag to false
	       end-if.
       end method.

       method-id btnC_Click.
       procedure division using by value sender as object e as type System.Windows.RoutedEventArgs.
           set ws-lastInput to 0.
           set ws-operator to "none".
           set ws-decimalFlag to false.
           set ws-firstDigitFlag to true.
           set OutputBox::Text to "0"
       end method.

       method-id btnPlus_Click.
       procedure division using by value sender as object e as type System.Windows.RoutedEventArgs.
           invoke operatorAlt("plus")
       end method.

       method-id btnMinus_Click.
       procedure division using by value sender as object e as type System.Windows.RoutedEventArgs.
           invoke operatorAlt("minus")
       end method.

       method-id btnMultiply_Click.
       procedure division using by value sender as object e as type System.Windows.RoutedEventArgs.
           invoke operatorAlt("multiply")
       end method.

       method-id btnDivide_Click.
       procedure division using by value sender as object e as type System.Windows.RoutedEventArgs.
           invoke operatorAlt("divide")
       end method.
       
       method-id operatorAlt.
       local-storage section.
           01 ls-temp pic x(25) value is OutputBox::Text. *>pic aka picture clause allows us to set size in bytes and content type. x refers to alphanumeric
       procedure division using paramB as string.
           set ws-decimalFlag to false
           set ws-firstDigitFlag to true
           set ws-lastInput = function numval(ls-temp) *>numval is an intristic function that allows us to cast a string into a number
           set ws-operator to paramB
       end method.
       
       method-id numberPrint.
       local-storage section.
           01 ls-post string.
       procedure division using paramA as string.
           if ws-firstDigitFlag equals true or OutputBox::Text equals "0" then
                set OutputBox::Text to paramA
                set ws-firstDigitFlag to false
            else
                string OutputBox::Text delimited by size
                    paramA delimited by size
                    into ls-post
                end-string
                set OutputBox::Text to ls-post
            end-if.
       end method.
       
       method-id calculate. 
       procedure division using paramA as decimal.
           if ws-operator equals "plus" then
               set ws-lastInput to ws-lastInput + paramA
           else if ws-operator equals "minus" then
               set ws-lastInput to ws-lastInput - paramA
           else if ws-operator equals "multiply" then
               set ws-lastInput to ws-lastInput * paramA
           else if ws-operator equals "divide" and paramA not equals 0 then
               set ws-lastInput to ws-lastInput / paramA
           else if ws-operator equals "none" then
               set ws-lastInput to paramA
           end-if.
           set ws-operator to "none"
       end method.
       
       method-id btnPlusMinus_Click.
       local-storage section.
           01 ls-temp pic x(25) value is OutputBox::Text.
           01 ls-number decimal value is 0.
       procedure division using by value sender as object e as type System.Windows.RoutedEventArgs.
           set ls-number = function numval(ls-temp)
           set ls-number to ls-number * -1
           set OutputBox::Text to ls-number
       end method.

       method-id btnEqual_Click.
       procedure division using by value sender as object e as type System.Windows.RoutedEventArgs.
           invoke Equate
       end method.
       
       method-id Equate.
       local-storage section.
           01 ls-temp pic x(25) value is OutputBox::Text.
           01 ls-number decimal value is 0.
       procedure division.
           set ls-number = function numval(ls-temp)
           invoke calculate(ls-number)
           set OutputBox::Text to ws-lastInput
           set ws-firstDigitFlag to true
       end method.

       end class.
