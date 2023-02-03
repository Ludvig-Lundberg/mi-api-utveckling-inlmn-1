import express from "express";
import { body } from "express-validator";
import { index, show, store } from '../controllers/order_controller'
//import router from "."; // ändrade till const router nedan för att det inte fungerade när jag gjorde såhär
const router = express.Router()

// alla ordrar
router.get('/', index)
// specifik order
router.get("/:orderId", show)
// post:a order
router.post('/', [
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
    body("order_total")         .isInt({min: 1, gt: 1}).withMessage("must be number")
], store)


export default router