export function DashboardPage() {
  return (
    <div>
      <h1 className="text-3xl font-bold text-gray-900 mb-6">Dashboard</h1>
      <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
        <div className="bg-white p-6 rounded-lg shadow-sm border border-gray-200">
          <h3 className="text-lg font-semibold mb-2">Today's Appointments</h3>
          <p className="text-3xl font-bold text-primary">-</p>
          <p className="text-sm text-muted-foreground mt-2">Placeholder for appointment count</p>
        </div>
        
        <div className="bg-white p-6 rounded-lg shadow-sm border border-gray-200">
          <h3 className="text-lg font-semibold mb-2">Total Patients</h3>
          <p className="text-3xl font-bold text-primary">-</p>
          <p className="text-sm text-muted-foreground mt-2">Placeholder for patient count</p>
        </div>
        
        <div className="bg-white p-6 rounded-lg shadow-sm border border-gray-200">
          <h3 className="text-lg font-semibold mb-2">Pending Records</h3>
          <p className="text-3xl font-bold text-primary">-</p>
          <p className="text-sm text-muted-foreground mt-2">Placeholder for records count</p>
        </div>
      </div>
    </div>
  )
}
