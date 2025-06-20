import fetch from "node-fetch";

export default async function handler(req, res) {
  if (req.method !== "POST") {
    return res.status(405).json({ error: "Solo se permite el método POST" });
  }

  const { message, name } = req.body || {};
  if (!message || !name) {
    return res.status(400).json({
      creator: "Ian",
      error: "Falta el 'message' o el 'name' en el cuerpo de la petición."
    });
  }

  const systemPrompt = `Responde de manera precisa, profesional, corta y directa. Llama al usuario siempre por su nombre: "${name}". No agregues información extra ni despedidas.`;

  try {
    const response = await fetch("https://api.openai.com/v1/chat/completions", {
      method: "POST",
      headers: {
        "Authorization": "Bearer " + process.env.OPENAI_API_KEY,
        "Content-Type": "application/json"
      },
      body: JSON.stringify({
        model: "gpt-3.5-turbo",
        messages: [
          { role: "system", content: systemPrompt },
          { role: "user", content: message }
        ],
        max_tokens: 180,
        temperature: 0.7
      })
    });

    if (!response.ok) {
      const err = await response.json();
      return res.status(500).json({
        creator: "Ian",
        error: "Error al consultar OpenAI",
        details: err
      });
    }

    const data = await response.json();
    const reply = data.choices?.[0]?.message?.content?.trim();

    return res.status(200).json({
      creator: "Ian",
      result: reply || "No se pudo generar una respuesta."
    });

  } catch (error) {
    return res.status(500).json({
      creator: "Ian",
      error: "Error en el servidor",
      details: error.message
    });
  }
}
