import express from "express";
import { body } from "express-validator";
import { index, show, store } from '../controllers/product_controller'
//import router from "."; // ändrade till const router nedan för att det inte fungerade när jag gjorde såhär
const router = express.Router()

// alla produkter
router.get('/', index)
// specifik produkt
router.get("/:productId", show)
// post:a produkt
router.post('/', [
    body("name")             .isString().withMessage("must be string").bail().isLength({min:1}).withMessage("name must be minimum 1 character long"),
    body("description")      .isString().withMessage("must be string"),
    body("price")            .isInt({min: 1}).withMessage("must be a number, minimum: 1"),
    body("images")           .isObject().withMessage("must be JSON object with images"),
    body("images.thumbnail") .isString().withMessage("must be string"),
    body("images.large")     .isString().withMessage("must be string"),
    body("stock_status")     .isString().withMessage("must be string"),
    body("stock_quantity")   .isInt()   .withMessage("must be a number")
], store)


export default router