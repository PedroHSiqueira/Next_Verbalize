import express from 'express'
import usuarioRoutes from './routes/usuarios'
import idiomasRoutes from './routes/idioma'
import idiomasUsuarios from './routes/IdiomaUsuario'
import cors from 'cors'
const app = express()
const port = process.env.PORT || 3004

app.use(express.json())
app.use(express.urlencoded({ extended: true }))
app.use(cors())

app.use("/usuarios", usuarioRoutes)
app.use("/idiomas", idiomasRoutes)
app.use("/idiomasUsuarios", idiomasUsuarios)

app.get('/', (req, res) => {
  res.send('API: Verbalize')
})

app.listen(port, () => {
  console.log(`Servidor rodando na porta: ${port}`)
})