import { PrismaClient } from "@prisma/client";
import { Router } from "express";

const prisma = new PrismaClient();
const router = Router();

router.get("/", async (req, res) => {
  try {
    const idiomas = await prisma.idiomas_Usuarios.findMany();
    res.status(200).json(idiomas);
  } catch (error) {
    res.status(400).json(error);
  }
});

router.post("/", async (req, res) => {
  const { idiomaId, usuarioid } = req.body;

  if (!idiomaId || !usuarioid) {
    res.status(400).json({ erro: "Idioma e usuário são obrigatórios" });
  }

  try {
    const idiomaUsuario = await prisma.idiomas_Usuarios.create({
      data: {
        idiomaId: Number(idiomaId),
        usuarioId: usuarioid,
      },
    });
    res.status(201).json(idiomaUsuario);
  } catch (error) {
    res.status(400).json(error);
  }
});

router.get("/:usuarioId", async (req, res) => {
  const { usuarioId } = req.params;

  try {
    const idiomaUsuario = await prisma.idiomas_Usuarios.findMany({
      where: {
        usuarioId: usuarioId,
      },
    });

    if (!idiomaUsuario) {
      res.status(404).json({ erro: "Idioma do usuário não encontrado" });
    }

    res.status(200).json(idiomaUsuario);
  } catch (error) {
    res.status(400).json(error);
  }
});
export default router;
