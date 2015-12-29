from django import forms

from .models import TimeSheetLineCell

class TimeSheetLineCellForm(forms.ModelForm):
    class Meta:
        model = TimeSheetLineCell
        fields = ['hours', 'unit', 'payType', 'hours', 'taskOrder_number']
        widgets = {'unit': forms.TextInput(attrs={'size': 4})
                    , 'payType': forms.TextInput(attrs={'size': 2})
                    , 'hours': forms.TextInput(attrs={'size': 2})
                    , 'date': forms.TextInput(attrs={'size': 7})
                    , 'taskOrder_number': forms.TextInput(attrs={'size': 4})
                   }
        ordering = ['taskOrder_number']


 #   def save(self, commit=True):
 #       tsForm = super(TimeSheetLineCellForm, self).save(commit=False)
  #      tsForm.hours = self.cleaned_data['hours']
  #      tsForm.unit = self.cleaned_data['unit']

   #     if commit:
   #         tsForm.save()
   #     return tsForm

 #   def save(self, *args, **kwargs):
 #       obj = super(TimeSheetLineCellForm, self).save(*args, **kwargs)
 #       obj.myfield = 2
 #       return obj

  #  def __init__(self, *args, **kwargs):
  #          form.empty_permitted = False
