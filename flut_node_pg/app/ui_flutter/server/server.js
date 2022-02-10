const express = require('express')
const app = express()
const mongoose = require('mongoose')


async function connectDB() {
    await mongoose.connect("mongodb+srv://auth1:123321@auth.xf58n.mongodb.net/auth", { useUnifiedTopology: true });
    console.log('· Успешное подключение к MongoDB ·')
}

connectDB()

app.use(express.json({ extended: false }))

app.get("/", (req, res) => res.send('Fck u!'))

app.post("/signup", async(req, res) => {
    const { number, password } = req.body;
    console.log(number)
    console.log(password)
    var schema = new mongoose.Schema({ number: 'string', password: 'string' });
    var User = mongoose.model('User', schema);

    let user = new User({
        number,
        password
    })
    console.log(user);
    await user.save();

})

app.listen(3000, () => console.log('Server has been working on 3000 PORT'))