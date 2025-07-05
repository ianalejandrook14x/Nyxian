// api/tiktok.js – Vercel Serverless Function
// Descargar videos de TikTok vía la API pública de tikwm.com
// Autor: Ian  |  Última actualización: 05‑Jul‑2025

/**
 * 🚀  Endpoint:
 * GET /api/tiktok?url=<URL‑de‑TikTok>
 *
 * Ejemplo:
 *   https://mi‑proyecto.vercel.app/api/tiktok?url=https://www.tiktok.com/@scout2015/video/6718335390845095173
 *
 * 📦  Sin dependencias externas. Node >= 18 (fetch integrado).
 */

const toMB = (bytes = 0) => bytes ? `${(bytes / (1024 * 1024)).toFixed(1)} MB` : '0 MB';

module.exports = async function handler(req, res) {
  res.setHeader('Access-Control-Allow-Origin', '*');
  res.setHeader('Access-Control-Allow-Methods', 'GET, OPTIONS');
  res.setHeader('Access-Control-Allow-Headers', 'Content-Type');
  if (req.method === 'OPTIONS') return res.status(204).end();

  if (req.method !== 'GET') {
    return res.status(405).json({ creator: 'ianalejandrook15x', status: false, error: 'Only GET supported' });
  }

  const tiktokURL = req.query?.url;
  if (!tiktokURL) {
    return res.status(400).json({ creator: 'ianalejandrook15x', status: false, error: 'Missing `url` query parameter' });
  }

  const t0 = Date.now();

  try {
    const upstream = await fetch(`https://tikwm.com/api/?url=${encodeURIComponent(tiktokURL)}`);
    if (!upstream.ok) throw new Error(`Upstream error ${upstream.status}`);

    const { code, msg, data } = await upstream.json();
    if (code !== 0 || !data) throw new Error(msg || 'Invalid Tikwm response');

    const t1 = Date.now();

    return res.status(200).json({
      creator: 'Ian',
      status: true,
      process: ((t1 - t0) / 1000).toFixed(4),
      data: {
        id: data.id || '',
        region: data.region || '',
        title: data.title || '',
        duration: data.duration || 0,
        repro: data.play_count || 0,
        like: data.digg_count || 0,
        share: data.share_count || 0,
        comment: data.comment_count || 0,
        download: data.download_count || 0,
        published: data.create_time || 0,
        author: {
          id: data.author?.id || '',
          username: data.author?.unique_id ? `@${data.author.unique_id}` : '',
          nickname: data.author?.nickname || '',
        },
        music: {
          title: data.music?.title || data.music?.original || '',
          author: data.music?.author || '',
          duration: data.music?.duration || 0,
        },
        media: {
          type: 'video',
          size_org: toMB(data.size || 0),
          size_wm: toMB(data.size_wm || 0),
          size_hd: toMB(data.size_hd || 0),
          org: data.play || data.video || '',
          wm: data.wmplay || '',
          hd: data.hdplay || '',
          music: data.music?.play_url || data.music?.url || '',
        },
      },
    });
  } catch (err) {
    return res.status(500).json({ creator: 'Ian', status: false, error: err.message });
  }
};
