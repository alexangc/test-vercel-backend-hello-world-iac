module.exports = async ({ github, context, core }) => {
  const org = process.env.ORG_SLUG;
  const team_slug = process.env.TEAM_SLUG;

  // For pull_request / pull_request_target labeled events, the actor is the label applier
  const username = context.actor;

  core.setOutput("authorized", "false");
  core.setOutput("error", "");

  // Make sure we're on a PR labeled event
  if (!context.payload.pull_request) {
    core.setOutput(
      "error",
      "This action only works on pull request label events.",
    );
    return;
  }

  try {
    const res = await github.rest.teams.getMembershipForUserInOrg({
      org,
      team_slug,
      username,
    });

    const state = res.data.state; // "active" or "pending"
    if (state === "active") {
      core.setOutput("authorized", "true");
    } else {
      core.setOutput(
        "error",
        `User @${username} is not an active member of @${org}/${team_slug} (state=${state}).`,
      );
    }
  } catch (err) {
    const status = err.status ? `${err.status}` : "unknown";
    const msg = err.message ? `${err.message}` : `${err}`;

    if (`${status}` === "404") {
      core.setOutput(
        "error",
        `Cannot verify membership for @${username} in @${org}/${team_slug}. ` +
          `GitHub returned 404. This can mean the user is not a member, the team/org slug is wrong, ` +
          `or the token cannot read org/team membership.`,
      );
      return;
    }

    core.setOutput(
      "error",
      `Cannot verify membership for @${username} in @${org}/${team_slug}. ` +
        `GitHub API error: ${status} ${msg}`,
    );
  }
};
