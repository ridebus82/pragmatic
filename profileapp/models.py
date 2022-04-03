from django.contrib.auth.models import User
from django.db import models


# Create your models here.

class Profile(models.Model):
    # CASCADE는 DB에서 삭제되는것, 즉, on_delete 될때 모델에서도 같이 삭제된다.
    user = models.OneToOneField(User, on_delete=models.CASCADE, related_name='profile')
    image = models.ImageField(upload_to='profile/', null=True)
    # unique는 DB에서 유일해야 한다는 뜻 아이디가 중복되면 안되느것처럼
    nickname = models.CharField(max_length=20, unique=True, null=True)
    message = models.CharField(max_length=100, null=True)
