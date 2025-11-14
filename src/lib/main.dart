// The entrypoint for the **server** environment.
//
// The [main] method will only be executed on the server during pre-rendering.
// To run code on the client, use the @client annotation.

// Server-specific jaspr import.
import 'package:jaspr/server.dart';

import 'package:jaspr_content/components/callout.dart';
import 'package:jaspr_content/components/code_block.dart';
import 'package:jaspr_content/components/github_button.dart';
import 'package:jaspr_content/components/header.dart';
import 'package:jaspr_content/components/image.dart';
import 'package:jaspr_content/components/sidebar.dart';
import 'package:jaspr_content/components/theme_toggle.dart';
import 'package:jaspr_content/jaspr_content.dart';
import 'package:jaspr_content/theme.dart';

import 'components/clicker.dart';
import 'components/donation_buttons.dart';

// This file is generated automatically by Jaspr, do not remove or edit.
import 'jaspr_options.dart';

void main() {
  // Initializes the server environment with the generated default options.
  Jaspr.initializeApp(
    options: defaultJasprOptions,
  );

  // Starts the app.
  //
  // [ContentApp] spins up the content rendering pipeline from jaspr_content to render
  // your markdown files in the content/ directory to a beautiful documentation site.
  runApp(ContentApp(
    // Enables mustache templating inside the markdown files.
    templateEngine: MustacheTemplateEngine(),
    parsers: [
      MarkdownParser(),
    ],
    extensions: [
      // Adds heading anchors to each heading.
      HeadingAnchorsExtension(),
      // Generates a table of contents for each page.
      TableOfContentsExtension(),
    ],
    components: [
      // The <Info> block and other callouts.
      Callout(),
      // Adds syntax highlighting to code blocks.
      CodeBlock(),
      // Adds a custom Jaspr component to be used as <Clicker/> in markdown.
      CustomComponent(
        pattern: 'Clicker',
        builder: (_, __, ___) => Clicker(),
      ),
      // Adds donation buttons component to be used as <DonationButtons/> in markdown.
      CustomComponent(
        pattern: 'DonationButtons',
        builder: (_, __, ___) => DonationButtons(),
      ),
      // Adds zooming and caption support to images.
      Image(zoom: true),
    ],
    layouts: [
      // Out-of-the-box layout for documentation sites.
      DocsLayout(
        header: Header(
          title: 'Documentação.dev',
          logo: '/images/logo.svg',
          items: [
            // Enables switching between light and dark mode.
            ThemeToggle(),
            // Shows github stats.
            GitHubButton(repo: 'ulisseshen/documentacao.dev'),
          ],
        ),
        sidebar: Sidebar(groups: [
          // Adds navigation links to the sidebar.
          SidebarGroup(
            title: 'Começando',
            links: [
              SidebarLink(text: "Introdução", href: '/'),
              SidebarLink(text: "Instalação", href: '/instalacao'),
            ],
          ),
          SidebarGroup(title: 'Guias', links: [
            SidebarLink(text: "Conceitos Básicos", href: '/conceitos'),
            SidebarLink(text: "Componentes", href: '/componentes'),
          ]),
          SidebarGroup(title: 'Comunidade', links: [
            SidebarLink(text: "Sobre", href: '/about'),
            SidebarLink(text: "Como Contribuir", href: '/contribuir'),
          ]),
        ]),
      ),
    ],
    theme: ContentTheme(
      // Customizes the default theme colors with cyan/blue accent.
      primary: ThemeColor(ThemeColors.cyan.$400, dark: ThemeColors.cyan.$400),
      background: ThemeColor(ThemeColors.slate.$50, dark: ThemeColors.zinc.$950),
      colors: [
        ContentColors.quoteBorders.apply(ThemeColors.cyan.$400),
      ],
    ),
  ));
}
