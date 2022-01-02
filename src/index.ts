import express from 'express';
import { engine } from 'express-handlebars';

const app = express();

app.engine('handlebars', engine());
app.set('view engine', 'handlebars');
app.set('views', './views');

app.get('/', function (req, res) {
  let pessoas = [
    {nome: "Ana", idade: 37},
    {nome: "Marta", idade: 49},
  ];
  res.render('home', {dados: pessoas});
})

app.listen(8080, function () {
  console.log("Server Listen...");
});