/* Copyright 2018-2020 Steven Oliver <oliver.steven@gmail.com>
 *
 * This file is part of pólvora.
 *
 * pólvora is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * pólvora is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with pólvora.  If not, see <http://www.gnu.org/licenses/>.
 */


public class Polvora.DatatablesWindow : Gtk.Window {
	private Polvora.CaseBox case_content;
	private Polvora.PowderBox powder_content;
	private Polvora.PrimerBox primer_content;
	private Polvora.ProjectileBox projectile_content;

	private Logging logger;

	/**
	 * Constructor
	 */
	public DatatablesWindow()
	{
		// HeaderBar
		Gtk.StackSwitcher switcher = this.build_switcher();
		Gtk.HeaderBar headerbar = new Gtk.HeaderBar();
		headerbar.set_custom_title(switcher);
		headerbar.set_show_close_button(true);
		this.set_titlebar(headerbar);

		// Add the main layout box
		Gtk.Box box = new Gtk.Box(Gtk.Orientation.VERTICAL, 0);
		box.pack_start(switcher.get_stack(), true, true, 0);
	}

	private Gtk.StackSwitcher build_switcher()
	{
		Gtk.Stack stack = new Gtk.Stack();
		Gtk.StackSwitcher switcher = new Gtk.StackSwitcher();

		stack.set_transition_type(Gtk.StackTransitionType.CROSSFADE);
		switcher.set_stack(stack);

		this.case_content = new Polvora.CaseBox();
		this.powder_content = new Polvora.PowderBox();
		this.primer_content = new Polvora.PrimerBox();
		this.projectile_content = new Polvora.ProjectileBox();

		stack.add_titled(case_content, "Case", _("Case"));
		stack.add_titled(powder_content, "Powder", _("Powder"));
		stack.add_titled(primer_content, "Primer", _("Primer"));
		stack.add_titled(projectile_content, "Projectile", _("Projectile"));

		return (switcher);
	}
}
