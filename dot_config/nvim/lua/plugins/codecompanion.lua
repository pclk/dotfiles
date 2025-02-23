return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    {
      "saghen/blink.cmp",
      opts = {
        sources = {
          per_filetype = {
            codecompanion = { "codecompanion" },
          },
        },
      },
    },
  },
  -- keymappings are at keymaps.lua, because need modes
  opts = {

    opts = {
      system_prompt = function(opts)
        return "Instead of using bullet points, always type in full, cohesive, long and informative paragraphs."
      end,
    },

    display = {
      action_palette = {
        opts = {
          show_default_actions = true,
          show_default_prompt_library = true,
        },
      },
      chat = {
        window = {
          width = 0.50,
        },
        intro_message = "Hi",
        start_in_insert_mode = true, -- Open the chat buffer in insert mode?
      },
    },

    adapters = {
      gemini = function()
        return require("codecompanion.adapters").extend("gemini", {
          schema = {
            model = {
              default = "gemini-2.0-flash-thinking-exp-01-21",
              choices = {
                "gemini-2.0-flash-thinking-exp-01-21",
                "gemini-2.0-pro-exp-02-05",
                "gemini-2.0-flash-lite-preview-02-05",
                "gemini-2.0-flash",
              },
            },
          },
        })
      end,
    },

    strategies = {
      chat = {
        adapter = "anthropic",
        keymaps = {
          send = {
            modes = { n = "<C-s>", i = "<C-s>" },
          },
          close = {
            modes = { n = "<C-w>", i = "<C-$>" },
          },
        },
      },
    },

    prompt_library = {
      ["Explain Code"] = {
        strategy = "chat",
        description = "Detailed code explanation with FAQ",
        opts = {
          short_name = "explain",
        },
        prompts = {
          {
            role = "user",
            content = [[Role: You are an expert teacher in the topic of the currently selected file.

The user would like you to explain the selected text (or selected code) in the utmost clarity and detail, walking through the logic, how it interacts with other items in the selected file, and so on.

Based on your expertise, devise the best way to explain. This could be through stories, analogies etc.

After your lengthy explanation, include an FAQ portion. This will help to deepen your explanation and answer any possible queries the user might have.

Proceed to devise the teaching plan, then execute the plan immediately, in full clarity and detail.]],
          },
        },
      },
      ["Mnemonic Creator"] = {
        strategy = "chat",
        description = "Create memorable mnemonics for learning",
        opts = {
          short_name = "mnemonic",
        },
        prompts = {
          {
            role = "user",
            content = [[You are an expert mnemonic creator for flashcards. Your goal is to generate effective and memorable memory hacks to help users learn and recall information quickly. Focus on creating mnemonics that are:

* **Meaningful and Relevant:** The mnemonic should clearly relate to the information it represents. Use keywords or concepts from the original text. Avoid purely arbitrary letter combinations if possible; aim for connections to the subject matter.

* **Vivid and Imaginative:** Employ imagery, sensory language, and if appropriate, humor or exaggeration to make the mnemonic more memorable. Encourage visualization.

* **Simple and Concise:** The mnemonic should be short, easy to say, and easy to remember. Prioritize brevity for quick recall during flashcard review. Aim for acronyms, short phrases, or rhymes.

* **Action-Oriented (Where Applicable):** If the information is a process or sequence, try to use action verbs in the mnemonic to represent the steps.

* **Explain the Connection:** Along with the mnemonic, clearly explain how each part of the mnemonic maps back to the original information. This is crucial for understanding and using the mnemonic effectively.]],
          },
        },
      },
      ["Logging Expert"] = {
        strategy = "chat",
        description = "Enhance code logging and observability",
        opts = {
          short_name = "log",
        },
        prompts = {
          {
            role = "user",
            content = [[**Role: You are an expert in software observability and debugging, skilled at implementing effective logging strategies for complex systems.**

Considering the provided code, your goal is to enhance its logging capabilities to improve its debuggability, monitoring, and overall observability.

Provide specific log statement examples, indicating where they should be placed in the code and explaining the purpose and value of each log message for debugging and observability.]],
          },
        },
      },
      ["Format Text"] = {
        strategy = "chat",
        description = "Format text with newlines for readability",
        opts = {
          short_name = "format",
        },
        prompts = {
          {
            role = "user",
            content = [[**Role: You are a newline ("\\n") formatting expert.**

Your task is to format the selected text to enhance readability while preserving its original content.

Focus on:
- Add or remove linebreaks ("\\n") to improve visual clarity.
- Strategically use empty blank lines to separate content.
- Removing indentation to increase manual editing convenience.
- Ensuring that the word contents of the text remain completely unchanged.
- Applying formatting that is consistent and easy to read.

Do not add indentation, bullet points etc. Do not use any other symbol other than newlines ("\\n").

By following these rules, you help the user by making edits to the text easier.

Proceed to generate newline formatted text, with the selected text by controlling the amount of newline characters in the text you generate.
Do not include any introductory or concluding remarks.]],
          },
        },
      },
      ["Anki Cloze"] = {
        strategy = "chat",
        description = "Create Anki cloze deletion cards",
        opts = {
          short_name = "cloze",
        },
        prompts = {
          {
            role = "user",
            content = [[Create anki cloze deletion cards by surrounding key concepts with hyphens (-).

Examples:

Input 1:
The heart pumps blood through the body.

Output 1:
The -heart- pumps -blood- through the -body-.

Input 2:
Python is a high-level programming language created by Guido van Rossum in 1991.

Output 2:
-Python- is a -high-level programming language- created by -Guido van Rossum- in -1991-.

Input 3:
In photography, aperture controls the amount of light entering the camera.

Output 3:
In photography, -aperture- controls the -amount of light- entering the -camera-.

Explanation:
Each hyphenated section will be converted to Anki cloze deletions:
- Text wrapped in -hyphens- becomes {{c1::text}}
- Multiple deletions create separate cards
- Each card hides one piece while showing others

For example, "-heart- pumps -blood-" becomes:
{{c1::heart}} pumps {{c2::blood}}
Creating two cards:
Card 1: [...] pumps blood
Card 2: heart pumps [...]

Proceed to generate cloze deletion cards with the selected text by marking key concepts with hyphens.
Do not include any introductory or concluding remarks in your response.]],
          },
        },
      },
    },
  },
}
