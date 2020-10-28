import { Application, Router } from "https://deno.land/x/oak/mod.ts";
const { readFile, writeFile } = Deno;

const options = { hostname: '10.237.188.44', port: 3400 };


const app = new Application();
const router = new Router();

router
  .get('/articles', async (ctx) => {
    const articles = await readFileTransformer('./assets/data/articles.json');
    ctx.response.body = {
      status: 'SUCCESS',
      articles
    };
  })
  .post('/articles', async (ctx) => {
    const articles = await readFileTransformer('./assets/data/articles.json');
    const id = articles.length + 1;
    const newValue = await ctx.request.body({
      type: 'json'
    }).value;
    articles.push({
      id,
      ...newValue
    });
    await writeFileTransformer('./assets/data/articles.json', articles);
    ctx.response.body = {
      status: 'SUCCESS',
    };
  })
  .get('/articles/:id', async (ctx) => {
    const { id } = ctx.params;
    const articles = await readFileTransformer('./assets/data/articles.json');
    const article = articles.find((item: any) => item.id === id);
    ctx.response.body = {
      status: 'SUCCESS',
      article: article ?? null
    };
  })
  .put('/articles/:id', async (ctx) => {
    const { id } = ctx.params;
    const newValue = await ctx.request.body({
      type: 'json'
    }).value;
    const oldArticles = await readFileTransformer('./assets/data/articles.json');
    const newArticles = oldArticles.map((article: any) => {
      if (article.id === id) {
        return {
          ...article,
          ...newValue
        };
      }
      return article;
    });
    await writeFileTransformer('./assets/data/articles.json', newArticles);
    ctx.response.body = {
      status: 'SUCCESS',
    };
  })

app.use(router.routes());
app.use(router.allowedMethods());
console.log(`Server running at http://${ options.hostname }:${ options.port }`);
await app.listen(options);

async function readFileTransformer(path: string): Promise<any> {
  const decoder = new TextDecoder('utf-8');
  const dataArray = await readFile(path);
  return JSON.parse(decoder.decode(dataArray));
}

async function writeFileTransformer(path: string, data: any): Promise<void> {
  const encoder = new TextEncoder();
  await writeFile(path, encoder.encode(JSON.stringify(data)));
}

