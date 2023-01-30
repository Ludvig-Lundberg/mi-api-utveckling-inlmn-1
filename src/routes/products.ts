import express from "express";
import router from ".";
import { index, show, store } from '../controllers/product_controller'


router.get("/", index)