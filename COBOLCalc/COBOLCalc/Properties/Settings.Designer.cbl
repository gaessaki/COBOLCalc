      *> Namespace: COBOLCalc.Properties

       class-id COBOLCalc.Properties.Settings is partial is final 
                 inherits type System.Configuration.ApplicationSettingsBase
                 attribute System.Runtime.CompilerServices.CompilerGenerated()
                 attribute System.CodeDom.Compiler.GeneratedCode("Microsoft.VisualStudio.Editors.SettingsDesigner.SettingsSingleFileGenerator", "8.0.0.0")
                 .

       working-storage section.
       01 defaultInstance type COBOLCalc.Properties.Settings static.

       method-id get property Default static final.
       procedure division returning return-item as type COBOLCalc.Properties.Settings.
       set return-item to defaultInstance
       goback
       end method.

       end class.
