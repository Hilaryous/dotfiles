module.exports = {
  extends: ["@commitlint/config-conventional"],
  rules: {
    "type-enum": [
      2,
      "always",
      ["feat", "fix", "test", "chore", "docs", "refactor"],
    ],
    "subject-empty": [2, "never"],
    "header-max-length": [2, "always", 100],
  },
  // Ignore typical non-user messages
  ignores: [
    (message) => message.startsWith("Merge "),
    (message) => message.startsWith("Revert "),
  ],
};
