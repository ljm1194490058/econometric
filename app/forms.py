from django import forms
from app.models import *


class DateInput(forms.DateInput):
    input_type = 'date'


class DateTimeInput(forms.DateTimeInput):
    input_type = 'datetime-local'


class datasetForm(forms.ModelForm):
    class Meta:
        model = dataset
        exclude = []
        widgets = {
            'begin': DateTimeInput,
            'end': DateTimeInput
        }

    def __init__(self, *args, **kwargs):
        super(datasetForm, self).__init__(*args, **kwargs)

        for fieldname in self.base_fields:  # 循环给所有字段加样式
            field = self.base_fields[fieldname]
            field.widget.attrs.update({'class': 'col-sm-9 form-control'})


class algorithmForm(forms.ModelForm):
    class Meta:
        model = algorithm
        exclude = []

    def __init__(self, *args, **kwargs):
        super(algorithmForm, self).__init__(*args, **kwargs)

        for fieldname in self.base_fields:  # 循环给所有字段加样式
            field = self.base_fields[fieldname]
            field.widget.attrs.update({'class': 'col-sm-9 form-control'})


class forecastForm(forms.ModelForm):
    class Meta:
        model = forecast
        exclude = []

    def __init__(self, *args, **kwargs):
        super(forecastForm, self).__init__(*args, **kwargs)

        for fieldname in self.base_fields:  # 循环给所有字段加样式
            field = self.base_fields[fieldname]
            field.widget.attrs.update({'class': 'col-sm-9 form-control'})

