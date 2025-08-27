
require 'gtk3'

class ArtikelauswahlApp < Gtk::Application
  WINDOW_WIDTH  = 1520
  WINDOW_HEIGHT = 880

  def initialize
    super('com.example.artikelauswahl', :flags_none)
    signal_connect('activate') { |app| on_activate(app) }
  end

  private

  def on_activate(app)
    window = Gtk::ApplicationWindow.new(app)
    window.title = 'Artikelauswahl'
    window.set_default_size(WINDOW_WIDTH, WINDOW_HEIGHT)

    root_vbox = Gtk::Box.new(:vertical, 0)
    window.add(root_vbox)

    # MenuBar
    menubar = build_menu_bar
    root_vbox.pack_start(menubar, expand: false, fill: false, padding: 0)

    # AnchorPane equivalent using Gtk::Fixed
    fixed = Gtk::Fixed.new
    # AnchorPane prefHeight="578.0" prefWidth="780.0" (size request as a hint)
    fixed.set_size_request(1520, 880)
    root_vbox.pack_start(fixed, expand: true, fill: true, padding: 0)

    # Label "Artikel" (layoutX="14.0" layoutY="14.0", Font size 18)
    lbl_artikel = Gtk::Label.new('Artikel')
    lbl_artikel.set_xalign(0.5) # text alignment center inside label
    lbl_artikel.set_size_request(60, -1)
    lbl_artikel.override_font(Pango::FontDescription.new('Sans 18'))
    fixed.put(lbl_artikel, 20, 18)

    # Top category buttons row
    btn_frische = Gtk::Button.new(label: 'Frische Lebensmittel')
    btn_frische.set_size_request(150, 111)
    fixed.put(btn_frische, 20, 60)

    btn_tierische = Gtk::Button.new(label: ' Tierische Produkte')
    btn_tierische.set_size_request(150, 111)
    fixed.put(btn_tierische, 210, 60)

    btn_backwaren = Gtk::Button.new(label: 'Handgemachte Backwaren')
    btn_backwaren.set_size_request(122, 111)
    fixed.put(btn_backwaren, 391, 60)

    btn_feinkost = Gtk::Button.new(label: 'Eingemachtes & Feinkost')
    btn_feinkost.set_size_request(122, 111)
    fixed.put(btn_feinkost, 625, 60)

    btn_sonstiges = Gtk::Button.new(label: 'Sonstiges aus eigener Herstellung')
    btn_sonstiges.set_size_request(122, 111)
    fixed.put(btn_sonstiges, 845, 60)

    btn_fremdwaren = Gtk::Button.new(label: 'Fremdwaren')
    btn_fremdwaren.set_size_request(122, 111)
    fixed.put(btn_fremdwaren, 1120, 60)

    # Middle section separator (horizontal)
    sep_middle = Gtk::Separator.new(:horizontal)
    sep_middle.set_size_request(1100, 2)
    fixed.put(sep_middle, 28, 190)

    # Vertical separator
    sep_vertical = Gtk::Separator.new(:vertical)
    sep_vertical.set_size_request(2, 665)
    fixed.put(sep_vertical, 1163, 190)

    #######################################################################################

    # Buttons "Gemüse" and "Obst"
    btn_gemuese = Gtk::Button.new
    box = Gtk::Box.new(Gtk::Orientation::VERTICAL, 5)
    box.halign = :center
    box.valign = :center
    icon = Gtk::Image.new(file:'C:\Users\student\Desktop\Ruby\Hofladen-Frontend\Icons\gemuese.png')
    label = Gtk::Label.new('Gemüse')
    box.add(icon)
    box.add(label)
    btn_gemuese.add(box)
    btn_gemuese.set_size_request(160, 130)
    fixed.put(btn_gemuese, 30, 210)

    btn_obst = Gtk::Button.new
    box = Gtk::Box.new(Gtk::Orientation::VERTICAL, 5)
    box.halign = :center
    box.valign = :center
    icon = Gtk::Image.new(file:'C:\Users\student\Desktop\Ruby\Hofladen-Frontend\Icons\obst.png')
    label = Gtk::Label.new('Obst')
    box.add(icon)
    box.add(label)
    btn_obst.add(box)
    btn_obst.set_size_request(160, 130)
    fixed.put(btn_obst, 210, 210)

    lbl_gemuese = Gtk::Label.new('Gemüse')
    lbl_gemuese.set_xalign(0.5) 
    lbl_gemuese.set_size_request(60, -1)
    lbl_gemuese.override_font(Pango::FontDescription.new('Sans 18'))
    fixed.put(lbl_gemuese, 30, 400)

    # TabPane (Notebook)
    notebook = Gtk::Notebook.new
    notebook.set_size_request(722, 354)
    fixed.put(notebook, 30, 450)

    # Tab "Kartoffeln" with a button inside
    content_kartoffeln = Gtk::Box.new(:vertical, 0)

      grid = Gtk::Grid.new
      grid.row_spacing = 15
      grid.column_spacing = 15

      spacer_label = Gtk::Label.new('')
      spacer_label.set_size_request(5, 0)

      grid.attach(spacer_label, 0, 0, 1, 1)

      btn_in_tab_kartoffeln_1 = Gtk::Button.new
      box_1 = Gtk::Box.new(Gtk::Orientation::VERTICAL, 5)
      box_1.halign = :center
      box_1.valign = :center
      icon = Gtk::Image.new(file:'C:\Users\student\Desktop\Ruby\Hofladen-Frontend\Icons\potato.png')
      label = Gtk::Label.new('Kartoffeln festkochend')
      box_1.add(icon)
      box_1.add(label)
      btn_in_tab_kartoffeln_1.add(box_1)
      btn_in_tab_kartoffeln_1.set_size_request(160, 130)
       
      grid.attach(btn_in_tab_kartoffeln_1, 1, 0, 1, 1)

      btn_in_tab_kartoffeln_2 = Gtk::Button.new
      box_2 = Gtk::Box.new(Gtk::Orientation::VERTICAL, 5)
      box_2.halign = :center
      box_2.valign = :center
      icon = Gtk::Image.new(file:'C:\Users\student\Desktop\Ruby\Hofladen-Frontend\Icons\potato_2.png')
      label = Gtk::Label.new('Kartoffeln mehlig')
      box_2.add(icon)
      box_2.add(label)
      btn_in_tab_kartoffeln_2.add(box_2)
      btn_in_tab_kartoffeln_2.set_size_request(160, 130)
       
      grid.attach(btn_in_tab_kartoffeln_2, 2, 0, 1, 1)


    content_kartoffeln.pack_start(grid, expand: false, fill: false, padding: 15)
    notebook.append_page(content_kartoffeln, Gtk::Label.new('Kartoffeln'))

    # Tab "Karotten" with a button inside
    content_karotten = Gtk::Box.new(:vertical, 0)

      grid = Gtk::Grid.new
      grid.row_spacing = 15
      grid.column_spacing = 15

      spacer_label = Gtk::Label.new('')
      spacer_label.set_size_request(5, 0)

      grid.attach(spacer_label, 0, 0, 1, 1)

      # Button "Karotten frisch geerntet"
      btn_in_tab_karotten_1 = Gtk::Button.new
      box_1 = Gtk::Box.new(Gtk::Orientation::VERTICAL, 5)
      box_1.halign = :center
      box_1.valign = :center
      icon = Gtk::Image.new(file:'C:\Users\student\Desktop\Ruby\Hofladen-Frontend\Icons\carrots_frisch.png')
      label = Gtk::Label.new('Karotten frisch geerntet')
      box_1.add(icon)
      box_1.add(label)
      btn_in_tab_karotten_1.add(box_1)
      btn_in_tab_karotten_1.set_size_request(160, 130)

      grid.attach(btn_in_tab_karotten_1, 1, 0, 1, 1)

      # Button "Karotten bunt gemischt"
      btn_in_tab_karotten_2 = Gtk::Button.new
      box_2 = Gtk::Box.new(Gtk::Orientation::VERTICAL, 5)
      box_2.halign = :center
      box_2.valign = :center
      icon = Gtk::Image.new(file:'C:\Users\student\Desktop\Ruby\Hofladen-Frontend\Icons\carrots_bunt.png')
      label = Gtk::Label.new('Karotten bunt gemischt')
      box_2.add(icon)
      box_2.add(label)
      btn_in_tab_karotten_2.add(box_2)
      btn_in_tab_karotten_2.set_size_request(160, 130)

      grid.attach(btn_in_tab_karotten_2, 2, 0, 1, 1)

    content_karotten.pack_start(grid, expand: false, fill: false, padding: 15)
    notebook.append_page(content_karotten, Gtk::Label.new('Karotten'))

    # Tab "Zwiebeln" with a button inside
    content_zwiebeln = Gtk::Box.new(:vertical, 0)

      grid = Gtk::Grid.new
      grid.row_spacing = 15
      grid.column_spacing = 15

      spacer_label = Gtk::Label.new('')
      spacer_label.set_size_request(5, 0)

      grid.attach(spacer_label, 0, 0, 1, 1)

      # Button "Zwiebeln"
      btn_in_tab_zwiebeln = Gtk::Button.new
      box_1 = Gtk::Box.new(Gtk::Orientation::VERTICAL, 5)
      box_1.halign = :center
      box_1.valign = :center
      icon = Gtk::Image.new(file:'C:\Users\student\Desktop\Ruby\Hofladen-Frontend\Icons\onion.png')
      label = Gtk::Label.new('Zwiebeln')
      box_1.add(icon)
      box_1.add(label)
      btn_in_tab_zwiebeln.add(box_1)
      btn_in_tab_zwiebeln.set_size_request(160, 130)

      grid.attach(btn_in_tab_zwiebeln, 1, 0, 1, 1)

    content_zwiebeln.pack_start(grid, expand: false, fill: false, padding: 15)
    notebook.append_page(content_zwiebeln, Gtk::Label.new('Zwiebeln'))

    # Tab "Knoblauch" with a button inside
     content_knoblauch = Gtk::Box.new(:vertical, 0)

      grid = Gtk::Grid.new
      grid.row_spacing = 15
      grid.column_spacing = 15

      spacer_label = Gtk::Label.new('')
      spacer_label.set_size_request(5, 0)

      grid.attach(spacer_label, 0, 0, 1, 1)

      # Button "Knoblauch"
      btn_in_tab_knoblauch = Gtk::Button.new
      box_1 = Gtk::Box.new(Gtk::Orientation::VERTICAL, 5)
      box_1.halign = :center
      box_1.valign = :center
      icon = Gtk::Image.new(file:'C:\Users\student\Desktop\Ruby\Hofladen-Frontend\Icons\garlic.png')
      label = Gtk::Label.new('Knoblauch')
      box_1.add(icon)
      box_1.add(label)
      btn_in_tab_knoblauch.add(box_1)
      btn_in_tab_knoblauch.set_size_request(160, 130)

      grid.attach(btn_in_tab_knoblauch, 1, 0, 1, 1)

    content_knoblauch.pack_start(grid, expand: false, fill: false, padding: 15)
    notebook.append_page(content_knoblauch, Gtk::Label.new('Knoblauch'))

    # Tab "Salate & Blattgemüse" with a button inside
    content_salate = Gtk::Box.new(:vertical, 0)

      grid = Gtk::Grid.new
      grid.row_spacing = 15
      grid.column_spacing = 15

      spacer_label = Gtk::Label.new('')
      spacer_label.set_size_request(5, 0)

      grid.attach(spacer_label, 0, 0, 1, 1)

      btn_in_tab_salat = Gtk::Button.new
      box_1 = Gtk::Box.new(Gtk::Orientation::VERTICAL, 5)
      box_1.halign = :center
      box_1.valign = :center
      icon = Gtk::Image.new(file:'C:\Users\student\Desktop\Ruby\Hofladen-Frontend\Icons\salad.png')
      label = Gtk::Label.new('Salat')
      box_1.add(icon)
      box_1.add(label)
      btn_in_tab_salat.add(box_1)
      btn_in_tab_salat.set_size_request(160, 130)
       
      grid.attach(btn_in_tab_salat, 1, 0, 1, 1)

      btn_in_tab_rucola = Gtk::Button.new
      box_2 = Gtk::Box.new(Gtk::Orientation::VERTICAL, 5)
      box_2.halign = :center
      box_2.valign = :center
      icon = Gtk::Image.new(file:'C:\Users\student\Desktop\Ruby\Hofladen-Frontend\Icons\arugula.png')
      label = Gtk::Label.new('Rucola')
      box_2.add(icon)
      box_2.add(label)
      btn_in_tab_rucola.add(box_2)
      btn_in_tab_rucola.set_size_request(160, 130)
       
      grid.attach(btn_in_tab_rucola, 2, 0, 1, 1)

      btn_in_tab_spinat = Gtk::Button.new
      box_3 = Gtk::Box.new(Gtk::Orientation::VERTICAL, 5)
      box_3.halign = :center
      box_3.valign = :center
      icon = Gtk::Image.new(file:'C:\Users\student\Desktop\Ruby\Hofladen-Frontend\Icons\spinach.png')
      label = Gtk::Label.new('Spinat')
      box_3.add(icon)
      box_3.add(label)
      btn_in_tab_spinat.add(box_3)
      btn_in_tab_spinat.set_size_request(160, 130)
       
      grid.attach(btn_in_tab_rucola, 3, 0, 1, 1)

    content_salate.pack_start(grid, expand: false, fill: false, padding: 15)
    notebook.append_page(content_salate, Gtk::Label.new('Salate & Blattgemüse'))


    #######################################################################################
    # Right side controls

    # ComboBox "Artikelname" (label + combo)
    lbl_artikelnummer = Gtk::Label.new('Artikelname')
    lbl_artikelnummer.override_font(Pango::FontDescription.new('Sans 14'))
    lbl_artikelnummer.set_size_request(106, 20)
    fixed.put(lbl_artikelnummer, 1230, 200)
    cb_artikelnummer = Gtk::ComboBoxText.new
    cb_artikelnummer.set_size_request(250, 28)
    fixed.put(cb_artikelnummer, 1230, 230)
    
    # ComboBox "Artikelnummer" (label + combo)
    lbl_artikelnummer = Gtk::Label.new('Artikelnummer')
    lbl_artikelnummer.override_font(Pango::FontDescription.new('Sans 14'))
    lbl_artikelnummer.set_size_request(106, 20)
    fixed.put(lbl_artikelnummer, 1230, 280)
    cb_artikelnummer = Gtk::ComboBoxText.new
    cb_artikelnummer.set_size_request(250, 28)
    fixed.put(cb_artikelnummer, 1230, 310)

    # ComboBox "Menge" (label + combo)
    lbl_menge = Gtk::Label.new('Menge')
    lbl_menge.override_font(Pango::FontDescription.new('Sans 14'))
    fixed.put(lbl_menge, 1230, 360)
    cb_menge = Gtk::ComboBoxText.new
    cb_menge.set_size_request(250, 28)
    fixed.put(cb_menge, 1230, 390)

    # Separator under "Menge"
    sep_menge = Gtk::Separator.new(:horizontal)
    sep_menge.set_size_request(250, 2)
    fixed.put(sep_menge, 1230, 500)

    # Label "Preis" and TextField
    lbl_preis = Gtk::Label.new('Preis')
    lbl_preis.override_font(Pango::FontDescription.new('Sans 14'))
    fixed.put(lbl_preis, 1230, 520)
    entry_preis = Gtk::Entry.new
    entry_preis.text = '0,00 €'
    # Align text to right
    entry_preis.xalign = 1.0
    entry_preis.set_size_request(250, 26)
    fixed.put(entry_preis, 1230, 550)

    # Button "Artikel hinzufügen"
    btn_artikel_hinzufuegen = Gtk::Button.new
    box = Gtk::Box.new(Gtk::Orientation::VERTICAL, 5)
    box.halign = :center
    box.valign = :center
    icon = Gtk::Image.new(file:'C:\Users\student\Desktop\Ruby\Hofladen-Frontend\Icons\add-to-basket.png')
    label = Gtk::Label.new('Artikel hinzufügen')
    box.add(icon)
    box.add(label)
    btn_artikel_hinzufuegen.add(box)
    btn_artikel_hinzufuegen.set_size_request(250, 170)
    fixed.put(btn_artikel_hinzufuegen, 1230, 620)

    # Button "Zum Warenkorb"
    btn_zum_warenkorb = Gtk::Button.new(label: 'Zum Warenkorb')
    btn_zum_warenkorb.set_size_request(250, 26)
    fixed.put(btn_zum_warenkorb, 1230, 810)

    #######################################################################################

    window.show_all
  end

  def build_menu_bar
    menubar = Gtk::MenuBar.new

    # File menu
    file_item = Gtk::MenuItem.new(label: 'File')
    file_menu = Gtk::Menu.new
    file_item.submenu = file_menu

    file_menu.append(Gtk::MenuItem.new(label: 'New'))
    file_menu.append(Gtk::MenuItem.new(label: 'Open…'))

    open_recent_item = Gtk::MenuItem.new(label: 'Open Recent')
    open_recent_menu = Gtk::Menu.new
    # No recent items specified in FXML; keep submenu empty
    open_recent_item.submenu = open_recent_menu
    file_menu.append(open_recent_item)

    file_menu.append(Gtk::SeparatorMenuItem.new)
    file_menu.append(Gtk::MenuItem.new(label: 'Close'))
    file_menu.append(Gtk::MenuItem.new(label: 'Save'))
    file_menu.append(Gtk::MenuItem.new(label: 'Save As…'))
    file_menu.append(Gtk::MenuItem.new(label: 'Revert'))
    file_menu.append(Gtk::SeparatorMenuItem.new)
    file_menu.append(Gtk::MenuItem.new(label: 'Preferences…'))
    file_menu.append(Gtk::SeparatorMenuItem.new)

    quit_item = Gtk::MenuItem.new(label: 'Quit')
    quit_item.signal_connect('activate') { Gtk.main_quit }
    file_menu.append(quit_item)

    menubar.append(file_item)

    # Edit menu
    edit_item = Gtk::MenuItem.new(label: 'Edit')
    edit_menu = Gtk::Menu.new
    edit_item.submenu = edit_menu

    %w[Undo Redo].each { |t| edit_menu.append(Gtk::MenuItem.new(label: t)) }
    edit_menu.append(Gtk::SeparatorMenuItem.new)
    %w[Cut Copy Paste Delete].each { |t| edit_menu.append(Gtk::MenuItem.new(label: t)) }
    edit_menu.append(Gtk::SeparatorMenuItem.new)
    %w[Select\ All Unselect\ All].each { |t| edit_menu.append(Gtk::MenuItem.new(label: t)) }

    menubar.append(edit_item)

    # Help menu
    help_item = Gtk::MenuItem.new(label: 'Help')
    help_menu = Gtk::Menu.new
    help_item.submenu = help_menu
    help_menu.append(Gtk::MenuItem.new(label: 'About MyHelloApp'))

    menubar.append(help_item)

    menubar
  end
end

if __FILE__ == $0
  ArtikelauswahlApp.new.run
end

# -----
