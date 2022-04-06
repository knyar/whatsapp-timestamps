#!/usr/bin/env python

import sqlite3
from datetime import datetime

APPLE_TIME = datetime.timestamp(datetime(2001, 1, 1))

def export(db):
    contacts = {}
    for r in db.execute("""
            select ZCONTACTJID, ZPARTNERNAME from ZWACHATSESSION
            where ZGROUPINFO is null;
            """):
        contacts[r[0]] = r[1]
    for r in db.execute("""
            SELECT ZTOJID, ZMESSAGEDATE
            from main.ZWAMESSAGE where ZISFROMME=1;"""):
        c = r[0]
        if c not in contacts:
            continue
        ts = APPLE_TIME + r[1]
        print(f"{contacts[c]}|{ts}")
    

if __name__ == "__main__":
    with sqlite3.connect(
        "7c7fba66680ef796b916b067077cc246adacf01d",
    ) as db:
        export(db)
