FROM microsoft/dotnet:latest

# Copy the files and folders from current directory to "app" directory
COPY . /app

# Set the working directory as "app" directory
WORKDIR /app

# Run the following commands in Linux Terminal to restore .NET Core packages
#RUN ["dotnet", "restore"]
RUN dotnet restore

# Build the application
RUN dotnet publish -c Release -o out /app

RUN ls /app/
RUN ls /app/WebApplication1/bin/Release/netcoreapp2.0/
# Expose a port number from the container to outside world
EXPOSE 5000

# Determine an entry point of the application.
#ENTRYPOINT ["dotnet", "run", "--server.urls", "http://0.0.0.0:5000"]
# Build runtime image
#FROM microsoft/aspnetcore-build:2.0
#WORKDIR /api
#COPY --from=build-env /app/out .
#COPY /app/bin/Release/netcoreapp2.0/ /app/

ENTRYPOINT dotnet /app/WebApplication1/bin/Release/netcoreapp2.0/WebApplication1.dll
#CMD ["/usr/bin/dotnet", "NotebookAppApi.dll"]
