import { Request, Response } from "express";
import Debug from "debug";
import prisma from "../prisma";
import { body, validationResult } from "express-validator";
import { create } from "domain";

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
    try {
         const order = await prisma.order.create({
             data: {
                 customer_first_name: req.body.customer_first_name,
                 customer_last_name:  req.body.customer_last_name,
                 customer_address:    req.body.customer_address,
                 customer_postcode:   req.body.customer_postcode,
                 customer_city:       req.body.customer_city,
                 customer_email:      req.body.customer_email,
                 customer_phone:      req.body.customer_phone,
                 order_total:         req.body.order_total,
             }
        })

        const reqData: any = req.body.order_items;
        let newData = [];
        for (let i = 0; i < reqData.length; i++) {
            newData.push({
                product_id: reqData[i].product_id,
                qty: reqData[i].qty,
                item_price: reqData[i].item_price,
                item_total: reqData[i].item_total
              })
        }
        console.log(newData)
        console.log(JSON.stringify(newData))
        const order_items = await prisma.orderitems.createMany({
            data: [
            {
                "product_id": 3,
                "qty": 1,
                "item_price": 200,
                "item_total": 200
            },
            {
                "product_id": 2,
                "qty": 5,
                "item_price": 200,
                "item_total": 1000
            },
            {
                "product_id": 1,
                "qty": 1,
                "item_price": 200,
                "item_total": 200
            }
        ]
        })
        res.send({
            status: "success",
            data: order, order_items
        })
    } catch (err) {
        debug("ERROR when creating order", req.body, err)
        
        res.status(500).send({
            status: "error",
            message: "Somethings wrong"
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