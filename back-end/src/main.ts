import { NestFactory } from "@nestjs/core";
import { AppModule } from "./app.module";
import { ValidationPipe } from "@nestjs/common";
import { DocumentBuilder, SwaggerModule } from "@nestjs/swagger";
import * as fs from 'fs';
import * as dotenv from 'dotenv';

dotenv.config();
//Now process.env is available everywhere (Services, Controllers, Modules)


async function bootstrap(){
  const app = await NestFactory.create(AppModule);

  app.useGlobalPipes(new ValidationPipe({
    whitelist:true, 
    forbidNonWhitelisted:true, 
    transform:true
  }));

  const config = new DocumentBuilder()
    .setTitle("Talabaty Backend Documentation")
    .setDescription("Endpoints' description")
    .addBearerAuth()
    .build()

  const document = SwaggerModule.createDocument(app,config);
  SwaggerModule.setup('api/docs',app,document);

  fs.writeFileSync('swagger-spec.json',JSON.stringify(document));

  app.listen(process.env.PORT || 3000);
}

bootstrap();