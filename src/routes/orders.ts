import express from "express";
import { body } from "express-validator";
import { index, show, store } from '../controllers/order_controller'
const router = express.Router()


// alla ordrar
router.get('/', index)
// specifik order
router.get("/:orderId", show)
// post:a order
router.post('/', [
    // valideringsregler
    // order
    body("customer_first_name") .isString().withMessage("must be string").bail()
                                .isLength({min: 2}).withMessage("2 characters minimum"),

    body("customer_last_name")  .isString().withMessage("must be string").bail()
                                .isLength({min: 2}).withMessage("2 characters minimum"),

    body("customer_address")     .isString().withMessage("must be string").bail()
                                .isLength({min: 2}).withMessage("name must be 2 or more characters"),

    body("customer_postcode")   .isString().withMessage("must be string").bail()
                                .isPostalCode("SE").isLength({max: 6}).withMessage("must be a swedish postal code with maximum of 6 numbers"),

    body("customer_city")       .isString().withMessage("must be string").bail()
                                .isLength({min: 2}).withMessage("name must be 2 or more characters"),

    body("customer_email")      .isEmail().withMessage("must be email"),
    body("customer_phone")      .optional(),
    body("order_total")         .isInt({min: 1}).withMessage("must be number"),
    

    // order_items
    body("order_items").isArray().bail().withMessage("order_items must be an array").isLength({min:1}).withMessage("must include at least 1 item"),
    body("order_items.*.product_id").isInt({min:1}).withMessage("must be number"),
    body("order_items.*.qty")       .isInt({min:1}).withMessage("must be number"),
    body("order_items.*.item_price").isInt({min:1}).withMessage("must be number"),
    body("order_items.*.item_total").isInt({min:1}).withMessage("must be number"),
], store)


export default router