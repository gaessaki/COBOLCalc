# COBOLCalc
A simple unfeatured calculator written in MicroFocus COBOL for Visual Studio 2015

![alt tag](http://ramenscafe.com/wp-content/uploads/2015/09/CobolCalc.png)

Intended as a primitive demo of COBOL in an WPF app. It accomplishes basic arithmetic. Does not support operation chaining (e.g. 2+2+2+2, but you can operate on results) or order of operations. Feel free to extend and make contributions; the more featured the calculator, the better sample resource developers will be able to refer to.

To run, simply open the .sln file with Visual Studio 2015 (with the Visual COBOL 2015 plugin installed) and press F5 or the green arrow next to 'Start'.

The primary calculator logic is found in "Windows1.xaml.cbl". I hope to get around to implementing an MVVM code pattern, order of operations and advanced functions when I get a chance in the future.

For more context see: http://blogs.msdn.com/b/cdndevs/archive/2015/09/09/visual-studio-2015-now-supports-cobol-and-you-can-make-desktop-and-web-apps-with-it.aspx
