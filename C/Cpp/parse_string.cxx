void parse_string(string in, vector<string> &out, string de = ",")
{
    // remove space around de
    // space are: "\s", "\t", "\n"
    int is_space(char c)
    {
	if ( c == " " || c == "\t" || c == "\n")
	    return 1;
	else 
	    return 0;
    }

    int find_space(string in, int pos=0)
    {
	// find the first space after(include) pos within a string
	int spos = in.length();   
	int spos_1 = -1;    // space position
	spos_1 = in.find(" ", pos);
	if( (spos_1 > -1) && (spos_1 < spos) )
	    spos = spos_1;
	spos_1 = in.find("\t", pos);
	if( (spos_1 > -1) && (spos_1 < spos) )
	    spos = spos_1;
	spos_1 = in.find("\n", pos);
	if( (spos_1 > -1) && (spos_1 < spos) )
	    spos = spos_1;
	
	if(spos == in.length())
	    return -1;
	else
	    return spos;
    }

    int find_non_space(string in, int pos=0)
    {
	int
    }
    
    // remove space at beginning, if they are
    char c = in.at(0);
    int pos = -1;
    while( is_space(c) )
    {
	in.erase(0,1);
	c = in.at(0);
    }
    pos = find_space(in, 0);
    while ( pos )
    {
	int 
    }
}
