import express from "express";
import { body } from "express-validator";
//import router from ".";
import { index, show, store } from '../controllers/product_controller'

const router = express.Router()

// alla produkter
router.get('/', index)
// specifik produkt
router.get("/:productId", show)
// post produkt
router.post('/', [
    body("name").isString().withMessage("must be string").bail().isLength({ min: 3 }),
], store)
//router.post('/products', store)

export default router