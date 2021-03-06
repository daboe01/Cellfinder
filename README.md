Cellfinder
========

Cellfinder is a comprehensive framework for image storage, filtering, feature extraction and registration. Cellfinder unifies the power of R (i.e. EBImage), ImageMagick, Postgres, Perl and custom command line tools (e.g. www.leptonica.org) into a graphical block oriented programming language. Cellfinder comes with all building blocks for powerful graphical ready-to-go appliances that run in any web browser. Cellfinder has already been used to buid cell counting applications in the laboratory setting, clinical image planimetry, clinical flicker comparisons and video stabilisation.

Features in detail:
 * 100% browser based
 * Desktop-quality UI (e.g. keyboard navigation, unlimited undo / redo)
 * Image repository
 * Stack support
 * Feature editors for dots, lines, angles, polygons and voronois
 * Batch processing
 * RANSAC tool for image registration
 * RESTful API (incl. WebSocket)

INSTALL
=====
```bash
# the easiest way to get Postgres up and running on a mac is Postgres.app
# we need a current R version including developer tools
# perl is already installed on linux and mac but we need quite a bunch of non-core perl modules
sudo perl -MCPAN -e 'install ($_) for qw/Mojolicious Mojolicious::Plugin::Database Mojolicious::Plugin::RenderFile SQL::Abstract::More Apache::Session::File Spreadsheet::WriteExcel DBD::Pg ImageMagick Statistics::R/'
# now download this repo and cd into it
morbo backend.pl # this starts the testing server
# now locate your favourite web browser to http://localhost:3000/Frontend/index.html
#
# you may eventually want to automatically launch hypnotoad backend.pl (production server) 
```

LICENCE
=====
This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.

