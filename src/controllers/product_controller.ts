

import { Request, Response } from "express";
import Debug from "debug";
import prisma from "../prisma";

const debug = Debug("bortakvall-products:product_controller");

export const index = async (req: Request, res: Response) => {
    try {
        const products = await prisma.product.findMany()

        res.send({
            status: "success",
            data: products,
        })
    } catch (err) {
        debug("Kunde inte hitta producter", err)
        res.status(500).send({ status: "error", message: "Something's wrong" })
    }
}
export const show = async (req: Request, res: Response) => {
    const productId = Number(req.params.productId)
    try {
        const product = await prisma.product.findUniqueOrThrow({
            where: {
                id: productId,
            },
        })
    } catch (err) {
        debug(`hittar inte produkt med id: ${productId}`, err)
        res.status(500).send({ status: "error", message: "Kunde inte hitta produkten" })
    }
}


export const store = async (req: Request, res: Response) => {
    try {
        const produkt = await prisma.product.create({
            data: {
                id: req.body.id,
                name: req.body.name,
                description: req.body.description,
                price: req.body.price,
                images: req.body.images,
                stock_status: req.body.stock_status,
                stock_quantity: req.body.stock_quantity
            }
        })

        res.send({
            status: "success",
            data: produkt,
        })
    } catch (err) {
        debug("ERROR when creating produkt", req.body, err)

        res.status(500).send({
            status: "error",
            message: "Something's wrong!"
        })
    }
}