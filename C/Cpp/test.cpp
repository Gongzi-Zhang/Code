class human {
    public:
       float height, weight;
       void setHeight(float h) { height = h;	}
       virtual void talk()  {	cout << "Ahaa" << endl;	}
       virtual void talk(string msg) {	cout << msg << endl;	}
    private:
       char color;
       void setColor(char c) { color = c;  }
       char getColor() {    return color;	}

};

class student : public human 
{
    public:
	char * school;
	void talk() {	cout << "student~" << endl; }
	void learn() {	cout << "I'm learning~" << endl;    }
};
void test()
{
    student John;
    John.talk();
    John.talk();
    human Lucy = John;
    Lucy.learn();
}
