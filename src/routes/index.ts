import express from "express"
import prisma from "../prisma"
import resource from './_router'
import products from './products'
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

/* 
 * Produkter
 */

router.use('/products', products)

//router.use("/products", )
/**
 * [EXAMPLE] /resource
 */
// router.use('/resource', resource)

export default router
