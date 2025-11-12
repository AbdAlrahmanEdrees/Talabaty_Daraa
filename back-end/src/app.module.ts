import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { ConfigModule, ConfigService } from '@nestjs/config';
import * as fs from 'fs';
import { join } from 'path';

import { AuthModule } from './auth/auth.module';
import { UsersModule } from './users/users.module';
import { EmailModule } from './email/email.module';

@Module({
  imports: [
    // Load environment variables from .env
    ConfigModule.forRoot({
      isGlobal: true,
    }),

    // Database connection
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
        dropSchema: true, // Set to true only for testing; otherwise you lose data on restart
      
    }),

    AuthModule,
    UsersModule,
    EmailModule,
  ],
})
export class AppModule {}
