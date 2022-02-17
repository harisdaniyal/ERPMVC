using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MasterLayer
{
    public class DAL
    {
        public static SqlConnection con = null;
        public static SqlCommand cmd = null;
        public static DataSet ds = null;
        public static string jsonString = string.Empty;


        public static string getJSONDataWhere(Dictionary<Object, Object> args, string connectionString, string procedureName)
        {
            try
            {
                con = new SqlConnection(connectionString);
                cmd = new SqlCommand(procedureName, con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Connection.Open();

                foreach (var item in args)
                {
                    cmd.Parameters.AddWithValue(item.Key.ToString(), item.Value.ToString());
                }
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                ds = new DataSet();
                da.Fill(ds);
                jsonString = JsonConvert.SerializeObject(ds);
            }
            catch (Exception ex)
            {
                //
            }
            finally
            {
                cmd.Connection.Close();
            }
            return jsonString;
        }




        public static string getJSONData(string connectionString, string procedureName)
        {
            try
            {
                con = new SqlConnection(connectionString);
                cmd = new SqlCommand(procedureName, con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Connection.Open();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                ds = new DataSet();
                da.Fill(ds);
                jsonString = JsonConvert.SerializeObject(ds);
            }
            catch (Exception ex)
            {
                //
            }
            finally
            {
                cmd.Connection.Close();
            }
            return jsonString;
        }

        // This method is used for counting on the base of condition

        public static int getCountIf(Dictionary<Object, Object> args, string connectionString, string procedureName)
        {
            int count = 0;
            try
            {
                con = new SqlConnection(connectionString);
                cmd = new SqlCommand(procedureName, con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Connection.Open();

                foreach (var item in args)
                {
                    cmd.Parameters.AddWithValue(item.Key.ToString(), item.Value.ToString());
                }

                count = Convert.ToInt32(cmd.ExecuteScalar());

            }
            catch (Exception ex)
            {
                //
            }
            finally
            {
                cmd.Connection.Close();
            }
            return count;
        }

        // This method is used for showing Data on the base of Condition

        public static DataSet showDataWhere(Dictionary<Object, Object> args, string connectionString, string procedureName)
        {
            try
            {
                con = new SqlConnection(connectionString);
                cmd = new SqlCommand(procedureName, con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Connection.Open();


                foreach (var item in args)
                {
                    cmd.Parameters.AddWithValue(item.Key.ToString(), item.Value.ToString());
                }
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                ds = new DataSet();
                da.Fill(ds);
            }
            catch (Exception ex)
            {
                //
            }
            finally
            {
                cmd.Connection.Close();
            }
            return ds;
        }


        public static DataSet showDataWhere(Dictionary<Object, Object> tableValueParameters,Dictionary<Object, Object> args, string connectionString, string procedureName)
        {
            try
            {
                con = new SqlConnection(connectionString);
                cmd = new SqlCommand(procedureName, con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Connection.Open();

                foreach (var item in args)
                {
                    cmd.Parameters.AddWithValue(item.Key.ToString(), item.Value.ToString());
                }


                if (tableValueParameters.Count > 0)
                {
                    foreach (var tableValue in tableValueParameters)
                    {

                        if (tableValue.Value !=null)
                        {
                            Object obj = tableValue.Value.GetType().GetProperty("Count").GetValue(tableValue.Value, null);
                            if ((int)obj != 0)
                            {
                                SqlParameter param = new SqlParameter();
                                param.ParameterName = tableValue.Key.ToString();
                                param.SqlDbType = SqlDbType.Structured;
                                param.Value = tableValue.Value;
                                param.Direction = ParameterDirection.Input;
                                cmd.Parameters.Add(param);
                            }
                        }
                        
                    }
                }

                   


                SqlDataAdapter da = new SqlDataAdapter(cmd);
                ds = new DataSet();
                da.Fill(ds);
            }
            catch (Exception ex)
            {
                //
            }
            finally
            {
                cmd.Connection.Close();
            }
            return ds;
        }

        // This method is used for viewing Data

        public static DataSet viewData(string connectionString, string procedureName)
        {
            try
            {
                con = new SqlConnection(connectionString);
                cmd = new SqlCommand(procedureName, con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Connection.Open();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                ds = new DataSet();
                da.Fill(ds);

            }
            catch (Exception ex)
            {
                //
            }
            finally
            {
                cmd.Connection.Close();
            }
            return ds;
        }


        // This method is used to count all rows

        public static int getTotalCount(string connectionString, string procedureName)
        {
            int count = 0;
            try
            {
                con = new SqlConnection(connectionString);
                cmd = new SqlCommand(procedureName, con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Connection.Open();
                count = Convert.ToInt32(cmd.ExecuteScalar());
            }
            catch (Exception ex)
            {
                //
            }
            finally
            {
                cmd.Connection.Close();
            }
            return count;
        }

        // This method is used to insert data

        public static bool insertData(Dictionary<Object, Object> args, string procedureName, string connectionString)
        {
            try
            {
                con = new SqlConnection(connectionString);
                cmd = new SqlCommand(procedureName, con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                foreach (var item in args)
                {
                    cmd.Parameters.AddWithValue(item.Key.ToString(), item.Value.ToString());
                }

                cmd.Connection.Open();
                int a = cmd.ExecuteNonQuery();
                if (a > 0)
                {
                    return true;
                }

            }
            catch (Exception ex)
            {


            }
            finally
            {
                cmd.Connection.Close();
            }
            return false;
        }

        // This method is used to update Data

        public static bool updateData(Dictionary<Object, Object> args, string procedureName, string connectionString)
        {
            try
            {
                con = new SqlConnection(connectionString);
                cmd = new SqlCommand(procedureName, con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                foreach (var item in args)
                {
                    cmd.Parameters.AddWithValue(item.Key.ToString(), item.Value.ToString());
                }

                cmd.Connection.Open();
                if (cmd.ExecuteNonQuery() > 0)
                {
                    return true;
                }

            }
            catch (Exception ex)
            {

            }

            finally
            {
                cmd.Connection.Close();

            }
            return false;
        }



        // This method is used to delete data

        public static bool deleteData(Dictionary<Object, Object> args, string procedureName, string connectionString)
        {
            try
            {
                con = new SqlConnection(connectionString);
                cmd = new SqlCommand(procedureName, con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                foreach (var item in args)
                {
                    cmd.Parameters.AddWithValue(item.Key.ToString(), Convert.ToInt32(item.Value));
                }
                cmd.Connection.Open();
                int a = cmd.ExecuteNonQuery();
                if (a > 0)
                {
                    return true;
                }

            }
            catch (Exception ex)
            {

            }

            finally
            {
                cmd.Connection.Close();

            }
            return false;

        }


        public static bool insertData(Dictionary<Object,Object> tableValueParameters,Dictionary<Object, Object> args, string procedureName, string connectionString)
        {
            try
            {

                con = new SqlConnection(connectionString);
                cmd = new SqlCommand(procedureName, con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                if (args != null)
                {
                    foreach (var item in args)
                    {
                        cmd.Parameters.AddWithValue(item.Key.ToString(), item.Value.ToString());
                    }
                }
                


                if (tableValueParameters.Count > 0)
                {
                    foreach (var tableValue in tableValueParameters)
                    {

                        if (tableValue.Value != null)
                        {
                            Object obj = tableValue.Value.GetType().GetProperty("Count").GetValue(tableValue.Value, null);
                            if ((int)obj != 0)
                            {
                                SqlParameter param = new SqlParameter();
                                param.ParameterName = tableValue.Key.ToString();
                                param.SqlDbType = SqlDbType.Structured;
                                param.Value = tableValue.Value;
                                param.Direction = ParameterDirection.Input;
                                cmd.Parameters.Add(param);
                            }
                        }

                    }
                }
               

                cmd.Connection.Open();
                int a = cmd.ExecuteNonQuery();
                if (a > 0)
                {
                    return true;
                }

            }
            catch (Exception ex)
            {


            }
            finally
            {
                cmd.Connection.Close();
            }
            return false;
        }


    }
}
