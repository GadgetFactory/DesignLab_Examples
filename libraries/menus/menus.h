#ifndef __MENUS_H__
#define __MENUS_H__

#ifdef __linux__
#include <stdio.h>
#else
#include <Arduino.h>
#endif

#include <ZPUino_GFX.h>

struct abstractMenuEntry
{
    abstractMenuEntry(const char *title): m_title(title),
        m_next(0)
    {
    }
    virtual bool isSubmenu() const = 0;
    abstractMenuEntry *getNext() { return m_next; }
    bool hasNext() const { return m_next!=NULL; }
    void link(abstractMenuEntry*e) { m_next=e; }
    const char *getTitle() const { return m_title; }
private:
    const char *m_title;
    abstractMenuEntry *m_next;
};

struct subMenu: public abstractMenuEntry
{
    subMenu(const char *title):
        abstractMenuEntry(title), m_selected(0),
        m_children(0),
        m_parent(0)
    {
    }
    int getSelected() const { return m_selected; }
    void setSelected(int v) { m_selected=v; }
    virtual bool isSubmenu() const { return true; }
    abstractMenuEntry *getChild() { return m_children; }
    void appendChild(abstractMenuEntry *child);
    void setParent(abstractMenuEntry *parent) { m_parent=parent; }
    abstractMenuEntry *getParent() const { return m_parent; }
    abstractMenuEntry *at(int index);
    void reset() { m_selected=0; }
private:
    int m_selected;
    abstractMenuEntry *m_children, *m_parent;

};

struct menuItem: public abstractMenuEntry
{
    menuItem(const char *title, void (*func)(void*), void*param=NULL):
        abstractMenuEntry(title), m_callback(func), m_param(param)
    {
    }
    void call() {
        if (m_callback)
            m_callback(m_param);
    }
    virtual bool isSubmenu() const { return false; }
private:
    void (*m_callback)(void*);
    void *m_param;
};


void drawItem(subMenu *menu, abstractMenuEntry *entry, int ypos, bool selected);
void renderSingleSubMenu(subMenu *menu);
void updateMenus();
void moveMenuDown(subMenu *menu);
void moveMenuUp(subMenu *menu);
void moveMenuDown();
void moveMenuUp();
void menuSwitchTo(subMenu *newsubmenu);
void menuExit();
void menuSetTop(subMenu *menu);
void menuReset();
void menuInit(unsigned w,unsigned h);
void menuShowTop();
void menusSetRenderer(ZPUino_GFX*);

void menuAction();
void menuAction(subMenu*);

#endif
