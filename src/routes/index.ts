import express from "express"
import prisma from "../prisma"
import resource from './_router'
import products from './products'
import orders from "./orders"
import { body } from 'express-validator'

// instantiate a new router
export const router = express.Router()

router.get('/', (req, res) => {
	res.send({
		message: "Välkommen till Bortakväll! | /products för produkter | /orders för orders |",
	})
})

router.use('/products', products)
router.use('/orders', orders)

export default router
