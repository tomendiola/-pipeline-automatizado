from app import app
def test_hello():
 response = app.test_client().get('/')
 assert response.status_code == 200
 assert response.json == {"mensaje": "API desplegada con automatización y CI/CD Por Rico Mendiola"}