// Custom wrapper class for sorting activities
global class ObjectWrapper implements Comparable
{
	public sObject 	record;
	public String   sortField;
	public String   sortDirection;
	public String 	sortValue;

	// Constructor
	global ObjectWrapper(sObject r, String sField, String sDirection)
	{
		record 			= r;
		sortField 		= sField;
		sortDirection 	= sDirection;
		sortValue 		= String.valueOf(record.get(sortField));
	}

	// Custom compare method. Sorts records based on the direction.
	global Integer compareTo(Object compareTo)
	{
		ObjectWrapper compareToObject = (ObjectWrapper)compareTo;

		Integer returnValue;

		if (sortDirection == 'asc')
		{
			if (sortValue > compareToObject.sortValue)
			{
				returnValue = 1;
			}
			else if (sortValue < compareToObject.sortValue)
			{
				returnValue = -1;
			}
			else
			{
				returnValue = 0;
			}
		}
		else
		{
			if (sortValue > compareToObject.sortValue)
			{
				returnValue = -1;
			}
			else if (sortValue < compareToObject.sortValue)
			{
				returnValue = 1;
			}
			else
			{
				returnValue = 0;
			}
		}

		return returnValue;
	}
}