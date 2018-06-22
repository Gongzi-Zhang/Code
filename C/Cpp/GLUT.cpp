#include <GL/glut.h>

static int glutwin;
static float rot = 0;

static void disp(void){
    float scale=0.5;
    /* transform view */
    glLoadIdentity();

    glScalef( scale, scale, scale );
    glRotatef( rot, 1.0, 0.0, 0.0 );
    glRotatef( rot, 0.0, 1.0, 0.0 );
    glRotatef( rot, 0.0, 0.0, 1.0 );
    /* do a clearscreen */
    glClear(GL_COLOR_BUFFER_BIT);

    /* draw something */
    glLineWidth( 3.0 );
    glColor3f( 1., 1., 1. );

    glBegin( GL_LINES );  /* long edges of box */
    glVertex3f( 1.0, 0.6, -0.4 );
    glVertex3f( 1.0, 0.6, 0.4 );
    glVertex3f( 1.0, -0.6, -0.4 );
    glVertex3f( 1.0, -0.6, 0.4 );
    glVertex3f( -1.0, -0.6, 0.4 );
    glVertex3f( -1.0, -0.6, -0.4 );
    glVertex3f( -1.0, 0.6, -0.4 );
    glVertex3f( -1.0, 0.6, 0.4 );
    glEnd();

    glBegin( GL_LINES_LOOP );  /* end cap */
    glVertex3f( 1.0, 0.6, -0.4 );
    glVertex3f( 1.0, -0.6, -0.4 );
    glVertex3f( -1.0, -0.6, -0.4 );
    glVertex3f( -1.0, 0.6, -0.4 );
    glEnd();

    glBegin( GL_LINES_LOOP ); /* other edn cap */
    glVertex3f( 1.0, 0.6, 0.4 );
    glVertex3f( 1.0, -0.6, 0.4 );
    glVertex3f( -1.0, -0.6, 0.4 );
    glVertex3f( -1.0, 0.6, 0.4 );
    glEnd();

    glFlush();

}

static void timeout( int value ){
    rot++; if( rot >= 360. ) rot = 0.;
    glutPostRedisplay();
    glutTimerFunc( 50, timeout, 0 );
}


int main (int argc, char** argv ){
    /* initialize glut */
    glutInit(&argc, argv);
    /* set display mode */
    glutInitDisplayMode( GLUT_RGBA | GLUT_SINGLE );
    /* output window size */
    glutInitWindowSize(500,500);
    glutwin = glutCreateWindow("Running Linux 3D Demo");
    glutDisplayFunc(disp);
    /* define the color we use to clearscreen */
    glClearColor(0., 0., 0., 0.);
    /* timer for animation */
    glutTimerFunc( 0, timeout, 0 );
    /* enter the main loop */
    glutMainLoop();
    return 0;

}
