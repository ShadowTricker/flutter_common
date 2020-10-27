import { Application, Router } from "https://deno.land/x/oak/mod.ts";
const { readFile } = Deno;

const options = { hostname: '10.237.188.41', port: 3400 };


const app = new Application();
const router = new Router();

router.get('/articles', (ctx) => {
  ctx.response.body = {
    name: 'test'
  };
});

app.use(router.routes());
app.use(router.allowedMethods());
console.log(`Server running at http://${ options.hostname }:${ options.port }`);
await app.listen(options);


