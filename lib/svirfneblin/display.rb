require 'ncursesw'

class Display
  def initialize adapter=:ncurses
    @adapter = NcurseswAdapter.new if adapter==:ncursesw
  end
  
  def close
    @adapter.close    
  end

  def getc
    @adapter.getc
  end

  def redraw
    @adapter.redraw
  end

  def place x, y, tile
    @adapter.place x, y, tile
  end

  def clear
    @adapter.clear
  end
end

class NcurseswAdapter
  def initialize
    Ncurses.initscr
    Ncurses.cbreak
    Ncurses.noecho
    Ncurses.curs_set(0)
  end

  def clear
    Ncurses.clear
  end

  def close
    Ncurses.endwin
  end

  def redraw
    Ncurses.refresh
    
  end

  def place x, y, tile
    Ncurses.mvaddstr y, x, tile.to_s
  end

  def getc
    c = Ncurses.stdscr.getch.chr
  end
end
