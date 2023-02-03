import { Request, Response } from "express";
import Debug from "debug";
import prisma from "../prisma";
import { validationResult } from "express-validator";

const debug = Debug("bortakvall-orders:order_controller");

export const index = async (req: Request, res: Response) => {
    try {
        const orders = await prisma.order.findMany()

        res.send({
            status: "success",
            data: orders,
        })
    } catch (err) {
        debug("Kunde inte hitta ordrar", err)
        res.status(500).send({ status: "error", message: "Something's wrong" })
    }
}
export const show = async (req: Request, res: Response) => {
    const orderId = Number(req.params.orderId)
    try {
        const product = await prisma.order.findUniqueOrThrow({
            where: {
                id: orderId,
            },
        })
        res.send({
            status: "success",
            data: product,
        })
    } catch (err) {
        debug(`hittar inte order med id: ${orderId}`, err)
        res.status(500).send({ status: "error", message: "Kunde inte hitta produkten" })
    }
}


export const store = async (req: Request, res: Response) => {
    const validationErrors = validationResult(req)
    if (!validationErrors.isEmpty()) {
        return res.status(400).send({
            status: "fail",
            data: validationErrors.array(),
        })
    }
    try {
        const order = await prisma.order.create({
            data: {
                customer_first_name: req.body.customer_first_name,
                customer_last_name: req.body.customer_last_name,
                customer_adress: req.body.customer_adress,
                customer_postcode: req.body.customer_postcode,
                customer_city: req.body.customer_city,
                customer_email: req.body.customer_email,
                customer_phone: req.body.customer_phone,
                order_total: req.body.order_total
            }
        })
        res.send({
            status: "success",
            data: order,
        })
    } catch (err) {
        debug("ERROR when creating order", req.body, err)

        res.status(500).send({
            status: "error",
            message: "Something's wrong!"
        })
    }
}
/**
 * Update a order
 */
export const update = async (req: Request, res: Response) => {
}

/**
 * Delete a order
 */
export const destroy = async (req: Request, res: Response) => {
}