import express from "express"
import prisma from "../prisma"
import resource from './_router'

// instantiate a new router
const router = express.Router()

/**
 * GET /
 */
router.get('/', (req, res) => {
	res.send({
		message: "I AM API, BEEP BOOP",
	})
})

//router.use("/products", )
/**
 * [EXAMPLE] /resource
 */
// router.use('/resource', resource)

export default router
