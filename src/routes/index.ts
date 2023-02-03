import express from "express"
import prisma from "../prisma"
import resource from './_router'
import products from './products'
import orders from "./orders"
import { body } from 'express-validator'

// instantiate a new router
export const router = express.Router()

/**
 * GET /
 */
router.get('/', (req, res) => {
	res.send({
		message: "I AM API, BEEP BOOP",
	})
})

router.use('/products', products)
router.use('/orders', orders)
/**
 * [EXAMPLE] /resource
 */
// router.use('/resource', resource)

export default router
