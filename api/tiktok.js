// api/tiktok.js
// Vercel Serverless Function & GitHub Codespaces testing file
// TikTok video downloader – wraps the public tikwm.com API
// Author: Ian
// Usage locally (Codespaces):
//   1. npm install (if you need extra deps)
//   2. node api/tiktok.js (or use a framework)
//   GET http://localhost:3000/api/tiktok?url=<TikTok URL>
// Deployed on Vercel it will be available at https://<project>.vercel.app/api/tiktok?url=<TikTok URL>

// If you prefer to use a framework like Next.js, simply drop this file under /pages/api/tiktok.js
// and remove the Express boilerplate. Vercel will detect and deploy automatically.

import http from 'http';
import url from 'url';

// Helper to format bytes -> megabytes with one decimal
function fmtMB(bytes = 0) {
  return bytes ? `${(bytes / (1024 * 1024)).toFixed(1)} MB` : "0 MB";
}

// Main request handler (works both for native http & Vercel)
export default async function handler(req, res) {
  // Allow CORS so front‑end calls work straight away
  res.setHeader('Access-Control-Allow-Origin', '*');
  res.setHeader('Access-Control-Allow-Methods', 'GET');

  if (req.method !== 'GET') {
    res.statusCode = 405;
    return res.end(JSON.stringify({ creator: 'Ian', status: false, error: 'Only GET supported' }));
  }

  const { query } = url.parse(req.url, true);
  const tiktokURL = query.url;
  if (!tiktokURL) {
    res.statusCode = 400;
    return res.end(JSON.stringify({ creator: 'Ian', status: false, error: 'Missing `url` query parameter' }));
  }

  const t0 = Date.now();
  try {
    const apiResponse = await fetch(`https://tikwm.com/api/?url=${encodeURIComponent(tiktokURL)}`);
    if (!apiResponse.ok) throw new Error(`Upstream error: ${apiResponse.status}`);

    const { code, msg, data } = await apiResponse.json();
    if (code !== 0 || !data) throw new Error(msg || 'Invalid response from upstream');

    const t1 = Date.now();

    const result = {
      creator: 'Ian',
      status: true,
      process: ((t1 - t0) / 1000).toFixed(4),
      data: {
        id: data.id || '',
        region: data.region || '',
        title: data.title || '',
        duration: data.duration || 0,
        repro: data.play_count || 0,
        like: data.digg_count || data.like_count || 0,
        share: data.share_count || 0,
        comment: data.comment_count || 0,
        download: data.download_count || 0,
        published: data.create_time || 0,
        author: {
          id: data.author?.id || '',
          username: data.author?.unique_id || '',
          nickname: data.author?.nickname || '',
        },
        music: {
          title: data.music?.title || '',
          author: data.music?.author || '',
          duration: data.music?.duration || 0,
        },
        media: {
          type: 'video',
          size_org: fmtMB(data.size),
          size_wm: fmtMB(data.size_wm),
          size_hd: fmtMB(data.size_hd),
          org: data.play || '',
          wm: data.wmplay || '',
          hd: data.hdplay || '',
          music: data.music?.play_url || '',
        },
      },
    };

    res.setHeader('Content-Type', 'application/json');
    return res.end(JSON.stringify(result, null, 2));
  } catch (err) {
    res.statusCode = 500;
    return res.end(JSON.stringify({ creator: 'Ian', status: false, error: err.message }));
  }
}

// When running locally (Codespaces / Node), spin up a tiny server if executed directly
if (import.meta.url === `file://${process.argv[1]}`) {
  const server = http.createServer((req, res) => handler(req, res));
  const PORT = process.env.PORT || 3000;
  server.listen(PORT, () => console.log(`TikTok DL API listening on http://localhost:${PORT}/api/tiktok?url=<TikTokURL>`));
}
