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

public class Database {

   private Logging logger ;
   public Sqlite.Database db ;

   public static Database (string db_location) {
	  this.logger = Logging.get_default () ;
	  this.db = init (db_location) ;
   }

   public Sqlite.Database init(string db_location) {
	  Sqlite.Database new_db ;
	  int rc = Sqlite.Database.open (db_location + "/polvora.db", out new_db) ;
	  if( rc != Sqlite.OK ){
		 logger.publish (new LogMsg ("Can't open database: " + this.db.errmsg ())) ;
	  }

	  return new_db ;
   }

   public int execute_query(string sql) {
	  int rc ;
	  string errmsg ;

	  rc = db.exec (sql, null, out errmsg) ;
	  if( rc != Sqlite.OK ){
		 logger.publish (new LogMsg (errmsg)) ;
	  }
	  return rc ;
   }

   public Sqlite.Statement execute_statement(string sql) {
	  Sqlite.Statement stmt ;
	  int rc ;

	  rc = db.prepare_v2 (sql, sql.length, out stmt) ;
	  if( rc != Sqlite.OK ){
		 logger.publish (new LogMsg ("Error preparing query: " + db.errmsg ())) ;
	  }

	  return stmt ;
   }

}
