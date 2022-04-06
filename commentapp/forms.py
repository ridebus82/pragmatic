from django.forms import ModelForm

from commentapp.models import Comment


class CommentCreationFrom(ModelForm):
    class Meta:
        model = Comment
        fields = ['content']