import express from "express";
import router from ".";
import { index, show, store } from '../controllers/product_controller'

// alla produkter
router.get("/", index)
// specifik produkt
router.get(":/productID", show)
// post produkt
router.post('/', store)

export default router