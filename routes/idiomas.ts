import { PrismaClient } from "@prisma/client";
import { Router } from "express";

const prisma = new PrismaClient();
const router = Router();

router.get("/", async (req, res) => {
  try {
    const idiomas = await prisma.idiomas.findMany();
    res.status(200).json(idiomas);
  } catch (error) {
    res.status(400).json(error);
  }
});

router.post("/", async (req, res) => {
  const { nome } = req.body;

  if (!nome) {
    res.status(400).json({ erro: "Nome do idioma é obrigatório" });
  }

  try {
    const idioma = await prisma.idiomas.create({
      data: {
        nome,
      },
    });
    res.status(201).json(idioma);
  } catch (error) {
    res.status(400).json(error);
  }
});

router.put("/:id", async (req, res) => {
  const { id } = req.params;
  const { nome } = req.body;

  try {
    const idioma = await prisma.idiomas.update({
      where: {
        id: Number(id),
      },
      data: {
        nome,
      },
    });
    res.status(200).json(idioma);
  } catch (error) {
    res.status(400).json(error);
  }
});

router.delete("/:id", async (req, res) => {
  const { id } = req.params;

  try {
    await prisma.idiomas.delete({
      where: {
        id: Number(id),
      },
    });
    res.status(200).json({ mensagem: "Idioma excluído com sucesso" });
  } catch (error) {
    res.status(400).json(error);
  }
});
export default router;
