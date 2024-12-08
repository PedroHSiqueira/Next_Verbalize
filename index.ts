import express from 'express'
import usuarioRoutes from './routes/usuarios'
import idiomasRoutes from './routes/idioma'
import idiomasUsuarios from './routes/IdiomaUsuario'
import cors from 'cors'
const app = express()
const port = process.env.PORT || 3004

import Pusher from "pusher"
const pusher = new Pusher({
  appId: process.env.NEXT_PUBLIC_PUSHER_APP_ID!,
  key: process.env.NEXT_PUBLIC_PUSHER_PUBLISHABLE_KEY!,
  secret: process.env.PUSHER_SECRET_KEY!,
  cluster: process.env.NEXT_PUBLIC_PUSHER_CLUSTER!,
  useTLS: true,
});

app.use(express.json())
app.use(express.urlencoded({ extended: true }))
app.use(cors())

app.use("/usuarios", usuarioRoutes)
app.use("/idiomas", idiomasRoutes)
app.use("/idiomasUsuarios", idiomasUsuarios)

app.get('/', (req, res) => {
  res.send('API: Verbalize')
})

app.post("/pusher/auth", (req, res) => {
  const socketId = req.body.socket_id;
  const channel = req.body.channel_name;
  // This authenticates every user. Don't do this in production!
  const authResponse = pusher.authorizeChannel(socketId, channel);
  res.send(authResponse);
});

app.listen(port, () => {
  console.log(`Servidor rodando na porta: ${port}`)
})