#include "gfxframebuffer.h"
#include "menus.h"

#ifdef __linux__
#include "SDL.h"
#endif

static ZPUino_GFX_class<uint16_t> *gfx;

GFXFramebuffer_class<uint16_t> GFXFrameBuffer;
static abstractMenuEntry *topMenu;
static abstractMenuEntry *currentMenu;

void menusSetRenderer(ZPUino_GFX_class<uint16_t>*g)
{
    gfx=g;
}

void subMenu::appendChild(abstractMenuEntry *child)
{
    abstractMenuEntry *c;

    if (m_children==NULL) {
        m_children=child;
    } else {
        for (c=m_children;c->hasNext(); c=c->getNext());
        c->link(child);
    }
}

void subMenu::deleteChilds()
{
    while (m_children) {
        abstractMenuEntry *e = m_children;
        m_children = m_children->getNext();
        delete(e);
    }
}

abstractMenuEntry* subMenu::at(int index)
{
    abstractMenuEntry *c = NULL;

    for (c=m_children;c->hasNext(); c=c->getNext()) {
        if (index==0)
            return c;
        index--;
    }
    return c;
}

#define TITLEHEIGHT 11
#define TITLEWIDTH 120
#define TITLEXOFFSET 8
#define TITLEYOFFSET 8

#define ITEMOFFSET 7
#define ITEMWIDTH (TITLEWIDTH - ITEMOFFSET - 7)
#define ITEMHEIGHT 9
#define ITEMSEP (ITEMHEIGHT+1)

#define FIRSTITEMVPOS (TITLEHEIGHT+TITLEYOFFSET+1)

//#define ITEMALPHA 0xc0
//#define TITLEALPHA 0xf0
#define TITLECOLOR 0xffff00
#define TITLEBG 0x4f0000

#define ITEMBGCOLORSELECTED 0xff
#define ITEMBGCOLORDESELECTED 0xe0e0e0
#define ITEMFGCOLORSELECTED 0xffff00
#define ITEMFGCOLORDESELECTED 0x040404

void drawItem(subMenu *menu, abstractMenuEntry *entry, int ypos, bool selected)
{
    /* Draw base rectangle */
    //GFXFrameBuffer.setAlpha( TITLEALPHA );
    GFXFrameBuffer.fillRect( TITLEXOFFSET+ITEMOFFSET, ypos, ITEMWIDTH, ITEMHEIGHT ,
                      selected ? ITEMBGCOLORSELECTED : ITEMBGCOLORDESELECTED);

    /* Place title */
    //GFXFrameBuffer.setAlpha(0xff);
    GFXFrameBuffer.setCursor( TITLEXOFFSET+ITEMOFFSET+1,ypos+1);
    GFXFrameBuffer.setTextColor(selected?ITEMFGCOLORSELECTED:ITEMFGCOLORDESELECTED);
    GFXFrameBuffer.print( entry->getTitle() );
    if (entry->isSubmenu()) {
        /* Draw indicator */
        GFXFrameBuffer.setCursor( (ITEMOFFSET+TITLEXOFFSET)+ITEMWIDTH-6,ypos+1);
        //GFXFrameBuffer.setTextColor(0x8080ff);
        GFXFrameBuffer.write('>');
    }
}

void renderSingleSubMenu(subMenu *menu)
{
    int index=0,selection;
    int ypos = FIRSTITEMVPOS;

    GFXFrameBuffer.clear( 0 );
    GFXFrameBuffer.setTransparentColor(0xfefe);
    //GFXFrameBuffer.setAlpha(TITLEALPHA);

    /* Draw top rectangle */
    GFXFrameBuffer.fillRect( TITLEXOFFSET, TITLEYOFFSET, TITLEWIDTH, TITLEHEIGHT , TITLEBG);

    /* Place title */
    GFXFrameBuffer.setCursor(TITLEXOFFSET+2,TITLEYOFFSET+2);
    GFXFrameBuffer.setTextColor(TITLECOLOR);
    GFXFrameBuffer.print( menu->getTitle() );

    /* Draw all children */
    selection = menu->getSelected();

    abstractMenuEntry *ch = menu->getChild();
    while (ch) {
        drawItem( menu, ch, ypos, index==selection);
        ypos+=ITEMSEP;
        index++;
        ch=ch->getNext();
    }
}
void updateMenus()
{

    GFXFrameBuffer.overlayToFramebuffer( *gfx, 0 ,0  );//GFXFrameBuffer.getScreen() );
}

