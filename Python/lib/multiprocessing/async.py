#!/usr/bin/python3
import asyncio

async def count():  # async key word to make a funciton async
    print("One")
    await asyncio.sleep(1)  # await keyword, suspend current job and run other jobs
    print("Two")

async def main():
    await asyncio.gather(count(), count(), count())

asyncio.run(main())
