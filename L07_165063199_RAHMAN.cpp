/*GROUP: 7
Names                  Student ID
-----------------------------------
1. Tahsin Rahman        165063199 
2.Jessica Chan          158891184
3.Mohammad Amaan        149856197
*/


#include <iostream>
#include <occi.h>
#include<iomanip>


using oracle::occi::Environment;
using oracle::occi::Connection;
using namespace oracle::occi;

using namespace std;
namespace sdds {
    //print header
    void printHeader(const char* title) {
        char allFill = cout.fill('-');
        cout.width(28);
        cout << "";
        cout << " " << title << " ";
        cout.fill('-');
        cout.width(35);
        cout << "" << endl;
        cout.fill(allFill);
        cout.setf(ios::left);
        cout.width(15);
        cout << "Employee ID ";
        cout.width(20);
        cout << "First Name";
        cout.width(20);
        cout << "Last Name";
        cout.width(20);
        cout << "Phone";
        cout.width(10);
        cout << "Extension" << endl;
        cout.unsetf(ios::left);
        cout.fill('-');
        cout.width(15);
        cout << " ";
        cout.fill('-');
        cout.width(20);
        cout << " ";
        cout.fill('-');
        cout.width(20);
        cout << " ";
        cout.fill('-');
        cout.width(20);
        cout << " ";
        cout.fill('-');
        cout.width(10);
        cout << " " << endl;
        cout.fill(allFill);
    }
}

int main(void) {
    // OCCI variables
    Environment* env = nullptr;
    Connection* conn = nullptr;
    // User variables
    //int num;
    string str;
    string user = "dbs211_203a32";
    string pass = "20542156";
    string constr = "myoracle12c.senecacollege.ca:1521/oracle12c";
    Statement* stmt = nullptr;
    // define a reference to an object resultset
    ResultSet* rs = nullptr;

    try {
        env = Environment::createEnvironment(Environment::DEFAULT);
        {
            conn = env->createConnection(user, pass, constr);
            //cout << "Connection is successful" << endl;

          //report 1
            sdds::printHeader("Report 1 (Employee Report)");
            Statement* stmt1 = conn->createStatement();
            ResultSet* rs1 = nullptr;

            stmt1->setSQL("SELECT employeenumber, firstname, lastname, phone, extension FROM employees JOIN offices  using(officecode) WHERE lower(city) = 'san francisco' ORDER BY employeenumber");
            // store the result set
            rs1 = stmt1->executeQuery();
            if (!rs1->next()) {
                // if the result set is empty
                cout << "ResultSet is empty." << endl;
            }
            else {

                do {
                    cout.setf(ios::left);
                    cout.width(15);
                    cout << rs1->getInt(1);
                    cout.width(20);
                    cout << rs1->getString(2);
                    cout.width(20);
                    cout << rs1->getString(3);
                    cout.width(20);
                    cout << rs1->getString(4);
                    cout.width(10);
                    cout << rs1->getString(5) << endl;
                    cout.unsetf(ios::left);
                } while (rs1->next()); //if there is more rows, iterate
                conn->terminateStatement(stmt1); //terminate the statement

                //report 2
                cout << endl;
                sdds::printHeader("Report 2 (Manager Report)"); // print the header

                //set the statement
                Statement* stmt2 = conn->createStatement();
                ResultSet* rs2 = nullptr;
                stmt2->setSQL("SELECT DISTINCT e.reportsto, m.firstname, m.lastname, phone,	m.extension FROM employees e JOIN employees m ON e.reportsto = m.employeenumber JOIN offices o ON m.officecode = o.officecode ORDER BY e.reportsto");
                rs2 = stmt2->executeQuery();
                if (!rs2->next()) {
                    cout << "Result is empty." << endl; // if the result set is empty
                }
                else {
                    do {
                        cout.setf(ios::left);
                        cout.width(15);
                        cout << rs2->getInt(1);
                        cout.width(20);
                        cout << rs2->getString(2);
                        cout.width(20);
                        cout << rs2->getString(3);
                        cout.width(20);
                        cout << rs2->getString(4);
                        cout.width(10);
                        cout << rs2->getString(5) << endl;
                        cout.unsetf(ios::left);
                    } while (rs2->next()); //if there is more rows, iterate
                }
                conn->terminateStatement(stmt2); // terminate the statement
                //terminate the connection and environment
                env->terminateConnection(conn);
                Environment::terminateEnvironment(env);
            }
        }
    }
            catch (SQLException& sqlExcp) {
                cout << sqlExcp.getErrorCode() << ": " << sqlExcp.getMessage();
            }
            return 0;
        }