import { Request, Response } from "express";
import Debug from "debug";
import { body, validationResult } from "express-validator";
import { create } from "domain";
import prisma from "../prisma";

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
        res.status(500).send({ status: "error", message: "Kunde inte hitta ordren" })
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
    const {customer_first_name, customer_last_name, customer_address, customer_postcode, customer_city, customer_email, customer_phone, order_total, order_items} = req.body

    const newOrderItems: { product_id: number; qty: number; item_price: number; item_total: number; }[] = [];
    const orderItemsFunc = () => {
        order_items.map((item: { product_id: number; qty: number; item_price: number; item_total: number; }) => {
            newOrderItems.push({
                product_id: item.product_id,
                qty: item.qty,
                item_price: item.item_price,
                item_total: item.item_total
            })
        });
    } 
    orderItemsFunc()
    try {
        console.log(order_items)
        const order = await prisma.order.create({
            data: {
                customer_first_name,
                customer_last_name,
                customer_address,
                customer_postcode,
                customer_city,
                customer_email,
                customer_phone,
                order_total,
                order_items: {
                    create: newOrderItems
                }
            },
           
        })
        res.send({
            status: "success",
            data: order
        })
    } catch (err) {
        debug("ERROR when creating order", req.body, err)
        
        res.status(500).send({
            status: "error",
            message: "DATABAS error"
        })
    }
}