void moveMenuDown()
{
    moveMenuDown((subMenu*)currentMenu);
}

void moveMenuDown(subMenu *menu)
{
    int index = menu->getSelected();
    abstractMenuEntry *entry = menu->at( index );
    if (entry==NULL) {
        return;
    }

    if (entry->hasNext()) {
        /* Deselect...*/
        drawItem(menu, entry, FIRSTITEMVPOS+(index*ITEMSEP), false);
        index++;
        menu->setSelected(index);
        drawItem(menu, entry->getNext(), FIRSTITEMVPOS+(index*ITEMSEP), true);
    }
    updateMenus();
}


void moveMenuUp()
{
    moveMenuUp((subMenu*)currentMenu);
}

void moveMenuUp(subMenu *menu)
{
    int index = menu->getSelected();
    if (index==0)
        return;

    abstractMenuEntry *entry = menu->at( index );
    if (entry==NULL)
        return;
    /* Deselect...*/
    drawItem(menu, entry, FIRSTITEMVPOS+(index*ITEMSEP), false);
    index--;
    menu->setSelected(index);
    drawItem(menu, menu->at(index), FIRSTITEMVPOS+(index*ITEMSEP), true);
    updateMenus();
}

void menuSwitchTo(subMenu *newsubmenu)
{
    currentMenu = newsubmenu;
    newsubmenu->setSelected(0);
    renderSingleSubMenu((subMenu*)currentMenu);
    updateMenus();
}

void menuShowTop()
{
    currentMenu = topMenu;
    ((subMenu*)currentMenu)->setSelected(0);
    renderSingleSubMenu((subMenu*)currentMenu);
    updateMenus();
}

void menuExit()
{
    currentMenu = topMenu;
}

void menuAction()
{
    menuAction((subMenu*)currentMenu);
}

void menuAction(subMenu *menu)
{
    int index = menu->getSelected();
    abstractMenuEntry *e = menu->at( index );
    if (e) {
        if (e->isSubmenu()) {
            subMenu *subm = (subMenu*)e;
            subm->reset();
            menuSwitchTo(subm);
        } else {
            menuItem *entry = (menuItem*)e;
            entry->call();
        }
    }
}

void menuSetTop(subMenu *top)
{
    topMenu=currentMenu=top;
}

void menuReset()
{
    currentMenu=topMenu;
}

void menuInit(unsigned w, unsigned h)
{
    GFXFrameBuffer.begin(w,h);
}

/* Now... font is 5x7. Panel is 96x64.

ideally we can have 7 entries. H size is max 19 chars.
*/
#ifdef __linux__
int main()
{
    SDL_Init(SDL_INIT_VIDEO);
    SDL_EventState(SDL_KEYDOWN,SDL_ENABLE);
    SDL_EventState(SDL_KEYUP,SDL_ENABLE);
    RGBPanel.begin();
    GFXFrameBuffer.begin(96,64);
    //createMenus();
    RGBPanel.clear(0x202020);
    RGBPanel.setTextSize(2);
    RGBPanel.setTextColor(0xffffff);
    RGBPanel.setCursor(0,0);
    RGBPanel.print("_^/////-");
    RGBPanel.apply();

    //currentMenu = topMenu;

    //renderSingleSubMenu((subMenu*)topMenu);
    //updateMenus();
    SDL_Event Event;
    while(1) {
        while(SDL_PollEvent(&Event) != 0) {
            //OnEvent(&Event);
            if(Event.type == SDL_QUIT) return 0;
            if(Event.type == SDL_KEYDOWN) {
                SDL_KeyboardEvent ev = Event.key;

                if (ev.repeat==0) {
                    switch (SDL_GetScancodeFromKey(ev.keysym.sym)) {
                    case SDL_SCANCODE_UP:
                        moveMenuUp((subMenu*)currentMenu);
                        break;
                    case SDL_SCANCODE_DOWN:
                        moveMenuDown((subMenu*)currentMenu);
                        break;
                    case SDL_SCANCODE_RETURN:
                        menuAction((subMenu*)currentMenu);
                        break;
                    default:
                        break;
                    }
                }
            }
        }
        //Loop();
        //Render();
        SDL_Delay(1); // Breath
    }
    //Cleanup();
}
#endif
