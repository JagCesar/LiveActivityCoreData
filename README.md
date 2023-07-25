# LiveActivityCoreData

This is a sample project demonstrating that CoreData doesn't work with Live Activity and Dynamic Island. This problem only occurs on a real device, in the simulator it works as expected.

The project is using the default CoreData config with some minor modifications, which are listed below.

Modifications:
- Main target and widget extension both have the AppGroup entitlement
- AppGroupPersistentContainer has been created in Persistence.swift, this is requires to add AppGroup support.
- We have to define the MOM when loading the container, see Persistence.swift#46 - Persistence.swift#50
- Moved Live Activity view to LiveActivityView.swift

How to reproduce:
1. Build and run main target
2. Tap + in the top right corner a few times to create a few objects in CoreData
3. Tap “Enable Live Activity”

Expected result:
Live Activity appears on Lock Screen, showing timestamps from the database

Current result:
Live Activity doesn’t appear, neither does dynamic island. If we look in Console.app we see that the Widget extension is unable to load Core Data. Note that the Home Screen widget loads and renders fine.
