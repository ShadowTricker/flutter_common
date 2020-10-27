import { Application, Router } from "https://deno.land/x/oak/mod.ts";
const { readFile } = Deno;

const options = { hostname: '10.237.188.41', port: 3400 };


const app = new Application();
const router = new Router();

router
  .get('/articles', async (ctx) => {
    const decoder = new TextDecoder('utf-8');
    const data = await Deno.readFile('./assets/data/articles.json');
    ctx.response.body = {
      articles: decoder.decode(data)
    };
  })
  .get('/articles/:id', async (ctx) => {
    const { id } = ctx.params;
    const decoder = new TextDecoder('utf-8');
    const dataArray = await Deno.readFile('./assets/data/articles.json');
    const data = JSON.parse(decoder.decode(dataArray));
    const article = data.find((item: any) => item.id === id);
    ctx.response.body = {
      articles: article
    };
  });

app.use(router.routes());
app.use(router.allowedMethods());
console.log(`Server running at http://${ options.hostname }:${ options.port }`);
await app.listen(options);


