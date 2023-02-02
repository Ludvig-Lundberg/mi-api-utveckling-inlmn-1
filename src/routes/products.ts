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
    body("name").isString().withMessage("must be string"),
    body("description").isString().withMessage("must be string"),
    body("price").isInt().withMessage("must be a number"),
    body("images").isObject().withMessage("must be JSON object with images"),
    body("stock_status").isString().withMessage("must be string"),
    body("stock_quantity").isInt().withMessage("must be a number")
], store)
//router.post('/products', store)

export default router