import {PrismaClient} from '../generated/prisma/client';
import * as dotenv from 'dotenv';

dotenv.config();

async function main(){
    const prisma = new PrismaClient();
    //  await prisma.$queryRaw`DROP TABLE IF EXISTS users;`
    const result = await prisma.$queryRaw`SELECT * FROM users;`
    console.log(result);
}

main();