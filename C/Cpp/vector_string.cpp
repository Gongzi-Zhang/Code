#include <string>

/* this function parse input string into a group of string fields using
 * delimiter of de
 */

/* Right now, the implementation is not perfect which only allow one
 * delimeter and not allow space between word and delimiter. Further
 * update should fix this shortcoming.
 */

void Parser(vector<string>& out, string in, string de = ",")
{
    int pos=0, pos_pre=0;
    while(trut)
    {
	pos = in.find(de, pos_pre);
	if(pos == -1)
	{
	    out.push_back(in.substr(pos_pre, in.size() - pos_pre));
	    break;
	}
	else out.push_back(in.substr(pos_pre, pos_pos_pre));
	pos_pre = pos + 1;
    }
}
