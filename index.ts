import express from 'express'
import usuarioRoutes from './routes/usuarios'
import cors from 'cors'
const app = express()
const port = 3004

app.use(express.json())
app.use(express.urlencoded({ extended: true }))
app.use(cors())

app.use("/usuarios", usuarioRoutes)

app.get('/', (req, res) => {
  res.send('API: Verbalize')
})

app.listen(port, () => {
  console.log(`Servidor rodando na porta: ${port}`)
})