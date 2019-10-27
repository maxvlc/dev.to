class OrganizationTag < LiquidTagBase
  def initialize(_tag_name, organization, _tokens)
    @organization = parse_slug_to_organization(organization.delete(" "))
    @follow_button = follow_button(@organization)
    @organization_colors = user_colors(@organization)
  end

  def parse_slug_to_organization(organization)
    organization = Organization.find_by(slug: organization)
    raise StandardError, "Invalid organization slug" if organization.nil?

    organization
  end
end

Liquid::Template.register_tag("organization", OrganizationTag)
Liquid::Template.register_tag("org", OrganizationTag)
