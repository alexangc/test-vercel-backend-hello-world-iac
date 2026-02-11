module.exports = async ({ github, context }) => {
  const owner = context.repo.owner;
  const repo = context.repo.repo;

  const prNumber = context.payload.pull_request?.number;
  if (!prNumber) return; // nothing to comment on

  const username = context.actor;

  const org = process.env.ORG_SLUG;
  const team_slug = process.env.TEAM_SLUG;
  const job_name = process.env.JOB_NAME;

  const error = (process.env.AUTH_ERROR || "").trim();
  const body =
    `⚠️ OpenTofu plan was **not** started.\n\n` +
    `**Job:** ${job_name}\n` +
    `**Triggered by:** @${username}\n` +
    `**Reason:** ${error || "User is not authorized to run this command."}\n\n` +
    `Only members of **@${org}/${team_slug}** may apply the tofu plan label.`;

  await github.rest.issues.createComment({
    owner,
    repo,
    issue_number: prNumber,
    body,
  });
};
