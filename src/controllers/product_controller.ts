

import { Request, Response } from "express";
import Debug from "debug";
import prisma from "../prisma";

const debug = Debug("bortakvall-products:product_controller");

export const index = async (req: Request, res: Response) => {
    try {
        const products = await prisma.products.findMany()

        res.send({
            status: "success",
            data: products,
        })
    } catch (err) {
        debug("Kunde inte hitta producter", err)
        res.status(500).send({ status: "error", message: "Something's wrong" })
    }
}
export const show = 1,
    store = 1;