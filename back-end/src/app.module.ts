import { Module } from '@nestjs/common';
import * as fs from 'fs';
import {join} from 'path';
import { AuthModule } from './auth/auth.module';
import { TypeOrmModule } from '@nestjs/typeorm';
import { UsersModule } from './users/users.module';
import * as dotevn from 'dotenv';
dotevn.config();

@Module({
  imports: [
    TypeOrmModule.forRoot({
      type: 'mysql',
      host: 'talabatdaraa1-talabatdaraa1.l.aivencloud.com',
      port: 14495,
      username: 'avnadmin',
      password: process.env.DB_PASSWORD,
      database: 'defaultdb',
      ssl: {
        ca: fs.readFileSync(join(__dirname, '..', 'certs', 'ca.pem')),
      },
      synchronize: true,
      autoLoadEntities: true,
      dropSchema:true,
    }),AuthModule, UsersModule,],
})
export class AppModule {}
